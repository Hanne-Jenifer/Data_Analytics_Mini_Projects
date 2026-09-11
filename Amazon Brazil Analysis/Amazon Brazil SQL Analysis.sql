-- =========================================================
-- AMAZON DATABASE SETUP
-- =========================================================

-- Create Database
CREATE DATABASE amazon_db;

-- Select Database
USE amazon_db;


-- =========================================================
-- 1. CUSTOMERS TABLE
-- =========================================================

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);


-- =========================================================
-- 2. SELLER TABLE
-- =========================================================

CREATE TABLE seller (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);


-- =========================================================
-- 3. PRODUCT TABLE
-- =========================================================

CREATE TABLE product (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);


-- =========================================================
-- 4. ORDERS TABLE
-- =========================================================

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- =========================================================
-- 5. ORDER_ITEMS TABLE
-- =========================================================

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),

    PRIMARY KEY (order_id, order_item_id),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES product(product_id),

    FOREIGN KEY (seller_id)
        REFERENCES seller(seller_id)
);


-- =========================================================
-- 6. PAYMENTS TABLE
-- =========================================================

CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10,2),

    PRIMARY KEY (order_id, payment_sequential),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- Check the number of records imported into each table
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'seller', COUNT(*) FROM seller
UNION ALL
SELECT 'product', COUNT(*) FROM product
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

/* =========================================================
   ANALYSIS - I
   ========================================================= */

-- 1. To simplify financial reports, round the average payment value
--    to an integer for each payment type and sort in ascending order.
SELECT
    payment_type,
    ROUND(AVG(payment_value)) AS rounded_avg_payment
FROM payments
GROUP BY payment_type
ORDER BY rounded_avg_payment ASC;


-- 2. Calculate the percentage of total orders for each payment type,
--    rounded to one decimal place and sorted in descending order.
SELECT
    payment_type,
    ROUND(
        COUNT(DISTINCT order_id) * 100.0 /
        (SELECT COUNT(DISTINCT order_id) FROM orders),
        1
    ) AS percentage_orders
FROM payments
GROUP BY payment_type
ORDER BY percentage_orders DESC;


-- 3. Identify products priced between 100 and 500 BRL
--    whose product category name contains the word 'Smart'.
SELECT DISTINCT
    p.product_id,
    oi.price
FROM product p
JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.price BETWEEN 100 AND 500
  AND p.product_category_name LIKE '%Smart%'
ORDER BY oi.price DESC;


-- 4. Determine the top 3 months with the highest total sales value,
--    rounded to the nearest integer.
SELECT
    MONTH(order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price)) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY MONTH(order_purchase_timestamp)
ORDER BY total_sales DESC
LIMIT 3;


-- 5. Find product categories where the difference between
--    maximum and minimum product prices is greater than 500 BRL.
SELECT
    p.product_category_name,
    MAX(oi.price) - MIN(oi.price) AS price_difference
FROM product p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
HAVING MAX(oi.price) - MIN(oi.price) > 500
ORDER BY price_difference DESC;


-- 6. Identify payment types with the smallest standard deviation
--    in transaction amounts.
SELECT
    payment_type,
    STDDEV(payment_value) AS std_deviation
FROM payments
GROUP BY payment_type
ORDER BY std_deviation ASC;


-- 7. Retrieve products where the product category name is missing
--    or contains only a single character.
SELECT
    product_id,
    product_category_name
FROM product
WHERE product_category_name IS NULL
   OR CHAR_LENGTH(TRIM(product_category_name)) = 1;
   
   
   /* =========================================================
   ANALYSIS - II
   ========================================================= */


-- 1. Segment orders by order value and calculate
--    the count of each payment type within each segment.
SELECT
    CASE
        WHEN payment_value < 200 THEN 'Low'
        WHEN payment_value BETWEEN 200 AND 1000 THEN 'Medium'
        ELSE 'High'
    END AS order_value_segment,
    payment_type,
    COUNT(*) AS count
FROM payments
GROUP BY order_value_segment, payment_type
ORDER BY count DESC;


-- 2. Calculate the minimum, maximum, and average price
--    for each product category.
SELECT
    p.product_category_name,
    MIN(oi.price) AS min_price,
    MAX(oi.price) AS max_price,
    ROUND(AVG(oi.price), 2) AS avg_price
FROM product p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY avg_price DESC;


-- 3. Find customers who have placed more than one order
--    and display their customer unique ID and total orders.
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;


-- 4. Categorize customers based on their order quantity
--    using a temporary table and display their customer type.
CREATE TEMPORARY TABLE customer_types (
    min_orders INT,
    max_orders INT,
    customer_type VARCHAR(20)
);

INSERT INTO customer_types
VALUES
    (1, 1, 'New'),
    (2, 4, 'Returning'),
    (5, 999999, 'Loyal');

SELECT
    c.customer_unique_id,
    ct.customer_type
FROM customers c
JOIN (
    SELECT
        customer_id,
        COUNT(order_id) AS order_qty
    FROM orders
    GROUP BY customer_id
) o
    ON c.customer_id = o.customer_id
JOIN customer_types ct
    ON o.order_qty BETWEEN ct.min_orders AND ct.max_orders;


-- 5. Calculate total revenue for each product category
--    and display the top 5 categories.
SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM product p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 5;


/* =========================================================
   ANALYSIS - III
   ========================================================= */


-- 1. Calculate total sales for each season using a subquery.
SELECT
    season,
    SUM(total_sales) AS total_sales
FROM (
    SELECT
        CASE
            WHEN MONTH(o.order_purchase_timestamp) IN (3, 4, 5)
                THEN 'Spring'
            WHEN MONTH(o.order_purchase_timestamp) IN (6, 7, 8)
                THEN 'Summer'
            WHEN MONTH(o.order_purchase_timestamp) IN (9, 10, 11)
                THEN 'Autumn'
            ELSE 'Winter'
        END AS season,
        oi.price AS total_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
) AS seasonal_sales
GROUP BY season
ORDER BY total_sales DESC;


-- 2. Find products whose total quantity sold is above
--    the overall average quantity sold.
SELECT
    product_id,
    SUM(order_item_id) AS total_quantity_sold
FROM order_items
GROUP BY product_id
HAVING SUM(order_item_id) > (
    SELECT AVG(total_quantity)
    FROM (
        SELECT
            product_id,
            SUM(order_item_id) AS total_quantity
        FROM order_items
        GROUP BY product_id
    ) AS product_sales
)
ORDER BY total_quantity_sold DESC;


-- 3. Calculate monthly revenue for the year 2018.
--    The result can be exported to Excel to create a revenue trend graph.
SELECT
    MONTH(o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE YEAR(o.order_purchase_timestamp) = 2018
GROUP BY MONTH(o.order_purchase_timestamp)
ORDER BY month;


-- 4. Classify customers based on purchase frequency using a CTE.
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
),
customer_segments AS (
    SELECT
        customer_id,
        CASE
            WHEN order_count BETWEEN 1 AND 2 THEN 'Occasional'
            WHEN order_count BETWEEN 3 AND 5 THEN 'Regular'
            ELSE 'Loyal'
        END AS customer_type
    FROM customer_orders
)
SELECT
    customer_type,
    COUNT(*) AS count
FROM customer_segments
GROUP BY customer_type
ORDER BY count DESC;


-- 5. Rank customers based on their average order value
--    and return the top 20 customers.
WITH customer_order_values AS (
    SELECT
        o.customer_id,
        o.order_id,
        SUM(oi.price) AS order_value
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id, o.order_id
),
customer_average_values AS (
    SELECT
        customer_id,
        AVG(order_value) AS avg_order_value
    FROM customer_order_values
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        avg_order_value,
        RANK() OVER (ORDER BY avg_order_value DESC) AS customer_rank
    FROM customer_average_values
)
SELECT
    customer_id,
    ROUND(avg_order_value, 2) AS avg_order_value,
    customer_rank
FROM ranked_customers
WHERE customer_rank <= 20
ORDER BY customer_rank;


-- 6. Calculate monthly cumulative sales for each product
--    from the date of its first sale using a recursive CTE.
WITH RECURSIVE monthly_sales AS (
    SELECT
        oi.product_id,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS sale_month,
        SUM(oi.price) AS monthly_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        oi.product_id,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01')
),
product_sales AS (
    SELECT
        product_id,
        sale_month,
        monthly_sales,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY sale_month
        ) AS month_number
    FROM monthly_sales
),
cumulative_sales AS (
    SELECT
        product_id,
        sale_month,
        monthly_sales AS total_sales,
        month_number
    FROM product_sales
    WHERE month_number = 1

    UNION ALL

    SELECT
        ps.product_id,
        ps.sale_month,
        cs.total_sales + ps.monthly_sales AS total_sales,
        ps.month_number
    FROM product_sales ps
    JOIN cumulative_sales cs
        ON ps.product_id = cs.product_id
       AND ps.month_number = cs.month_number + 1
)
SELECT
    product_id,
    sale_month,
    total_sales
FROM cumulative_sales
ORDER BY product_id, sale_month;


-- 7. Calculate monthly sales for each payment method
--    and month-over-month growth for the year 2018.
WITH monthly_payment_sales AS (
    SELECT
        p.payment_type,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS sale_month,
        SUM(p.payment_value) AS monthly_total
    FROM payments p
    JOIN orders o
        ON p.order_id = o.order_id
    WHERE YEAR(o.order_purchase_timestamp) = 2018
    GROUP BY
        p.payment_type,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01')
),
payment_growth AS (
    SELECT
        payment_type,
        sale_month,
        monthly_total,
        LAG(monthly_total) OVER (
            PARTITION BY payment_type
            ORDER BY sale_month
        ) AS previous_month_total
    FROM monthly_payment_sales
)
SELECT
    payment_type,
    sale_month,
    ROUND(monthly_total, 2) AS monthly_total,
    ROUND(
        (monthly_total - previous_month_total)
        / NULLIF(previous_month_total, 0) * 100,
        2
    ) AS monthly_change
FROM payment_growth
ORDER BY payment_type, sale_month;
