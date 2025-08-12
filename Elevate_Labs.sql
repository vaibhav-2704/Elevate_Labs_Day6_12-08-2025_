CREATE DATABASE IF NOT EXISTS online_sales;

USE online_sales;

CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date VARCHAR(10),
    customer_name VARCHAR(255),
    state VARCHAR(100),
    city VARCHAR(100),
    PRIMARY KEY (order_id)
);

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_date_new = 
    CASE
        WHEN order_date LIKE '__-__-____' THEN STR_TO_DATE(order_date, '%d-%m-%Y')
        WHEN order_date LIKE '____-__-__' THEN STR_TO_DATE(order_date, '%Y-%m-%d')
        ELSE NULL
    END;

SET SQL_SAFE_UPDATES = 1;



ALTER TABLE orders DROP COLUMN order_date;

ALTER TABLE orders CHANGE order_date_new order_date DATE;

DESCRIBE orders;

SELECT * FROM orders LIMIT 5;

CREATE TABLE details (
    order_id VARCHAR(20),
    amount DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT,
    category VARCHAR(100),
    sub_category VARCHAR(100),
    payment_mode VARCHAR(50)
);

SELECT * FROM details LIMIT 5;

SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(d.amount) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY year, month;


SELECT 
    o.order_id,
    o.order_date,
    d.amount
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
LIMIT 10;


SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(d.amount) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY year, month;


SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(d.amount) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
WHERE o.order_date BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY year, month
ORDER BY year, month;

SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(d.amount) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY year, month;

SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    SUM(d.amount) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS order_volume,
    ROUND(SUM(d.amount) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN details d
    ON o.order_id = d.order_id
GROUP BY year, month
ORDER BY year, month;


