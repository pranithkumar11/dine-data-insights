-- =============================================================================
-- 04_SUBQUERIES_AND_CASE.SQL (Subqueries & Dynamic CASE Categorizations)
-- =============================================================================

-- Find Orders Matching Global Maximum Amount
SELECT customer_id, orders_id, restaurant_id, orders_amounts 
FROM orders
WHERE orders_amounts = (SELECT MAX(orders_amounts) FROM orders);

-- Find Restaurant(s) with Highest & Lowest Rating
SELECT restaurant_name, rating, city 
FROM restaurant
WHERE rating = (SELECT MAX(rating) FROM restaurant);

SELECT restaurant_name, rating, city 
FROM restaurant
WHERE rating = (SELECT MIN(rating) FROM restaurant);

-- Categorize Orders into Rating/Amount Tiers
SELECT
    o.*,
    CASE
        WHEN o.orders_amounts = (SELECT MAX(orders_amounts) FROM orders) THEN 'Highest Rating'
        WHEN o.orders_amounts = (SELECT MIN(orders_amounts) FROM orders) THEN 'Lowest Rating'
        ELSE 'Medium Rating'
    END AS amount_category
FROM orders AS o;

-- Categorize Restaurants with Custom Sort Rank
SELECT *
FROM (
    SELECT
        r.*,
        CASE
            WHEN r.rating = (SELECT MAX(rating) FROM restaurant) THEN 'Highest Rating'
            WHEN r.rating = (SELECT MIN(rating) FROM restaurant) THEN 'Lowest Rating'
            ELSE 'Medium Rating'
        END AS rating_status
    FROM restaurant AS r
) AS x
ORDER BY
    CASE rating_status
        WHEN 'Highest Rating' THEN 1
        WHEN 'Medium Rating'  THEN 2
        WHEN 'Lowest Rating'  THEN 3
    END;

-- Restaurants with Average Order Amount Above Global Average
SELECT
    o.restaurant_id,
    r.restaurant_name,
    ROUND(AVG(o.orders_amounts), 2) AS avg_orders 
FROM orders AS o
INNER JOIN restaurant AS r ON o.restaurant_id = r.restaurant_id
GROUP BY o.restaurant_id, r.restaurant_name
HAVING AVG(o.orders_amounts) > (SELECT AVG(orders_amounts) FROM orders)
ORDER BY avg_orders DESC;

-- Customers Purchasing More Than Average Order Volume
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.orders_id) AS total_orders
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.orders_id) > (
    SELECT AVG(order_count)
    FROM (
        SELECT customer_id, COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS customer_orders
)
ORDER BY total_orders DESC;
