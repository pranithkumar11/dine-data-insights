-- =============================================================================
-- 03_JOINS_AND_FILTERS.SQL (Multi-Table Joins & Operations Filtering)
-- =============================================================================

-- Top 10 Individual Orders with Customer Names
SELECT 
    c.customer_name,
    o.orders_amounts
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
ORDER BY o.orders_amounts DESC
LIMIT 10;

-- Top 10 Spending Customers with Location Data
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(o.orders_amounts) AS total_order_amount
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_order_amount DESC
LIMIT 10;

-- Revenue Generated per Restaurant
SELECT
    r.restaurant_id,
    r.restaurant_name,
    SUM(o.orders_amounts) AS total_revenue
FROM orders AS o
INNER JOIN restaurant AS r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_revenue DESC;

-- Total Orders Placed per Customer
SELECT
    o.customer_id,
    c.customer_name,
    COUNT(o.orders_id) AS total_orders 
FROM orders AS o
INNER JOIN customers AS c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Average Order Amount per City
SELECT 
    r.city,
    ROUND(AVG(o.orders_amounts), 2) AS average_orders_amounts
FROM orders AS o
INNER JOIN restaurant AS r ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY average_orders_amounts DESC;

-- Inactive Customers (LEFT JOIN filtering NULLs)
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Filter Cancelled Orders
SELECT
    o.orders_id,
    c.customer_name,
    r.restaurant_name,
    o.orders_status
FROM orders AS o
INNER JOIN customers AS c ON o.customer_id = c.customer_id
INNER JOIN restaurant AS r ON o.restaurant_id = r.restaurant_id
WHERE o.orders_status = 'Cancelled'
ORDER BY o.orders_id ASC;

-- Filter Completed Orders
SELECT
    o.orders_id,
    c.customer_name,
    r.restaurant_name,
    o.orders_status
FROM orders AS o
INNER JOIN customers AS c ON o.customer_id = c.customer_id
INNER JOIN restaurant AS r ON o.restaurant_id = r.restaurant_id
WHERE o.orders_status = 'Completed'
ORDER BY o.orders_id ASC;
