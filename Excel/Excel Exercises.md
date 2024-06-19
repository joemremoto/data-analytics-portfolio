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

# XLOOKUP
In another exercise, I used XLOOKUP in different scenarios. XLOOKUP simplifies many common data analytics tasks in Excel by providing a more intuitive and powerful way to search and retrieve data. Its versatility in handling errors, performing bi-directional lookups, and combining with other functions makes it an indispensable tool for data analysts.

# Conditional Formatting
Conditional formatting is a way to see trend and patterns in data.
- Icon sets: Icon sets use different icons to represent the values in your data, making it easy to quickly interpret the data and identify trends, patterns, or outliers. The basic icons indicate up, down, and middle.
- Color scales: rarely used. Color scales apply a gradient of colors to a range of cells, helping to visualize the distribution and variation of data values. It’s particularly useful for identifying patterns and trends across a dataset.
- Data bars: rarely used. Data bars add a bar inside the cell, proportional to the value in the cell. This helps to compare values side-by-side within the same range, providing an immediate visual comparison.
- Top/Bottom Rules: Top/bottom rules highlight the highest or lowest values in a dataset. This is useful for focusing on outliers, significant data points, or areas that require immediate attention.
- Highlight Cell Rules: used all the time, especially Duplicate Values. Text that Contains is also handy. Highlight cells rules allow you to apply formatting to cells that meet specific criteria, such as being greater than, less than, equal to a certain value, or containing specific text. This is useful for quickly spotting and analyzing key data points.
- Creating New Rules Using Formulas: allows for custom conditional formatting based on complex criteria. This provides flexibility to format cells based on specific conditions that are not covered by the built-in options.

# Charts
In this exercise, I messed with charts in Excel using a sales dataset. The steps include creating a chart from the data, filtering to dictate which datapoints are shown, testing different chart styles, and customizing the chart elements. Charts in Excel are vital tools in data analytics because they turn complex datasets into visual stories that are easy to understand and interpret. They help identify trends, compare data, highlight outliers, summarize information, enhance decision-making, and engage stakeholders effectively. By leveraging various types of charts, analysts can provide deeper insights and more compelling narratives based on their data.
However, I did not bother learning the "Format Chart Area" tool since it is not used in pactrice. Simply, there is no need to adjust the fill, border, shadow, glow etc. of the visualization.

# Data Cleaning
I used a US Presidents dataset in this exercise. There are several things to look for in cleaning data:
1. Formatting Standardization: texts in the same column should have the same format such as all caps or initcap.
2. Additional spaces in texts
3. Currencies: importing in sql can be a problem
4. Dates: always an issue. format correctly.
5. Duplicates
Here are the steps that I took in this exercise:
1. Data > Data Tools > Remove Duplicates
2. Insert a column to the right of 'president' and insert the standardized texts using PROPER(). Can also be upper or lower
![proper](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/dbddbdf6-e74d-4f10-be12-89441e3b0e38)
4. Standardize the 'party' column: apply filter > select only 'Republican' and 'Republicans' in 'party' > update 'republicans' to 'republican'
5. Remove white spaces in 'vice' using TRIM(). This gets rid of extra spaces before, in the middle, and in the end of texts.
![trim](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/e4d54711-3b79-4847-9d7e-110090a2c52e)
6. Change 'salary' from currency to number. This will help sql to assign the correct dtype when importing.
7. Change 'date created' and 'date updated' to short date
8. Delete columns that will not be used.
