/*This SQL File is contains data processing and feature engineering steps*/

USE [Walmart Sales];

/* creating new table with removed missing values*/
 DROP TABLE IF EXISTS Features_new
 SELECT 
    Store, 
    Date, 
    Temperature, 
    Fuel_Price, 
    ISNULL(MarkDown1, 0) AS MarkDown1, 
    ISNULL(MarkDown2, 0) AS MarkDown2, 
    ISNULL(MarkDown3, 0) AS MarkDown3, 
    ISNULL(MarkDown4, 0) AS MarkDown4, 
    ISNULL(MarkDown5, 0) AS MarkDown5, 
    CPI, 
    Unemployment, 
    IsHoliday
INTO Features_new
FROM 
    Features;


/* Merging the Train, Store and Features Tables */
DROP TABLE IF EXISTS Merge_Train
SELECT Train.Store, Dept, Type, Size, CAST(Train.Date as datetime) as Date, Weekly_Sales, Temperature, Fuel_Price, CPI, Unemployment, 
 Markdown1, Markdown2, Markdown3, Markdown4, Markdown5, Train.IsHoliday 
 INTO Merge_Train
 FROM Train
 JOIN Stores ON Train.Store = Stores.Store
 JOIN Features_new ON Train.Store = Features_new.Store AND Train.Date = Features_new.Date AND Train.IsHoliday = Features_new.IsHoliday

/*Creating Year, Month, Day features*/
ALTER TABLE Merge_Train
ADD YEAR INT, MONTH INT, WEEK INT, DAY INT;

UPDATE Merge_Train
SET YEAR = DATEPART(year, [Date]),
    MONTH = DATEPART(month, [Date]),
    WEEK = DATEPART(week,[DATE]),
    DAY = DATEPART(day,[Date]) ;

SELECT * FROM Merge_Train

/* Merging the Test, Store and Features Tables */
DROP TABLE IF EXISTS Merge_Test
SELECT Test.Store, Dept, Type, Size, CAST(Test.Date as datetime) as Date, Temperature, Fuel_Price, CPI, Unemployment, 
 Markdown1, Markdown2, Markdown3, Markdown4, Markdown5, Test.IsHoliday 
 INTO Merge_Test
 FROM Test
 JOIN Stores ON Test.Store = Stores.Store
 JOIN Features_new ON Test.Store = Features_new.Store AND Test.Date = Features_new.Date AND Test.IsHoliday = Features_new.IsHoliday

/*Creating  Year, Month, Day features*/
ALTER TABLE Merge_Test
ADD YEAR INT, MONTH INT, WEEK INT, DAY INT;



UPDATE Merge_Test
SET YEAR = DATEPART(year, [Date]),
    MONTH = DATEPART(month, [Date]),
	WEEK = DATEPART(week,[DATE]),
	DAY = DATEPART(day,[Date]) ;



SELECT * FROM Merge_Test


