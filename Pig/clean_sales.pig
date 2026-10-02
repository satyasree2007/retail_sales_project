sales = LOAD '/retail_project/raw/retail_sales_50kb.csv'
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

clean_sales = FILTER sales BY transaction_id IS NOT NULL
    AND transaction_id > 0;

STORE clean_sales INTO '/retail_project/processed/clean_sales'
USING PigStorage(',');
