# Walmart-Stores-Sales-Predictions

## Overview
This project focuses on predicting the department-wide sales for 45 Walmart stores, considering various factors such as promotional markdown events, store type and size, regional activities, temperature, fuel price, and more. Through comprehensive data analysis and machine learning techniques, the model aims to understand the underlying patterns in sales data, including the challenging aspect of capturing seasonal variations.

The repository is organized into four main files, each dedicated to specific tasks in the project pipeline:

## 1. WALMART SALES DATA PROCESSING.sql
This SQL file is responsible for initial data processing, handling missing values, joining datasets, and feature engineering. It includes creating additional features such as YEAR, MONTH, DAY, and WEEK from the DATE column.

## 2. WALMART SALES TABLES.sql
This script focuses on the creation of empty tables corresponding to different datasets and performing bulk insertions of Walmart's CSV data into these tables. It lays the groundwork for further processing and analysis.

## 3. WALMART SALES EXPLORATORY.sql
This file contains SQL queries specifically designed to prepare dataframes for visualizations in Python. The exploration includes analyzing data distribution, linear relationships, feature correlation, and the effects of seasonality on sales.

## 4. Walmart_Sales_Forecasting.ipynb
This Jupyter Notebook contains all the Python tasks, from data visualization to building and tuning machine learning models. The use of AutoML for model comparison and feature importance evaluation, as well as the final XGBoost model with an RMSE of $2968.84 and R-squared value of 0.9830, are detailed in this notebook.

## Results
The project achieved impressive results, with the final model capturing 98.3% of the variance in weekly sales, providing valuable insights for inventory management and business decision-making. Potential areas for further improvement, including enhanced modeling of seasonality, are also discussed.

## Getting Started
Clone the repository to your local machine.
<br>
Execute the SQL files in the following order:
<br>
WALMART SALES TABLES.sql
<br>
WALMART SALES DATA PROCESSING.sql
<br>
WALMART SALES EXPLORATORY.sql
<br>
Run the Walmart_Sales_Forecasting.ipynb notebook to visualize the data and execute the machine learning tasks.
## Dependencies
SQL Server
<br>
Python 3.x
<br>
Jupyter Notebook
<br>
Libraries: pandas, numpy, scikit-learn, AutoML, XGBoost, matplotlib, seaborn
<br>
License
<br>
This project is open-sourced under the MIT License.

## Author
Dgebe Nicolas
