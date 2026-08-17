-- =============================================================================
-- 02_BASIC_EXPLORATION.SQL (Basic Data Inspection & Aggregations)
-- =============================================================================

-- Inspect Raw Tables
SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM restaurant;

-- Total Counts & Financial Summaries
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT SUM(orders_amounts) AS total_revenue FROM orders;

-- Unique Values & Attribute Counts
SELECT COUNT(DISTINCT paymeth_method) FROM orders;
SELECT DISTINCT paymeth_method FROM orders;

SELECT COUNT(DISTINCT orders_status) FROM orders;
SELECT DISTINCT orders_status FROM orders;

SELECT COUNT(DISTINCT city) AS unique_cities FROM customers;
SELECT DISTINCT city FROM customers;

-- Min/Max Summary Metrics
SELECT MAX(orders_amounts) AS highest_order_amount FROM orders;
SELECT MIN(orders_amounts) AS lowest_order_amount FROM orders;

SELECT MAX(sigupdate) AS latest_signup_date FROM customers;
SELECT MIN(sigupdate) AS earliest_signup_date FROM customers;

SELECT MAX(rating) AS highest_restaurant_rating FROM restaurant;
SELECT MIN(rating) AS lowest_restaurant_rating FROM restaurant;
