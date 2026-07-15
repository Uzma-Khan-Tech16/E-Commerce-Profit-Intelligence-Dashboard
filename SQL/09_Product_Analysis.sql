USE global_superstore_db;


-- 1. Total Products
SELECT
COUNT(DISTINCT product_id) AS Total_Products
FROM global_superstore;


-- 2. Sales by Category
SELECT
category,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY category
ORDER BY Total_Sales DESC;


-- 3. Profit by Category
SELECT
category,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY category
ORDER BY Total_Profit DESC;


-- 4. Sales by Sub-Category
SELECT
sub_category,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY sub_category
ORDER BY Total_Sales DESC;


-- 5. Profit by Sub-Category
SELECT
sub_category,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY sub_category
ORDER BY Total_Profit DESC;


-- 6. Top 10 Best Selling Products
SELECT
product_name,
ROUND(SUM(sales),2) AS Total_Sales
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 7. Top 10 Most Profitable Products
SELECT
product_name,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Profit DESC
LIMIT 10;


-- 8. Top 10 Loss Making Products
SELECT
product_name,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Profit ASC
LIMIT 10;


-- 9. Top 10 Products by Quantity Sold
SELECT
product_name,
SUM(quantity) AS Total_Quantity
FROM global_superstore
GROUP BY product_name
ORDER BY Total_Quantity DESC
LIMIT 10;


-- 10. Average Sales per Product
SELECT
product_name,
ROUND(AVG(sales),2) AS Average_Sales
FROM global_superstore
GROUP BY product_name
ORDER BY Average_Sales DESC
LIMIT 10;


-- 11. Average Profit per Product
SELECT
product_name,
ROUND(AVG(profit),2) AS Average_Profit
FROM global_superstore
GROUP BY product_name
ORDER BY Average_Profit DESC
LIMIT 10;


-- 12. Products with High Discount
SELECT
product_name,
ROUND(AVG(discount)*100,2) AS Avg_Discount_Percentage
FROM global_superstore
GROUP BY product_name
ORDER BY Avg_Discount_Percentage DESC
LIMIT 10;


-- 13. High Sales but Low Profit Products
SELECT
product_name,
ROUND(SUM(sales),2) AS Total_Sales,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
HAVING SUM(sales) > (
    SELECT AVG(total_sales)
    FROM (
        SELECT SUM(sales) AS total_sales
        FROM global_superstore
        GROUP BY product_name
    ) t
)
AND SUM(profit) < (
    SELECT AVG(total_profit)
    FROM (
        SELECT SUM(profit) AS total_profit
        FROM global_superstore
        GROUP BY product_name
    ) t
)
ORDER BY Total_Sales DESC;


-- 14. Products with Negative Profit
SELECT
product_name,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY Total_Profit;


-- 15. Product Performance Summary
SELECT
product_name,
category,
sub_category,
SUM(quantity) AS Quantity_Sold,
ROUND(SUM(sales),2) AS Total_Sales,
ROUND(SUM(profit),2) AS Total_Profit
FROM global_superstore
GROUP BY product_name, category, sub_category
ORDER BY Total_Sales DESC;


-- 16. Category-wise Average Discount
SELECT
category,
ROUND(AVG(discount)*100,2) AS Avg_Discount
FROM global_superstore
GROUP BY category
ORDER BY Avg_Discount DESC;


-- 17. Sub-Category-wise Average Discount
SELECT
sub_category,
ROUND(AVG(discount)*100,2) AS Avg_Discount
FROM global_superstore
GROUP BY sub_category
ORDER BY Avg_Discount DESC;


-- 18. Top 5 Categories by Quantity Sold
SELECT
category,
SUM(quantity) AS Total_Quantity
FROM global_superstore
GROUP BY category
ORDER BY Total_Quantity DESC
LIMIT 5;


-- 19. Top 5 Sub-Categories by Quantity Sold
SELECT
sub_category,
SUM(quantity) AS Total_Quantity
FROM global_superstore
GROUP BY sub_category
ORDER BY Total_Quantity DESC
LIMIT 5;


-- 20. Product Profit Margin Ranking
SELECT
product_name,
ROUND(AVG(profit_margin),2) AS Avg_Profit_Margin
FROM global_superstore
GROUP BY product_name
ORDER BY Avg_Profit_Margin DESC
LIMIT 10;