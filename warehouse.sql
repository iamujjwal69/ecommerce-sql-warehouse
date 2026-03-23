-- E-Commerce Data Warehouse
-- warehouse.sql - Star Schema

CREATE TABLE dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
FROM customers;

CREATE TABLE dim_products AS
SELECT DISTINCT
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM products;

CREATE TABLE dim_sellers AS
SELECT DISTINCT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM olist_sellers_dataset;

CREATE TABLE fact_orders AS
SELECT
    o.order_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_timestamp,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS total_amount,
    op.payment_type,
    op.payment_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN order_payments op ON o.order_id = op.order_id;