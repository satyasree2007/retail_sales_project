USE retail_db;
SELECT
    region,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_clean
GROUP BY region
ORDER BY total_revenue DESC;
SELECT
    substr(CAST(order_date AS STRING), 1, 7) AS month,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_clean
GROUP BY substr(CAST(order_date AS STRING), 1, 7)
ORDER BY month;
SELECT
    product_name,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_clean
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;
SELECT
    category,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_clean
GROUP BY category
ORDER BY total_revenue DESC;


-- 5. Inventory / Low Stock Analysis
SELECT
    product_name,
    MIN(stock_on_hand) AS minimum_stock,
    MAX(reorder_level) AS reorder_level,
    COUNT(*) AS low_stock_records
FROM sales_clean
WHERE stock_on_hand <= reorder_level
GROUP BY product_name
ORDER BY low_stock_records DESC;


-- 6. Partitioned Table Query
SELECT
    sales_month,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_partitioned
WHERE sales_month = '2025-10'
GROUP BY sales_month;


-- 7. Bucketed Table Query
SELECT
    product_id,
    product_name,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_bucketed
WHERE product_id = 'P015'
GROUP BY product_id, product_name;
