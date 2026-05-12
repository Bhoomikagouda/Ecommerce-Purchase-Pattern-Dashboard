CREATE DATABASE PURCHASE;

USE PURCHASE;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/purchase_data_exe.csv'
INTO TABLE purchase_data_exe
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM purchase_data_exe;

SELECT COUNT(*) FROM purchase_data_exe;

SELECT SUM(`value [USD]`) FROM purchase_data_exe;

SELECT payment_method, COUNT(*)
FROM purchase_data_exe
GROUP BY payment_method;

SELECT customer_id, SUM(`value [USD]`) total_spent
FROM purchase_data_exe
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT product_category,
SUM(`value [USD]`) AS revenue
FROM purchase_data_exe
GROUP BY product_category
ORDER BY revenue DESC;

SELECT payment_method,
COUNT(*) AS total_orders
FROM purchase_data_exe
GROUP BY payment_method
ORDER BY total_orders DESC;

SELECT ROUND(AVG(`value [USD]`),2) AS avg_order_value
FROM purchase_data_exe;

SELECT customer_id,
COUNT(*) AS total_orders
FROM purchase_data_exe
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

SELECT customer_id,
AVG(clicks_in_site) AS avg_clicks
FROM purchase_data_exe
GROUP BY customer_id
ORDER BY avg_clicks DESC
LIMIT 10;


SELECT 
ROUND(AVG(`time_on_site [Minutes]`),2) AS avg_time_on_site,
ROUND(AVG(`value [USD]`),2) AS avg_purchase_value
FROM purchase_data_exe;
