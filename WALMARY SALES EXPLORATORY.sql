/*This SQL File contains queries that will then be stored in pandas dataframes and used for visulaisations in python*/

USE [Walmart Sales];
/* Number of missing values in the features table*/
SELECT SUM(CASE WHEN MarkDown1 is null THEN 1 ELSE 0 END) as num_missing_values1,
 SUM(CASE WHEN MarkDown2 is null THEN 1 ELSE 0 END) as num_missing_values2,
 SUM(CASE WHEN MarkDown3 is null THEN 1 ELSE 0 END) as num_missing_values3,
 SUM(CASE WHEN MarkDown4 is null THEN 1 ELSE 0 END) as num_missing_values4,
 SUM(CASE WHEN MarkDown5 is null THEN 1 ELSE 0 END) as num_missing_values5
  FROM Features;
/* From this query we see that there are many missing values that will have to be cleaned from the MarkDown columns*/



/*Distribution of weekly sales across only depertment wide*/
SELECT Store, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
GROUP BY Store
ORDER BY AVG(Weekly_Sales) DESC;

/*Sales per department*/
SELECT Dept, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
GROUP BY Dept
ORDER BY AVG(Weekly_Sales) DESC;

/*Average Weekly Sales for each type of store*/
SELECT Type, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
GROUP BY Type
ORDER BY AVG(Weekly_Sales) DESC;

/*Average Monthly Sales for 2010*/
SELECT MONTH, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
WHERE YEAR = 2010
GROUP BY MONTH

/*Average Monthly Sales for 2011*/

SELECT MONTH, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
WHERE YEAR = 2011
GROUP BY MONTH

/*Average Monthly Sales for 2012*/

SELECT MONTH, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
WHERE YEAR = 2012
GROUP BY MONTH

/*Average Weekly Sales for 2010*/
SELECT WEEK, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
WHERE YEAR = 2010
GROUP BY WEEK
ORDER BY WEEK ASC;

/*Average Weekly Sales for 2011*/

SELECT WEEK, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
WHERE YEAR = 2011
GROUP BY WEEK
ORDER BY WEEK ASC;

/*Average Weekly Sales for 2012*/

SELECT WEEK, AVG(Weekly_Sales) as AVG_weekly_sales FROM Merge_Train
WHERE YEAR = 2012
GROUP BY WEEK
ORDER BY WEEK ASC;


/*Distribution of store sizes*/
SELECT Size, COUNT(*) as Number_stores FROM Stores
GROUP BY Size
ORDER BY COUNT(*) DESC;

/*Distribution of store types*/
SELECT Type, COUNT(*) as Count FROM Stores
GROUP BY Type
ORDER BY COUNT(*) DESC;

/*Impact of holidays on Sales*/
SELECT IsHoliday, AVG(Weekly_Sales) as AVG_Weekly_Sales FROM Train
GROUP BY IsHoliday
ORDER BY AVG(Weekly_Sales) DESC;

/*Average weekly sales with respect to external factors*/
SELECT AVG(Weekly_Sales) as Avg_Weekly_Sales, AVG(Temperature) as temp, AVG(Fuel_Price) as fuel_price, AVG(CPI) as CPI, AVG(Unemployment) as unemployment
FROM Train JOIN Features ON Train.Store = Features.Store AND Train.Date = Features.Date
GROUP BY Temperature, Fuel_Price, CPI, Unemployment
ORDER BY Avg_Weekly_Sales DESC;

/*Effect of markdowns on weekly sales*/

SELECT AVG(Weekly_Sales) as Avg_Weekly_Sales, AVG(MarkDown1) as Avg_Markdown1, AVG(MarkDown2) as AVG_Markdown_2, AVG(MarkDown3) as Markdown_3,
AVG(MarkDown4) as Avg_Markdown4, AVG(MarkDown5) as Avg_Markdown5 FROM Train Join Features ON Train.Store = Features.Store AND Train.Date = Features.Date
WHERE MarkDown1 IS NOT NULL OR MarkDown2 IS NOT NULL OR MarkDown3 IS NOT NULL OR MarkDown4 IS NOT NULL OR MarkDown5 IS NOT NULL
GROUP BY MarkDown1, MarkDown2, MarkDown3, MarkDown4, MarkDown5;

/*Quering A Table that shows Weekly Sales Vs Markdown relationship*/
SELECT WEEK, AVG(Weekly_Sales) as Avg_Weekly_Sales, AVG(MarkDown1) as MarkDown1, AVG(MarkDown2) as MarkDown2, AVG(MarkDown3) as MarkDown3, AVG(MarkDown4) as MarkDown4, AVG(MarkDown5) as MarkDown5 FROM Merge_Train
GROUP BY WEEK
ORDER BY WEEK ASC;