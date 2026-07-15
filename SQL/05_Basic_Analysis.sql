USE global_superstore_db;

-- BUSINESS KPIs

-- Total Sales
SELECT
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore;

-- Total Profit
SELECT
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore;

-- Total Orders
SELECT
COUNT(DISTINCT order_id) AS Total_Orders
FROM global_superstore;

-- Total Customers
SELECT
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore;

-- Total Products
SELECT
COUNT(DISTINCT product_id) AS Total_Products
FROM global_superstore;

-- Total Quantity Sold
SELECT
SUM(quantity) AS Total_Quantity
FROM global_superstore;

-- Average Order Value
SELECT
ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM global_superstore;

-- Profit Margin %
SELECT
ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin_Percentage
FROM global_superstore;

-- Average Discount
SELECT
ROUND(AVG(discount) * 100, 2) AS Average_Discount_Percentage
FROM global_superstore;

-- Average Shipping Days
SELECT
ROUND(AVG(shipping_days), 2) AS Average_Shipping_Days
FROM global_superstore;