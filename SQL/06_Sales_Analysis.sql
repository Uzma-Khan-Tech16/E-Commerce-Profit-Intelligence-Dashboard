USE global_superstore_db;

-- 1. Total Sales by Year
SELECT
order_year,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY order_year
ORDER BY order_year;

-- 2. Total Sales by Month
SELECT
order_month,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY order_month
ORDER BY order_month;

-- 3. Total Sales by Month Name
SELECT
month_name,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY month_name
ORDER BY MIN(month_name);

-- 4. Total Sales by Quarter
SELECT
quarter,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY quarter
ORDER BY quarter;

-- 5. Sales by Category
SELECT
category,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY category
ORDER BY Total_Sales DESC;

-- 6. Sales by Sub-Category
SELECT
sub_category,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY sub_category
ORDER BY Total_Sales DESC;

-- 7. Sales by Market
SELECT
market,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY market
ORDER BY Total_Sales DESC;

-- 8. Sales by Region
SELECT
region,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY region
ORDER BY Total_Sales DESC;

-- 9. Sales by Country
SELECT
country,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY country
ORDER BY Total_Sales DESC;

-- 10. Top 10 Countries by Sales
SELECT
country,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY country
ORDER BY Total_Sales DESC
LIMIT 10;

-- 11. Bottom 10 Countries by Sales
SELECT
country,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY country
ORDER BY Total_Sales ASC
LIMIT 10;

-- 12. Top 10 Cities by Sales
SELECT
city,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY city
ORDER BY Total_Sales DESC
LIMIT 10;

-- 13. Bottom 10 Cities by Sales
SELECT
city,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY city
ORDER BY Total_Sales ASC
LIMIT 10;

-- 14. Sales by Ship Mode
SELECT
ship_mode,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY ship_mode
ORDER BY Total_Sales DESC;

-- 15. Sales by Customer Segment
SELECT
segment,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY segment
ORDER BY Total_Sales DESC;

-- 16. Average Sales per Order
SELECT
ROUND(AVG(sales), 2) AS Average_Sales
FROM global_superstore;

-- 17. Highest Single Order Sale
SELECT
MAX(sales) AS Highest_Sale
FROM global_superstore;

-- 18. Lowest Single Order Sale
SELECT
MIN(sales) AS Lowest_Sale
FROM global_superstore;

-- 19. Monthly Sales Trend (Year-Month)
SELECT
order_year,
month_name,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY order_year, month_name
ORDER BY order_year, month_name;

-- 20. Average Sales by Category
SELECT
category,
ROUND(AVG(sales), 2) AS Average_Sales
FROM global_superstore
GROUP BY category
ORDER BY Average_Sales DESC;