-- E-Commerce Data Warehouse
-- schema.sql - Raw Layer Tables

CREATE TABLE customers_raw (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state VARCHAR(5)
);

CREATE TABLE orders_raw (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp VARCHAR(30),
    order_delivered_timestamp VARCHAR(30),
    order_estimated_delivery_date VARCHAR(30)
);

CREATE TABLE products_raw (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_weight_g VARCHAR(20),
    product_length_cm VARCHAR(20),
    product_height_cm VARCHAR(20),
    product_width_cm VARCHAR(20)
);