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

inventory_insights = FOREACH low_stock GENERATE
    product_id,
    product_name,
    stock_on_hand,
    reorder_level,
    lead_time_days,
    region,
    city;

STORE inventory_insights INTO '/retail_project/processed/inventory_insights'
USING PigStorage(',');
