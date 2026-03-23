-- E-Commerce Data Warehouse
-- cleaning.sql - Clean Layer

CREATE TABLE customers AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    LOWER(TRIM(customer_city)) AS customer_city,
    UPPER(TRIM(customer_state)) AS customer_state
FROM olist_customers_dataset
WHERE customer_id IS NOT NULL
AND customer_unique_id IS NOT NULL;

CREATE TABLE orders AS
SELECT DISTINCT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp::timestamp AS order_purchase_timestamp,
    order_delivered_customer_date::timestamp AS order_delivered_timestamp,
    order_estimated_delivery_date::timestamp AS order_estimated_delivery_date
FROM olist_orders_dataset
WHERE order_id IS NOT NULL
AND customer_id IS NOT NULL;

CREATE TABLE products AS
SELECT DISTINCT
    product_id,
    COALESCE(product_category_name, 'unknown') AS product_category_name,
    COALESCE(product_weight_g, 0) AS product_weight_g,
    COALESCE(product_length_cm, 0) AS product_length_cm,
    COALESCE(product_height_cm, 0) AS product_height_cm,
    COALESCE(product_width_cm, 0) AS product_width_cm
FROM olist_products_dataset
WHERE product_id IS NOT NULL;

CREATE TABLE order_items AS
SELECT DISTINCT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    price,
    freight_value
FROM olist_order_items_dataset
WHERE order_id IS NOT NULL
AND product_id IS NOT NULL;

CREATE TABLE order_payments AS
SELECT DISTINCT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
FROM olist_order_payments_dataset
WHERE order_id IS NOT NULL
AND payment_value > 0;