USE global_superstore_db;

-- 1. Total Sales by Market
SELECT
market,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY market
ORDER BY Total_Sales DESC;


-- 2. Total Profit by Market
SELECT
market,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY market
ORDER BY Total_Profit DESC;


-- 3. Total Orders by Market
SELECT
market,
COUNT(DISTINCT order_id) AS Total_Orders
FROM global_superstore
GROUP BY market
ORDER BY Total_Orders DESC;


-- 4. Total Sales by Region
SELECT
region,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY region
ORDER BY Total_Sales DESC;


-- 5. Total Profit by Region
SELECT
region,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY region
ORDER BY Total_Profit DESC;


-- 6. Total Orders by Region
SELECT
region,
COUNT(DISTINCT order_id) AS Total_Orders
FROM global_superstore
GROUP BY region
ORDER BY Total_Orders DESC;


-- 7. Top 10 Countries by Sales
SELECT
country,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY country
ORDER BY Total_Sales DESC
LIMIT 10;


-- 8. Top 10 Countries by Profit
SELECT
country,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY country
ORDER BY Total_Profit DESC
LIMIT 10;


-- 9. Bottom 10 Countries by Profit
SELECT
country,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY country
ORDER BY Total_Profit ASC
LIMIT 10;


-- 10. Top 10 Cities by Sales
SELECT
city,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY city
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================

-- 11. Top 10 Cities by Profit
SELECT
city,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY city
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================

-- 12. Bottom 10 Cities by Profit
SELECT
city,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY city
ORDER BY Total_Profit ASC
LIMIT 10;

-- ==========================================

-- 13. Average Sales by Market
SELECT
market,
ROUND(AVG(sales),2) AS Average_Sales
FROM global_superstore
GROUP BY market
ORDER BY Average_Sales DESC;

-- ==========================================

-- 14. Average Profit by Market
SELECT
market,
ROUND(AVG(profit),2) AS Average_Profit
FROM global_superstore
GROUP BY market
ORDER BY Average_Profit DESC;

-- ==========================================

-- 15. Sales by State
SELECT
state,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================

-- 16. Profit by State
SELECT
state,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY state
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================

-- 17. Number of Customers by Country
SELECT
country,
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore
GROUP BY country
ORDER BY Total_Customers DESC;

-- ==========================================

-- 18. Number of Customers by Market
SELECT
market,
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore
GROUP BY market
ORDER BY Total_Customers DESC;

-- ==========================================

-- 19. Market Performance Summary
SELECT
market,
COUNT(DISTINCT order_id) AS Orders,
COUNT(DISTINCT customer_id) AS Customers,
ROUND(SUM(sales),2) AS Sales,
ROUND(SUM(profit),2) AS Profit
FROM global_superstore
GROUP BY market
ORDER BY Sales DESC;

-- ==========================================

-- 20. Region Performance Summary
SELECT
region,
COUNT(DISTINCT order_id) AS Orders,
COUNT(DISTINCT customer_id) AS Customers,
ROUND(SUM(sales),2) AS Sales,
ROUND(SUM(profit),2) AS Profit
FROM global_superstore
GROUP BY region
ORDER BY Sales DESC;