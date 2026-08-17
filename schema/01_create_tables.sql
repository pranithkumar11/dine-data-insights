
-- =============================================================================
-- 01_CREATE_TABLES.SQL (Database Schema & DDL Definitions)
-- =============================================================================

-- Create Orders Table
CREATE TABLE orders (
    orders_id INT,
    customer_id INT,
    restaurant_id INT,
    orders_date DATE,
    orders_amounts INT,
    paymeth_method VARCHAR(20),
    orders_status VARCHAR(40)
);

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    sigupdate DATE
);

-- Create Restaurant Table
CREATE TABLE restaurant (
    restaurant_id INT,
    restaurant_name VARCHAR(30),
    city VARCHAR(50),
    rating FLOAT
);
