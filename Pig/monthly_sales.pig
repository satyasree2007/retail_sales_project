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

sales_with_month = FOREACH sales GENERATE
    SUBSTRING(order_date, 0, 7) AS month,
    quantity,
    revenue,
    profit;

grouped_month = GROUP sales_with_month BY month;

monthly_sales = FOREACH grouped_month GENERATE
    group AS month,
    COUNT(sales_with_month) AS total_transactions,
    SUM(sales_with_month.quantity) AS total_quantity,
    SUM(sales_with_month.revenue) AS total_revenue,
    SUM(sales_with_month.profit) AS total_profit;

STORE monthly_sales INTO '/retail_project/processed/monthly_sales'
USING PigStorage(',');
