-- E-Commerce Data Warehouse
-- analysis.sql - Business Insights

-- 1. Top 10 Customers
SELECT
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.payment_value)::numeric, 2) AS total_spent
FROM fact_orders f
JOIN dim_customers c ON f.customer_id = c.customer_id
GROUP BY c.customer_unique_id, c.customer_city, c.customer_state
ORDER BY total_spent DESC
LIMIT 10;

-- 2. Monthly Revenue Trend
SELECT
    TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value)::numeric, 2) AS monthly_revenue
FROM fact_orders
WHERE order_purchase_timestamp IS NOT NULL
GROUP BY TO_CHAR(order_purchase_timestamp, 'YYYY-MM')
ORDER BY month;

-- 3. Best Selling Products
SELECT
    p.product_category_name,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.payment_value)::numeric, 2) AS total_revenue
FROM fact_orders f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 4. Customer Segmentation
SELECT
    CASE
        WHEN total_spent >= 1000 THEN 'High Value'
        WHEN total_spent >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(total_spent)::numeric, 2) AS avg_spent
FROM (
    SELECT
        c.customer_unique_id,
        SUM(f.payment_value) AS total_spent
    FROM fact_orders f
    JOIN dim_customers c ON f.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) customer_totals
GROUP BY customer_segment
ORDER BY avg_spent DESC;

-- 5. Repeat vs New Customers
SELECT
    CASE
        WHEN order_count > 1 THEN 'Repeat Customer'
        ELSE 'New Customer'
    END AS customer_type,
    COUNT(*) AS total_customers,
    ROUND(AVG(order_count)::numeric, 2) AS avg_orders
FROM (
    SELECT
        customer_unique_id,
        COUNT(DISTINCT f.order_id) AS order_count
    FROM fact_orders f
    JOIN dim_customers c ON f.customer_id = c.customer_id
    GROUP BY customer_unique_id
) customer_orders
GROUP BY customer_type;

-- 6. Payment Method Analysis
SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value)::numeric, 2) AS total_revenue,
    ROUND(AVG(payment_value)::numeric, 2) AS avg_order_value
FROM fact_orders
GROUP BY payment_type
ORDER BY total_revenue DESC;
