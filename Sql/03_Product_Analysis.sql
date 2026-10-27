/*
===========================================================
ONLINE RETAIL SALES ANALYSIS
===========================================================

Analysis Area:
Product Analysis

Objective:
Understand product performance based on revenue,
quantity sold, order frequency, and selling price.

Source Table:
online_retail_db.clean_sales_data

Business Definitions:
- Product = Unique StockCode
- Revenue = Quantity * UnitPrice
- Order = Unique InvoiceNo

===========================================================
*/

USE online_retail_db;


-- =========================================================
-- Q1. How many unique products are there?
-- =========================================================

SELECT
    COUNT(DISTINCT StockCode) AS total_products
FROM clean_sales_data;


-- =========================================================
-- Q2. Which products generate the most revenue?
-- =========================================================

SELECT
    StockCode,
    MAX(Description) AS product_description,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_revenue DESC
LIMIT 10;


-- =========================================================
-- Q3. Which products sell the highest quantity?
-- =========================================================

SELECT
    StockCode,
    MAX(Description) AS product_description,
    SUM(Quantity) AS total_quantity
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_quantity DESC
LIMIT 10;


-- =========================================================
-- Q4. Which products appear in the most orders?
-- =========================================================

SELECT
    StockCode,
    MAX(Description) AS product_description,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_orders DESC
LIMIT 10;


-- =========================================================
-- Q5. What is the average selling price?
-- =========================================================

SELECT
    AVG(UnitPrice) AS average_selling_price
FROM clean_sales_data;


-- =========================================================
-- END OF PRODUCT ANALYSIS
-- =========================================================