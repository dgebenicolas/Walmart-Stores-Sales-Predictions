/*This SQL File contains empty tables used to load the Walmart Sales Data */

/*Creating a table Stores to upload the stores.csv data*/
DROP TABLE IF EXISTS Stores
CREATE TABLE Stores (
    Store INT,
    Type CHAR(1),
    Size INT
)
/*Creating a table Features to upload the features.csv data*/
DROP TABLE IF EXISTS Features
CREATE TABLE Features (
    Store INT,
    Date DATE,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    MarkDown1 FLOAT,
    MarkDown2 FLOAT,
    MarkDown3 FLOAT,
    MarkDown4 FLOAT,
    MarkDown5 FLOAT,
    CPI FLOAT,
    Unemployment FLOAT,
    IsHoliday BIT
)
/*Creating a table Stores to upload the train.csv data*/

DROP TABLE IF EXISTS Train
CREATE TABLE Train (
    Store INT,
    Dept INT,
    Date DATE,
    Weekly_Sales FLOAT,
    IsHoliday BIT
)
/*Creating a table Stores to upload the test.csv data*/
DROP TABLE IF EXISTS Test
CREATE TABLE Test (
    Store INT,
    Dept INT,
    Date DATE,
    IsHoliday BIT
)
/*Inserting values from the stores data*/
BULK INSERT Stores
FROM 'C:\CSVDATA\stores_modified.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	);

SELECT * FROM Stores

/*Inserting values from the features data*/
BULK INSERT Features
FROM 'C:\CSVDATA\features_modified.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	);

SELECT * FROM Features


/*Inserting values from the train data*/
BULK INSERT Train
FROM 'C:\CSVDATA\train_modified.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	);
SELECT * FROM Train
/*Inserting values from the test data*/
BULK INSERT Test
FROM 'C:\CSVDATA\test_modified.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	);
SELECT * FROM Test

