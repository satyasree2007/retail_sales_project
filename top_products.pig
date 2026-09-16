sales = LOAD '/retail_project/processed/clean_sales/part-m-00000'
USING PigStorage(',')
AS (
    transaction_id:int,
    customer_id:chararray,
    order_date:chararray,
    region:chararray,
    city:chararray,
    product_id:chararray,
    product_name:chararray,
    category:chararray,
    quantity:int,
    unit_price:double,
    discount:double,
    revenue:double,
    cost:double,
    profit:double,
    stock_on_hand:int,
    reorder_level:int,
    lead_time_days:int
);

grouped_product = GROUP sales BY product_name;

product_sales = FOREACH grouped_product GENERATE
    group AS product_name,
    COUNT(sales) AS total_transactions,
    SUM(sales.quantity) AS total_quantity,
    SUM(sales.revenue) AS total_revenue,
    SUM(sales.profit) AS total_profit;

ordered_products = ORDER product_sales BY total_revenue DESC;

top_products = LIMIT ordered_products 10;

STORE top_products INTO '/retail_project/processed/top_products'
USING PigStorage(',');
