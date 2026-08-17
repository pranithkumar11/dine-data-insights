-- =============================================================================
-- 06_CTE_AND_LAG.SQL (Common Table Expressions & MoM Analysis)
-- =============================================================================

-- Basic Date Extraction
SELECT EXTRACT(MONTH FROM orders_date) AS month
FROM orders;

-- Month-over-Month Revenue Analysis using CTE & LAG()
WITH monthly_revenue AS (
    SELECT
        EXTRACT(MONTH FROM orders_date) AS month,
        SUM(orders_amounts) AS revenue
    FROM orders
    GROUP BY EXTRACT(MONTH FROM orders_date)
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (
        ORDER BY month
    ) AS previous_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0 / NULLIF(LAG(revenue) OVER (ORDER BY month), 0),
        2
    ) AS percentage_growth
FROM monthly_revenue
ORDER BY month;
