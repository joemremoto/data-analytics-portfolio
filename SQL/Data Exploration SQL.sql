/*
Covid 19 Data Exploration 

EXECUTED USING SQL SERVER

Skills used: Updating tables, Joins, CTEs, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

select *
from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4;


-- Select Data that we are going to be starting with

select "location", "date", total_cases, new_cases, total_deaths, "population"
from PortfolioProject..CovidDeaths
order by 1,2;

-- Empty cells in csv were not recognized as null by sql so i had to modify each column
UPDATE PortfolioProject..CovidDeaths
SET new_deaths = NULLIF(new_deaths, '')
WHERE new_deaths = '';


-- Looking at the total cases vs total deaths
-- Shows likelihood of dying if you contract covid in the Philippines

select "location", "date", total_cases, total_deaths,
(CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 as Deathpercentage
from PortfolioProject..covidDeaths
where "location" = 'Philippines'
order by 1,2;


-- Looking at Total Cases vs Population
-- Shows what percentage of the population got covid

select "location", "date", "population", total_cases, 
(CONVERT(float, total_cases) / NULLIF(CONVERT(float, "population"), 0)) * 100 as PercentPopulationInfected
from PortfolioProject..covidDeaths
order by 1,2;


-- Looking at countries with highest infection rate compared to population

select "location", "population", max(total_cases) as HighestInfectionCount, 
max((CONVERT(float, total_cases) / NULLIF(CONVERT(float, "population"), 0))) * 100 as PercentPopulationInfected
from PortfolioProject..covidDeaths
group by "location", "population"
order by PercentPopulationInfected desc;


-- Showing Countries with highest death count per population

select "location", max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..covidDeaths
where continent is not null
group by "location"
order by TotalDeathCount desc;


-- Breaking things downby continent


-- Showing continents with the highest death count per population

select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..covidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc;


-- Global Numbers

select sum(cast(new_cases as int)) as total_cases, sum(cast(new_deaths as int)) as total_deaths,
sum(cast(new_deaths as float))/sum(cast(new_cases as float))*100 as DeathPercentage
from PortfolioProject..covidDeaths
where continent is not null
order by 1,2;


-- Empty cells in csv were not recognized as null by sql so i had to modify each column

UPDATE PortfolioProject..CovidVaccinations
SET new_vaccinations = NULLIF(new_vaccinations, '')
WHERE new_vaccinations = '';


-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

select dea.continent, dea.location, dea.date, population, new_vaccinations,
sum(convert (int, new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location and dea.date=vac.date
where dea.continent is not null
order by 2,3;


-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as(
select dea.continent, dea.location, dea.date, population, new_vaccinations,
sum(convert (bigint, new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location and dea.date=vac.date
where dea.continent is not null
)
select *, (RollingPeopleVaccinated/convert(float, population))*100
from PopvsVac;


-- Using Temp Table to perform Calculation on Partition By in previous query

drop table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
);

Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, cast(dea.date as datetime), cast(population as float), cast(new_vaccinations as float),
sum(convert (float, new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location and dea.date=vac.date
where dea.continent is not null;

select *, (RollingPeopleVaccinated/convert(float, population))*100
from #PercentPopulationVaccinated;


-- Creating View to store data for later visualizations

drop view if exists PercentPopulationVaccinated;

USE PortfolioProject
GO
create view PercentPopulationVaccinated as
select dea.continent, dea.location, cast(dea.date as datetime) as date, cast(population as float) as population,
cast(new_vaccinations as float) as new_vaccinations,
sum(convert (float, new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location and dea.date=vac.date
where dea.continent is not null;

select *
from PercentPopulationVaccinated;