# Retail Sales Data Processing and Business Intelligence Platform

## Project Overview

This project processes retail sales data using Hadoop, HDFS, Hive, and Apache Pig.

The main objective is to clean retail sales data, perform business analysis, identify top-performing products, analyze regional and monthly sales, and generate inventory insights.

## Technologies Used

- Hadoop 3.3.6
- HDFS
- YARN
- Hive 3.1.3
- Apache Pig 0.18.0
- Linux / Ubuntu
- Git and GitHub

## Dataset

The project uses a retail sales dataset containing:

- Transaction ID
- Customer ID
- Order Date
- Region
- City
- Product ID
- Product Name
- Category
- Quantity
- Unit Price
- Discount
- Revenue
- Cost
- Profit
- Stock on Hand
- Reorder Level
- Lead Time

## Project Workflow

1. Load retail sales data into HDFS.
2. Create Hive database and tables.
3. Clean invalid/header records.
4. Transform and analyze data using Apache Pig.
5. Perform business analytics using Hive.
6. Analyze monthly and regional sales.
7. Identify top-performing products.
8. Analyze inventory and low-stock products.
9. Create partitioned Hive tables.
10. Create bucketed Hive tables.
11. Test partition pruning and bucket-based queries.
12. Prepare business recommendations.

## Data Cleaning

The original dataset contained 493 records.

After removing the repeated header record:

- Clean records: 492
- Duplicate transaction IDs: 0
- Invalid quantity records: 0
- Invalid unit price records: 0
- Invalid revenue records: 0
- Invalid cost records: 0
- Invalid discount records: 0

Negative-profit transactions were retained because they represent valid loss-making sales.

## Pig Scripts

The repository contains the following Pig scripts:

- clean_sales.pig – Cleans and filters sales data.
- region_sales.pig – Calculates regional sales and profit.
- monthly_sales.pig – Calculates monthly sales and profit.
- top_products.pig – Identifies the top 10 products by revenue.
- inventory_insights.pig – Identifies low-stock records.
- inventory_summary.pig – Summarizes inventory reorder requirements.

## Hive Analytics

The Hive SQL file contains queries for:

- Regional sales performance
- Monthly revenue and profit trends
- Top 10 products
- Category performance
- Inventory analysis
- Partitioned table analysis
- Bucketed table analysis

SQL source file:

hive/analytics.sql

## Hive Optimization

### Partitioning

Sales data was partitioned by:

sales_month

The table contains monthly partitions for 2025.

Partition pruning was tested using a query for a specific month.

### Bucketing

Sales data was bucketed using:

product_id

The table was configured with 4 buckets.

A bucket-based query was tested for product P015.

## Key Business Insights

- Regional sales performance varies across East, West, North, and South regions.
- Monthly revenue shows significant variation throughout the year.
- Earphones generated the highest product revenue in the analyzed dataset.
- Several products have stock levels at or below their reorder levels.
- Inventory monitoring can help reduce stock-out risks.
- Partitioning improves the organization and filtering of time-based sales data.
- Bucketing can improve queries involving product-based analysis.

## Repository Structure

```text
retail_sales_project/
│
├── clean_sales.pig
├── region_sales.pig
├── monthly_sales.pig
├── top_products.pig
├── inventory_insights.pig
├── inventory_summary.pig
│
├── hive/
│   └── analytics.sql
│
└── README.md
