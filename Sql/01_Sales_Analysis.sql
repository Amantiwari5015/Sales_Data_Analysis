/*
===========================================================
ONLINE RETAIL SALES ANALYSIS
===========================================================

Analysis Area:
Sales Analysis

Objective:
Analyze the overall sales performance of the business
using key business questions.

Source Table:
online_retail_db.clean_sales_data

Business Definitions:
- Revenue = Quantity * UnitPrice
- Order = Unique InvoiceNo
- Customer = Unique CustomerID
- Product = Unique StockCode
- AOV = Total Revenue / Total Orders

===========================================================
*/

USE online_retail_db;


/*
===========================================================
Q1. What is the total revenue generated?
===========================================================
*/

SELECT
    SUM(Revenue) AS total_revenue
FROM clean_sales_data;


/*
===========================================================
Q2. How many orders were placed?
===========================================================
*/

SELECT
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM clean_sales_data;



/*
===========================================================
Q3. What is the average order value?
===========================================================
*/

SELECT
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS average_order_value
FROM clean_sales_data;


/*
===========================================================
Q4. Which month generated the highest revenue?
===========================================================
*/

SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS sales_month,
    SUM(Revenue) AS monthly_revenue
FROM clean_sales_data
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 1;


/*
===========================================================
Q5. Which countries generated the highest revenue?
===========================================================
*/

SELECT
    Country,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;



/*
===========================================================
Q6. Which products generated the highest revenue?
===========================================================
*/

SELECT
    StockCode,
    MAX(Description) AS product_description,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_revenue DESC
LIMIT 10;


/*
===========================================================
Q7. Which products were sold in the highest quantity?
===========================================================
*/

SELECT
    StockCode,
    MAX(Description) AS product_description,
    SUM(Quantity) AS total_quantity
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_quantity DESC
LIMIT 10;