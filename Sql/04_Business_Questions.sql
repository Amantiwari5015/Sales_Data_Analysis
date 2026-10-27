/*
===========================================================
ONLINE RETAIL SALES ANALYSIS
===========================================================

Analysis Area:
Business Questions

Objective:
Answer practical business questions using sales,
customer, country, and product data.

Source Table:
online_retail_db.clean_sales_data

Business Definitions:
- Revenue = Quantity * UnitPrice
- Order = Unique InvoiceNo
- Customer = Unique non-null CustomerID
- Product = Unique StockCode
- Repeat Customer = Customer with more than 1 unique order

===========================================================
*/

USE online_retail_db;


-- =========================================================
-- Q1. Which month generated the highest revenue?
-- =========================================================
-- Business Purpose:
-- Identify the strongest sales period.
-- =========================================================

SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS sales_month,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY total_revenue DESC
LIMIT 1;


-- =========================================================
-- Q2. Which country contributes the most revenue?
-- =========================================================
-- Business Purpose:
-- Identify the strongest geographical market.
-- =========================================================

SELECT
    Country,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 1;


-- =========================================================
-- Q3. How dependent is the business on its top 10 customers?
-- =========================================================
-- Business Purpose:
-- Understand customer revenue concentration.
-- =========================================================

SELECT
    SUM(total_revenue) AS top_10_customer_revenue,
    (
        SELECT SUM(Revenue)
        FROM clean_sales_data
        WHERE CustomerID IS NOT NULL
    ) AS total_customer_revenue,
    (
        SUM(total_revenue) /
        (
            SELECT SUM(Revenue)
            FROM clean_sales_data
            WHERE CustomerID IS NOT NULL
        )
    ) * 100 AS top_10_customer_revenue_percentage
FROM
(
    SELECT
        CustomerID,
        SUM(Revenue) AS total_revenue
    FROM clean_sales_data
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
    ORDER BY total_revenue DESC
    LIMIT 10
) AS top_customers;


-- =========================================================
-- Q4. What percentage of customers are repeat customers?
-- =========================================================
-- Business Purpose:
-- Understand customer retention and repeat purchasing.
-- =========================================================

SELECT
    (
        SUM(
            CASE
                WHEN total_orders > 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*)
    ) * 100 AS repeat_customer_percentage
FROM
(
    SELECT
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS total_orders
    FROM clean_sales_data
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
) AS customer_orders;


-- =========================================================
-- Q5. Which products have high sales volume
--     but relatively low revenue?
-- =========================================================
-- Business Purpose:
-- Identify high-volume, low-value products.
-- =========================================================

SELECT
    StockCode,
    MAX(Description) AS product_description,
    SUM(Quantity) AS total_quantity,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_quantity DESC
LIMIT 10;


-- =========================================================
-- Q6. Which products generate high revenue
--     with relatively low sales quantity?
-- =========================================================
-- Business Purpose:
-- Identify high-value products.
-- =========================================================

SELECT
    StockCode,
    MAX(Description) AS product_description,
    SUM(Quantity) AS total_quantity,
    SUM(Revenue) AS total_revenue
FROM clean_sales_data
GROUP BY StockCode
ORDER BY total_revenue DESC
LIMIT 10;


-- =========================================================
-- END OF BUSINESS QUESTIONS
-- =========================================================