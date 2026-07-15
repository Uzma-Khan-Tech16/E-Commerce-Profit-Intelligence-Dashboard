USE global_superstore_db;

-- 1. Total Records

SELECT COUNT(*) AS Total_Records
FROM global_superstore;

-- 2. Table Structure

DESCRIBE global_superstore;

-- 3. Preview Dataset

SELECT *
FROM global_superstore
LIMIT 10;

-- 4. Check Date Range

SELECT
MIN(order_date) AS First_Order_Date,
MAX(order_date) AS Last_Order_Date
FROM global_superstore;

-- 5. Unique Customers

SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore;

-- 6. Unique Products

SELECT COUNT(DISTINCT product_id) AS Total_Products
FROM global_superstore;

-- 7. Unique Markets

SELECT COUNT(DISTINCT market) AS Total_Markets
FROM global_superstore;

-- 8. Unique Regions

SELECT COUNT(DISTINCT region) AS Total_Regions
FROM global_superstore;

-- 9. Duplicate Order IDs

SELECT
order_id,
COUNT(*) AS Duplicate_Count
FROM global_superstore
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 10. Check Missing Values

SELECT
SUM(order_id IS NULL) AS OrderID_Null,
SUM(customer_id IS NULL) AS CustomerID_Null,
SUM(customer_name IS NULL) AS CustomerName_Null,
SUM(order_date IS NULL) AS OrderDate_Null,
SUM(ship_date IS NULL) AS ShipDate_Null,
SUM(sales IS NULL) AS Sales_Null,
SUM(profit IS NULL) AS Profit_Null,
SUM(quantity IS NULL) AS Quantity_Null,
SUM(category IS NULL) AS Category_Null,
SUM(sub_category IS NULL) AS SubCategory_Null
FROM global_superstore;

-- 11. Shipping Days Validation

SELECT
MIN(shipping_days) AS Minimum_Shipping_Days,
MAX(shipping_days) AS Maximum_Shipping_Days,
ROUND(AVG(shipping_days),2) AS Average_Shipping_Days
FROM global_superstore;

SHOW COLUMNS FROM global_superstore;