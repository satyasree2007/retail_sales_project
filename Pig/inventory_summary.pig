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

low_stock = FILTER sales BY stock_on_hand <= reorder_level;

grouped_product = GROUP low_stock BY product_name;

inventory_summary = FOREACH grouped_product GENERATE
    group AS product_name,
    COUNT(low_stock) AS reorder_records,
    MIN(low_stock.stock_on_hand) AS minimum_stock,
    MAX(low_stock.reorder_level) AS reorder_level,
    MAX(low_stock.lead_time_days) AS max_lead_time;

STORE inventory_summary INTO '/retail_project/processed/inventory_summary'
USING PigStorage(',');
