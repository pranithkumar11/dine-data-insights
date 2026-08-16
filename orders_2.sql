CREATE TABLE orders(
     orders_id INT,
    customer_id INT,
    restaurant_id INT,
    orders_date Date,
	orders_amounts INT,
	paymeth_method varchar(20),
	orders_status varchar(40)
   ); 
   drop table orders;
   select * from  orders;
    select count(*) from orders;
    select count(DISTINCT paymeth_method) from orders;
    select  DISTINCT paymeth_method
	from orders;
	select max(orders_amounts) AS highers_amounts
	from orders;
	select min(orders_amounts) AS lowers_amounts
	from orders;
	select * from orders;

    select customer_id,orders_id,restaurant_id,orders_amounts from orders
	 where orders_amounts =
    (select max(orders_amounts) AS highers_amounts
	 from orders);




	SELECT 
    c.customer_Name,
    o.orders_amounts
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
	ORDER BY o.orders_amounts DESC
	LIMIT 10; 



SELECT
    c.customer_id,
    c.customer_name,
	c.city,
    SUM(o.orders_amounts) AS total_order_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
	c.city
ORDER BY total_order_amount DESC
LIMIT 10;

select sum(orders_amounts)from orders;
select * from orders;
select count (DISTINCT orders_status) from orders;

select   DISTINCT orders_status from orders;
select count (DISTINCT paymeth_method) from orders;
select   DISTINCT paymeth_method from orders;

 

SELECT
    r.restaurant_id,
    r.restaurant_name,
   Sum (o.orders_amounts) As total_revenue
FROM orders AS o
INNER JOIN restaurant AS r
    ON o.restaurant_id = r.restaurant_id
Group BY 
    r.restaurant_id,
    r.restaurant_name
ORDER BY total_revenue DESC;

SELECT
    o.customer_id,
    c.customer_name,
   count (o.orders_id) As total_orders 
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
Group BY 
     o.customer_id,
    c.customer_name
ORDER BY total_orders DESC;

select * from orders;



SELECT 
    r.city,
   Round(AVG(o.orders_amounts),2) As average_orders_amounts
FROM  orders AS o
INNER JOIN restaurant AS r
    ON o.restaurant_id = r.restaurant_id
Group BY 
     r.city
ORDER BY average_orders_amounts DESC;--4questions
SELECT
    o.*,
    CASE
        WHEN o.orders_amounts = (SELECT MAX(orders_amounts) FROM orders)
            THEN 'Highest Rating'
        WHEN o.orders_amounts = (SELECT MIN(orders_amounts) FROM orders)
            THEN 'Lowest Rating'
        ELSE 'Medium Rating'
    END AS amount_category
FROM orders AS o
ORDER BY
    CASE
        WHEN o.orders_amounts = (SELECT MAX(orders_amounts) FROM orders)
            THEN 1
        WHEN o.orders_amounts = (SELECT MIN(orders_amounts) FROM orders)
            THEN 3
        ELSE 2
    END; --5 questions





SELECT
    o.restaurant_id,
    r.restaurant_name,
  Round(avg(o.orders_id),0) As avg_orders 
FROM orders AS o
INNER JOIN restaurant AS r
    ON o.restaurant_id = r.restaurant_id
Group BY 
     o.restaurant_id,
    r.restaurant_name
	Having avg(o.orders_amounts) >(
    select avg(orders_amounts)
	from orders
	)
ORDER BY avg_orders DESC;---6questions



SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;--7 questions


SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.orders_amounts) AS total_spending
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spending DESC
LIMIT 5;---8questions 

select * from orders;

















   