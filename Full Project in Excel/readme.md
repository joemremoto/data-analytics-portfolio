In this project, I used the bike_buyers dataset from https://github.com/AlexTheAnalyst/Excel-Tutorial/blob/main/Excel%20Project%20Dataset.xlsx
![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/2cfb4742-664f-489a-891b-31af4e25757d)
I then added empty sheets named Working Sheet, Pivot Table, and Dashboard. I copied the data from bike_buyers to the working sheet so that any steps I take will not alter the original data.
- In the working sheet, check for duplicates. Removed 26 duplicates; 1000 unique values remain.
- In the Marital Status column, spell out M and S as Married and Single. This can be done using Find and Replace, searching by columns and matching case.
- Also spell out Gender from F and M to Female and Male.
- Check that Income is currency.
- Create a new column for age brackets to make Age easier to understand. Use nested if statement. Old if above 54, Middle Age if below 55 and above 30, Adolescent if under 31.
![image](https://github.com/joemremoto/data-analytics-portfolio/assets/170858816/2e5cc876-c603-423c-b78c-f4aea93e3247)
- No cleaning needed in these columns: Children, Education, Occupation, Home Owner, Cars, Commute Distance, Region
