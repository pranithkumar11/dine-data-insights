-- =============================================================================
-- 05_WINDOW_FUNCTIONS.SQL (Running Totals & Analytical Ranking)
-- =============================================================================

-- Cumulative Running Total Revenue Over Time
SELECT
    orders_date,
    orders_id,
    orders_amounts,
    SUM(orders_amounts) OVER (
        ORDER BY orders_date, orders_id
    ) AS running_total_revenue
FROM orders
ORDER BY orders_date, orders_id;

-- Rank Restaurants by Total Revenue Generated
SELECT
    r.restaurant_id,
    r.restaurant_name,
    SUM(o.orders_amounts) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(o.orders_amounts) DESC
    ) AS revenue_rank
FROM restaurant AS r
INNER JOIN orders AS o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY revenue_rank;

-- Find 2nd Highest Order Amount using DENSE_RANK()
SELECT orders_id, orders_amounts
FROM (
    SELECT
        orders_id,
        orders_amounts,
        DENSE_RANK() OVER (ORDER BY orders_amounts DESC) AS amount_rank
    FROM orders
) AS x
WHERE amount_rank = 2;

-- Top 3 Restaurants per City (Partitioned Window Function)
SELECT *
FROM (
    SELECT
        r.restaurant_id,
        r.city,
        r.restaurant_name,
        COUNT(o.orders_id) AS total_orders,
        DENSE_RANK() OVER (
            PARTITION BY r.city
            ORDER BY COUNT(o.orders_id) DESC
        ) AS restaurant_rank
    FROM restaurant AS r
    INNER JOIN orders AS o ON r.restaurant_id = o.restaurant_id
    GROUP BY r.restaurant_id, r.city, r.restaurant_name
) AS x
WHERE restaurant_rank <= 3
ORDER BY city, restaurant_rank;
