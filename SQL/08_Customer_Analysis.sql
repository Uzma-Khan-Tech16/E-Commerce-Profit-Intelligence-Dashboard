USE global_superstore_db;

-- 1. Total Customers
SELECT
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore;

-- 2. Customers by Segment
SELECT
segment,
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore
GROUP BY segment
ORDER BY Total_Customers DESC;

-- 3. Top 10 Customers by Sales
SELECT
customer_name,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY customer_name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 4. Top 10 Customers by Profit
SELECT
customer_name,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY customer_name
ORDER BY Total_Profit DESC
LIMIT 10;

-- 5. Bottom 10 Customers by Profit
SELECT
customer_name,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY customer_name
ORDER BY Total_Profit ASC
LIMIT 10;

-- 6. Customer Lifetime Sales
SELECT
customer_name,
COUNT(DISTINCT order_id) AS Total_Orders,
ROUND(SUM(sales), 2) AS Lifetime_Sales
FROM global_superstore
GROUP BY customer_name
ORDER BY Lifetime_Sales DESC;

-- 7. Customer Lifetime Profit
SELECT
customer_name,
ROUND(SUM(profit), 2) AS Lifetime_Profit
FROM global_superstore
GROUP BY customer_name
ORDER BY Lifetime_Profit DESC;

-- 8. Average Sales per Customer
SELECT
customer_name,
ROUND(AVG(sales), 2) AS Average_Sales
FROM global_superstore
GROUP BY customer_name
ORDER BY Average_Sales DESC;

-- 9. Average Profit per Customer
SELECT
customer_name,
ROUND(AVG(profit), 2) AS Average_Profit
FROM global_superstore
GROUP BY customer_name
ORDER BY Average_Profit DESC;

-- 10. Customers with More Than 5 Orders
SELECT
customer_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM global_superstore
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 5
ORDER BY Total_Orders DESC;

-- 11. Sales by Customer Segment
SELECT
segment,
ROUND(SUM(sales), 2) AS Total_Sales
FROM global_superstore
GROUP BY segment
ORDER BY Total_Sales DESC;

-- 12. Profit by Customer Segment
SELECT
segment,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY segment
ORDER BY Total_Profit DESC;

-- 13. Average Order Value by Customer
SELECT
customer_name,
ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM global_superstore
GROUP BY customer_name
ORDER BY Average_Order_Value DESC;

-- 14. Customers with Negative Profit
SELECT
customer_name,
ROUND(SUM(profit), 2) AS Total_Profit
FROM global_superstore
GROUP BY customer_name
HAVING SUM(profit) < 0
ORDER BY Total_Profit;

-- 15. Top 10 Customers by Quantity Purchased
SELECT
customer_name,
SUM(quantity) AS Total_Quantity
FROM global_superstore
GROUP BY customer_name
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 16. Top Customers by Shipping Cost
SELECT
customer_name,
ROUND(SUM(shipping_cost), 2) AS Total_Shipping_Cost
FROM global_superstore
GROUP BY customer_name
ORDER BY Total_Shipping_Cost DESC
LIMIT 10;

-- 17. Customer Distribution by Country
SELECT
country,
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore
GROUP BY country
ORDER BY Total_Customers DESC;

-- 18. Customer Distribution by Market
SELECT
market,
COUNT(DISTINCT customer_id) AS Total_Customers
FROM global_superstore
GROUP BY market
ORDER BY Total_Customers DESC;

-- 19. Top 10 Customers by Profit Margin
SELECT
customer_name,
ROUND(AVG(profit_margin), 2) AS Avg_Profit_Margin
FROM global_superstore
GROUP BY customer_name
ORDER BY Avg_Profit_Margin DESC
LIMIT 10;

-- 20. Customer Performance Summary
SELECT
customer_name,
COUNT(DISTINCT order_id) AS Orders,
SUM(quantity) AS Quantity,
ROUND(SUM(sales), 2) AS Sales,
ROUND(SUM(profit), 2) AS Profit
FROM global_superstore
GROUP BY customer_name
ORDER BY Sales DESC;