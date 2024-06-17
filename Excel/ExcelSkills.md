# Pivot Tables
Pivot tables are indispensable for data analysis as they make complex data easy to understand and actionable. In this exercise, I downloaded a global bike sales dataset from https://www.kaggle.com/code/sadiqshah/bike-store-sales-in-europe/notebook.
The original csv file looks like this:
![orignal_bikes](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/be135121-a16e-4d38-a1c0-313fbf14be1e)

Using this data, I inserted a pivot table in another sheet where I grouped the data by country then state. I then assigned the values to Revenue, Cost, and Profit. I also filtered by Customer_Gender to gauge whether the Female or Male paid more money.

![pivot_bikes](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/e54b54c3-77a6-486f-89ef-d100e1688304)

I also inserted a calculated field to get the calculated sum of profit (revenue - cost) and compare it with the data from the csv file. The image below shows that
the values are the same.

![calculated_field](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/6063bbb4-950c-4ec4-b129-499d51566aa5)

# Formulas
In this exercise, I applied the most useful Excel formulas for data analysis.

- Max-Min: The MAX and MIN formulas help identify the range and outliers in a dataset by providing the highest and lowest values, respectively.

- If-Ifs: The IF and IFS formulas allow for conditional analysis, enabling the creation of logical tests to make decisions based on specific criteria.

- Len: The LEN formula is useful for data validation and cleanup by determining the length of text strings, which can help identify anomalies or ensure data consistency.

- Left-Right: The LEFT and RIGHT formulas extract specific portions of text from the beginning or end of a string, which is useful for parsing and standardizing data.

- Text: The TEXT formula converts numbers and dates into formatted text, aiding in the creation of readable and standardized reports.

- Trim: The TRIM formula removes extra spaces from text, ensuring data cleanliness and consistency, which is crucial for accurate analysis.

- Concat: The CONCAT formula (or CONCATENATE in older versions) combines multiple text strings into one, useful for merging data from different sources or fields.

- Substitute: The SUBSTITUTE formula replaces occurrences of specified text within a string, facilitating data correction and standardization.

- Sum-SumIf: The SUM and SUMIF formulas calculate the total of values, with SUMIF adding the capability to sum values based on specified conditions, essential for targeted data analysis.

- Count-CountIf: The COUNT and COUNTIF formulas count the number of cells containing numbers, with COUNTIF adding the ability to count based on specific criteria, useful for data segmentation.

- Days-NetworkDays: The DAYS and NETWORKDAYS formulas calculate the number of days between dates, with NETWORKDAYS excluding weekends and holidays, aiding in project management and timeline analysis.
