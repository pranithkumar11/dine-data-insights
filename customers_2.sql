CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    sigupdate DATE
);
select * from  customers;
SELECT COUNT(*) AS total_rows
FROM customers;
SELECT COUNT(DISTINCT city) -- five differnts city
FROM customers;
SELECT DISTINCT city -- five differnts city names
FROM customers;
SELECT MAX(sigupdate) AS highest_date
FROM customers; --max sigupdate
SELECT MIN(sigupdate) AS lowers_date
FROM customers;

SELECT COUNT( DISTINCT customer_name) -- 
FROM customers;

SELECT DISTINCT
    customer_id,
    customer_name
FROM customers;
select * from customers;

SELECT
    o.orders_id,
    c.customer_name,
    r.restaurant_name,
    o.orders_status
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN restaurant AS r
    ON o.restaurant_id = r.restaurant_id
WHERE o.orders_status = 'Completed'
ORDER BY o.orders_id ASC;





