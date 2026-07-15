USE global_superstore_db;

-- 1. Total Profit
SELECT
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore;

-- 2. Profit by Category
SELECT
category,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY category
ORDER BY Total_Profit DESC;

-- 3. Profit by Sub-Category
SELECT
sub_category,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY sub_category
ORDER BY Total_Profit DESC;

-- 4. Profit by Market
SELECT
market,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY market
ORDER BY Total_Profit DESC;

-- 5. Profit by Region
SELECT
region,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY region
ORDER BY Total_Profit DESC;

-- 6. Profit by Country
SELECT
country,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY country
ORDER BY Total_Profit DESC;

-- 7. Top 10 Most Profitable Countries
SELECT
country,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY country
ORDER BY Total_Profit DESC
LIMIT 10;

-- 8. Bottom 10 Countries by Profit
SELECT
country,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY country
ORDER BY Total_Profit ASC
LIMIT 10;

-- 9. Top 10 Most Profitable Products
SELECT
product_name,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Profit DESC
LIMIT 10;

-- 10. Top 10 Loss-Making Products
SELECT
product_name,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Profit ASC
LIMIT 10;

-- 11. Average Profit Per Order
SELECT
ROUND(AVG(profit), 2) AS Average_Profit
FROM global_superstore;

-- 12. Maximum Profit Earned
SELECT
MAX(profit) AS Highest_Profit
FROM global_superstore;

-- 13. Maximum Loss Incurred
SELECT
MIN(profit) AS Biggest_Loss
FROM global_superstore;

-- 14. Profit by Customer Segment
SELECT
segment,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY segment
ORDER BY Total_Profit DESC;

-- 15. Profit by Ship Mode
SELECT
ship_mode,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY ship_mode
ORDER BY Total_Profit DESC;

-- 16. Average Profit Margin
SELECT
ROUND(AVG(profit_margin), 2) AS Avg_Profit_Margin
FROM global_superstore;

-- 17. Products With Negative Profit
SELECT
product_name,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY Total_Profit;

-- 18. Categories With Negative Profit
SELECT
category,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY category
HAVING SUM(profit) < 0;

-- 19. High Sales But Low Profit Products
SELECT
product_name,
ROUND(SUM(sales), 2) AS Total_Sales,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 20;

-- 20. Profit Trend By Year
SELECT
order_year,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY order_year
ORDER BY order_year;