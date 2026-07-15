USE global_superstore_db;


-- 1. Top 10 Customers by Sales using RANK()

SELECT
customer_name,
ROUND(SUM(sales),2) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
FROM global_superstore
GROUP BY customer_name;


-- 2. Top 10 Products by Profit using DENSE_RANK()

SELECT
product_name,
ROUND(SUM(profit),2) AS total_profit,
DENSE_RANK() OVER(ORDER BY SUM(profit) DESC) AS profit_rank
FROM global_superstore
GROUP BY product_name;


-- 3. Row Number for Customers

SELECT
customer_name,
SUM(sales) AS total_sales,
ROW_NUMBER() OVER(ORDER BY SUM(sales) DESC) AS row_num
FROM global_superstore
GROUP BY customer_name;


-- 4. Running Total of Sales by Year

SELECT
order_year,
SUM(sales) AS yearly_sales,
SUM(SUM(sales)) OVER(ORDER BY order_year) AS running_sales
FROM global_superstore
GROUP BY order_year;


-- 5. Running Total of Profit by Year

SELECT
order_year,
SUM(profit) AS yearly_profit,
SUM(SUM(profit)) OVER(ORDER BY order_year) AS running_profit
FROM global_superstore
GROUP BY order_year;


-- 6. Monthly Sales Trend using Window Function

SELECT
order_year,
order_month,
SUM(sales) AS monthly_sales,
LAG(SUM(sales)) OVER(ORDER BY order_year, order_month) AS previous_month_sales
FROM global_superstore
GROUP BY order_year, order_month;


-- 7. Monthly Profit Trend

SELECT
order_year,
order_month,
SUM(profit) AS monthly_profit,
LAG(SUM(profit)) OVER(ORDER BY order_year, order_month) AS previous_month_profit
FROM global_superstore
GROUP BY order_year, order_month;

-- =====================================================

-- 8. Top Product in Each Category

WITH RankedProducts AS
(
SELECT
category,
product_name,
SUM(sales) AS total_sales,
RANK() OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS rnk
FROM global_superstore
GROUP BY category, product_name
)

SELECT *
FROM RankedProducts
WHERE rnk = 1;


-- 9. Top Customer in Each Market

WITH RankedCustomers AS
(
SELECT
market,
customer_name,
SUM(sales) AS total_sales,
RANK() OVER(PARTITION BY market ORDER BY SUM(sales) DESC) AS rnk
FROM global_superstore
GROUP BY market, customer_name
)

SELECT *
FROM RankedCustomers
WHERE rnk = 1;


-- 10. Sales Contribution %

SELECT
category,
ROUND(SUM(sales),2) AS total_sales,
ROUND(
SUM(sales)*100/
(SUM(SUM(sales)) OVER()),2
) AS sales_percentage
FROM global_superstore
GROUP BY category;


-- 11. Profit Contribution %

SELECT
market,
ROUND(SUM(profit),2) AS total_profit,
ROUND(
SUM(profit)*100/
(SUM(SUM(profit)) OVER()),2
) AS profit_percentage
FROM global_superstore
GROUP BY market;


-- 12. Customer Segmentation using CASE

SELECT
customer_name,
SUM(sales) AS total_sales,

CASE

WHEN SUM(sales)>=10000 THEN 'Platinum'

WHEN SUM(sales)>=5000 THEN 'Gold'

WHEN SUM(sales)>=2000 THEN 'Silver'

ELSE 'Bronze'

END AS customer_segment

FROM global_superstore

GROUP BY customer_name

ORDER BY total_sales DESC;


-- 13. Product Performance using CASE

SELECT
product_name,
SUM(profit) AS total_profit,

CASE

WHEN SUM(profit)>1000 THEN 'High Profit'

WHEN SUM(profit)>500 THEN 'Medium Profit'

ELSE 'Low Profit'

END AS performance

FROM global_superstore

GROUP BY product_name;


-- 14. Average Sales by Category

SELECT
category,
AVG(sales) AS avg_sales,
AVG(AVG(sales)) OVER() AS overall_avg
FROM global_superstore
GROUP BY category;


-- 15. Highest Order Value in Each Market

WITH HighestOrder AS
(
SELECT
market,
order_id,
sales,

RANK() OVER(PARTITION BY market ORDER BY sales DESC) AS rnk

FROM global_superstore
)

SELECT *
FROM HighestOrder
WHERE rnk=1;


-- 16. Top 3 Products per Category

WITH ProductRanking AS
(
SELECT
category,
product_name,
SUM(sales) AS total_sales,

DENSE_RANK() OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS rnk

FROM global_superstore

GROUP BY category, product_name
)

SELECT *

FROM ProductRanking

WHERE rnk<=3;

-- 17. Year-over-Year Sales Growth

SELECT
order_year,
SUM(sales) AS total_sales,

LAG(SUM(sales)) OVER(ORDER BY order_year) AS previous_year_sales,

ROUND(

((SUM(sales)-LAG(SUM(sales))
OVER(ORDER BY order_year))

/

LAG(SUM(sales))
OVER(ORDER BY order_year))*100,2)

AS growth_percentage

FROM global_superstore

GROUP BY order_year;


-- 18. Highest Profit Margin Products

SELECT

product_name,

AVG(profit_margin) AS avg_profit_margin,

RANK() OVER(ORDER BY AVG(profit_margin) DESC) AS profit_margin_rank

FROM global_superstore

GROUP BY product_name;


-- 19. Cumulative Orders

SELECT

order_year,

COUNT(order_id) AS total_orders,

SUM(COUNT(order_id))
OVER(ORDER BY order_year)

AS cumulative_orders

FROM global_superstore

GROUP BY order_year;


-- 20. Overall Business Summary

SELECT

COUNT(DISTINCT order_id) AS total_orders,

COUNT(DISTINCT customer_id) AS total_customers,

COUNT(DISTINCT product_id) AS total_products,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit,

ROUND(AVG(profit_margin),2) AS avg_profit_margin,

ROUND(AVG(shipping_days),2) AS avg_shipping_days

FROM global_superstore;