
CREATE TABLE global_superstore(
row_id int,
order_id varchar(30),
order_date DATE,
ship_date DATE,
ship_mode varchar(50),
customer_id varchar(30),
customer_name varchar(100),
segment varchar(50),
postal_code int,

city varchar(100),
state varchar(100),
country varchar(100),
region varchar(100),
market varchar(100),

product_id varchar(100),
category varchar(50),
sub_category varchar(50),
product_name varchar(255),

sales decimal(12,2),
quantity int,
discount decimal(5,2),
profit decimal(12,2),
shipping_cost decimal(12,2),
order_priority varchar(30),

order_year INT,
order_month INT,
month_name VARCHAR(20),
quarter INT,
shipping_days INT,
profit_margin DECIMAL(10,2)
);

SHOW COLUMNS FROM global_superstore;