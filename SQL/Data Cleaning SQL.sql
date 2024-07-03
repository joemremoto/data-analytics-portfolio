/*

Cleaning Data in SQL Server

*/

select *
from PortfolioProject..NashvilleHousing


---------------------------------------------------------------------------------------------------------------------

-- Satandardize Date Format

select SaleDateConvert, convert(date, SaleDate)
from PortfolioProject..NashvilleHousing

update NashvilleHousing
set SaleDate = convert(date, SaleDate)

-- Alternatively

alter table NashvilleHousing
add SaleDateConvert date

update NashvilleHousing
set SaleDateConvert = convert(date, SaleDate)


---------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

select *
from PortfolioProject..NashvilleHousing
order by ParcelID

-- Prorperty Address is based on ParcelID
-- The query below could alternatively use a join but is not needed

select isnull(n1.PropertyAddress, n2.PropertyAddress), n1.PropertyAddress
from PortfolioProject..NashvilleHousing n1, PortfolioProject..NashvilleHousing n2
where n1.UniqueID <> n2.UniqueID and n1.ParcelID = n2.ParcelID and n1.PropertyAddress is null


update n1
set PropertyAddress = isnull(n1.PropertyAddress, n2.PropertyAddress)
from PortfolioProject..NashvilleHousing n1, PortfolioProject..NashvilleHousing n2
where n1.UniqueID <> n2.UniqueID and n1.ParcelID = n2.ParcelID and n1.PropertyAddress is null;


---------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

-- Property Address uses comma as delimiter
-- charindex returns an integer describing the location of comma, -1 so the comma is not included in the substring

select
substring(PropertyAddress, 1, (charindex(',', PropertyAddress)-1)) as Address,
substring(PropertyAddress, (charindex(',', PropertyAddress)+1), len(PropertyAddress)) as Address2
from PortfolioProject..NashvilleHousing;

alter table PortfolioProject..NashvilleHousing
add PropertySplitAddress nvarchar(255);

update PortfolioProject..NashvilleHousing
set PropertySplitAddress = substring(PropertyAddress, 1, (charindex(',', PropertyAddress)-1))

alter table PortfolioProject..NashvilleHousing
add PropertySplitCity nvarchar(255);

update PortfolioProject..NashvilleHousing
set PropertySplitCity = substring(PropertyAddress, (charindex(',', PropertyAddress)+1), len(PropertyAddress))


select *
from PortfolioProject..NashvilleHousing

select
parsename(replace(OwnerAddress, ',', '.'), 3),
parsename(replace(OwnerAddress, ',', '.'), 2),
parsename(replace(OwnerAddress, ',', '.'), 1)
from PortfolioProject..NashvilleHousing


alter table PortfolioProject..NashvilleHousing
add OwnerSplitAddress nvarchar(255);

alter table PortfolioProject..NashvilleHousing
add OwnerSplitCity nvarchar(255);

alter table PortfolioProject..NashvilleHousing
add OwnerSplitState nvarchar(255);

update PortfolioProject..NashvilleHousing
set OwnerSplitAddress = parsename(replace(OwnerAddress, ',', '.'), 3)

update PortfolioProject..NashvilleHousing
set OwnerSplitCity = parsename(replace(OwnerAddress, ',', '.'), 2)

update PortfolioProject..NashvilleHousing
set OwnerSplitState = parsename(replace(OwnerAddress, ',', '.'), 1)


---------------------------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in '"Sold as Vacant" field

select distinct(SoldAsVacant), count(SoldAsVacant)
from PortfolioProject..NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant,
case
	when SoldAsVacant = 'Y' then 'YES'
	when SoldAsVacant = 'N' then 'NO'
	else SoldAsVacant
end
from PortfolioProject..NashvilleHousing

update PortfolioProject..NashvilleHousing
set SoldAsVacant = case
	when SoldAsVacant = 'Y' then 'YES'
	when SoldAsVacant = 'N' then 'NO'
	else SoldAsVacant
end


---------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates (not a standard practice)

with RowNumCTE as(
select *,
	row_number() over(
	partition by ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference order by UniqueID) row_num
from PortfolioProject..NashvilleHousing
)
delete
from RowNumCTE
where row_num > 1


---------------------------------------------------------------------------------------------------------------------

-- Delete Unused Columns (usually done on views, not raw data)

alter table PortfolioProject..NashvilleHousing
drop column OwnerAddress, PropertyAddress, TaxDistrict, SaleDate

alter table PortfolioProject..NashvilleHousing
drop column SaleDate

select *
from PortfolioProject..NashvilleHousing