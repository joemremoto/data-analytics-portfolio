In this project, I used the bike_buyers dataset from https://github.com/AlexTheAnalyst/Excel-Tutorial/blob/main/Excel%20Project%20Dataset.xlsx
![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/2cfb4742-664f-489a-891b-31af4e25757d)

I then added empty sheets named Working Sheet, Pivot Table, and Dashboard.

I copied the data from bike_buyers to the working sheet so that any steps I take will not alter the original data.
- In the working sheet, check for duplicates. Removed 26 duplicates; 1000 unique values remain.
- In the Marital Status column, spell out M and S as Married and Single. This can be done using Find and Replace, searching by columns and matching case.
- Also spell out Gender from F and M to Female and Male.
- Check that Income is currency.
- Create a new column for age brackets to make Age easier to understand. Use nested if statement. Old if above 54, Middle Age if below 55 and above 30, Adolescent if under 31.
![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/2e5cc876-c603-423c-b78c-f4aea93e3247)
- No cleaning needed in these columns: Children, Education, Occupation, Home Owner, Cars, Commute Distance, Region

Now, the data will be used to create pivot tables. Pivot tables will be used to build the dashboard.
- Look at the average income of people that bought bikes vs people that did not buy bikes grouped by Gender. Create a pivot table then use it for visualizatiion.

![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/f11b0247-e10e-40ec-9249-b93b21a627bd)
![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/2d450af7-c9ea-4ae8-8e37-88d5b4cece01)

- Look at commute distance

![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/e9cd8655-1445-4045-aa84-b36c69c36a6e)

- Look at age brackets
![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/07060c7c-b4c1-4f50-b8cb-9e8342bb5825)

- Let us compare the visualization if we used Age instead of Age Brackets. The figure below is messier and harder to understand than the bar chart above.

![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/22f24448-82c6-4ff6-ae34-cdff142e0b6a)


- Note that all the charts were bar charts since we were trying to relate a numeric variable vs a categorical variable for each visualization.

Now the dashboard will be built.
- Copy the visualizations into the dashboard sheet.
- Get rid of the gridlines
- Make a header
- Align the charts
- One field that could be interesting is marital status. So we add it. Click on a chart. PivotChart Analyze > Insert Slicer > Marital Status
- Click on Marital Status > Slicer > Report Connections > Apply to all pivot tables
- Do the same for region and education

## Finished Product

![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/ccd9716d-a0bd-4265-b33c-3dfc8fcbe47d)

