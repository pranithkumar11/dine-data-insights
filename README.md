# 🍽️ Dine Data Insights — End-to-End SQL Data Analysis

Welcome to **Dine Data Insights**, a comprehensive PostgreSQL analysis project focused on understanding food delivery and restaurant operation patterns. This repository explores data across three main domains: **Customers**, **Orders**, and **Restaurants**.

## 👨‍💻 Author
**Pranith Kumar**
GitHub: https://github.com/pranithkumar11
LinkedIn: https://www.linkedin.com/in/praneethkumar-dupuguntla-48721a237/



---

## 📁 Repository Structure

```text
dine-data-insights/
├── README.md
├── schema/
│   └── 01_create_tables.sql       # DDL scripts for customers, orders, and restaurant tables
└── queries/
    ├── 02_basic_exploration.sql   # DML, aggregations, counts, min/max analysis
    ├── 03_joins_and_filters.sql   # Multi-table INNER/LEFT JOINs and order status filters
    ├── 04_subqueries_and_case.sql # Subqueries and CASE rating classifications
    ├── 05_window_functions.sql   # DENSE_RANK(), running totals, top 3 per city
    └── 06_cte_and_lag.sql        # Month-over-Month (MoM) revenue analysis
🛠️ Relational Database Schema
The analysis operates on three core tables:

customers: (customer_id, customer_name, city, sigupdate)

orders: (orders_id, customer_id, restaurant_id, orders_date, orders_amounts, paymeth_method, orders_status)

restaurant: (restaurant_id, restaurant_name, city, rating)

💡 SQL Concepts & Step-by-Step Breakdown
1️⃣ Data Definition & Exploration (DDL & DML)
Table Creation: Schema definitions for structured data storage with proper data types (INT, VARCHAR, DATE, FLOAT).

Basic Aggregations: Using COUNT(), SUM(), MIN(), and MAX() to measure overall platform activity and data ranges.

Uniqueness Verification: Identifying unique customers, payment methods, and geographic locations using DISTINCT.

2️⃣ Multi-Table Joins & Filtering
INNER JOINs: Linking orders back to customer demographic and restaurant data for order tracking.

Status Filtering: Segmenting operations by completed vs. cancelled orders using targeted WHERE conditions.

LEFT JOIN (Data Integrity): Identifying inactive customers who have signed up but have not placed any orders (WHERE o.customer_id IS NULL).

3️⃣ Subqueries & Conditional Logic
Scalar Subqueries: Filtering records against dynamically calculated threshold values (e.g., retrieving orders matching the global maximum order amount).

CASE WHEN Rating Categorization: Classifying restaurants into rating tiers (Highest Rating, Medium Rating, Lowest Rating) with dynamic sorting rules.

Filtered Aggregations: Finding restaurants whose average order amount exceeds the global average order value (HAVING AVG() > (SELECT AVG())).

4️⃣ Advanced Window Functions & CTEs
Running Revenue Totals: Tracking cumulative platform revenue over time using SUM(orders_amounts) OVER (ORDER BY orders_date, orders_id).

Dense Ranking (DENSE_RANK()): Finding the second highest order amount and ranking top 3 restaurants per city using PARTITION BY r.city.

Revenue Ranking: Assigning performance ranks to restaurants based on total revenue generation.

Month-over-Month (MoM) Growth: Using Common Table Expressions (WITH) paired with the LAG() window function to track monthly revenue changes.

📊 Business Key Takeaways
Top Spenders & Volume: Identifies high-value customers driving overall platform revenue.

City Performance: Highlights regional trends by averaging order totals per city and ranking top restaurants in each locality.

Operational Health: Tracks cancelled vs. completed order counts to monitor fulfillment efficiency.

Payment Preferences: Determines customer payment habits via aggregate count frequency and SQL MODE().

🚀 How to Run the Scripts
Open PostgreSQL or pgAdmin.

Create a new database named dine_insights.

First execute schema/01_create_tables.sql to initialize all database tables.

Execute the SQL scripts inside queries/ (from 02 through 06) sequentially to perform the data analysis.



⭐ If you found this project useful, please consider giving it a star!
