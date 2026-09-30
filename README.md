Retail Sales Data Processing and Business Intelligence Platform
Project 3: Retail Sales Performance Analysis
Project Overview
The Retail Sales Data Processing and Business Intelligence Platform is a data processing and analysis project developed to analyze retail sales data using Hadoop HDFS, Apache Pig, and Apache Hive.

The project begins by loading the retail sales dataset into HDFS. Apache Pig is used for data processing and cleaning, after which the processed data is analyzed using Apache Hive. Hive queries are used to examine sales performance across regions, monthly revenue trends, product performance, and inventory-related information.

The project also demonstrates Hive bucketing to organize data based on product_id and includes visualizations for regional sales performance, monthly revenue trends, and top products by revenue.

Overall, the project demonstrates a complete workflow for processing retail sales data using Hadoop ecosystem technologies and converting the processed data into useful business-oriented insights.

Objective
The main objective of this project is to process retail sales data using Hadoop ecosystem technologies and generate useful business insights.

The project focuses on:

Processing retail sales data using HDFS
Cleaning and transforming data using Apache Pig
Creating and managing Hive tables
Analyzing regional sales performance
Analyzing monthly sales and revenue trends
Identifying top-performing products
Analyzing inventory-related information
Demonstrating Hive bucketing for optimization
Presenting analytical results through visualizations
Technologies Used
Hadoop HDFS – Distributed storage of retail sales data
Apache Pig – Data processing and transformation
Apache Hive – Data warehousing and SQL-based analysis
SQL / HiveQL – Data querying and analysis
Linux / Ubuntu – Project environment
Git & GitHub – Version control and project repository
Dataset
The dataset used in this project is:

retail_sales_50kb.csv

The dataset contains retail transaction information including:

Transaction ID
Customer ID
Order Date
Region
City
Product ID
Product Name
Category
Quantity
Unit Price
Discount
Revenue
Cost
Profit
Stock on Hand
Reorder Level
Lead Time Days
Project Workflow
Retail Sales Dataset
        |
        v
     HDFS
        |
        v
   Apache Pig
        |
        v
Data Cleaning & Processing
        |
        v
     Apache Hive
        |
        v
   Data Analysis
        |
        +----------------------+
        |          |           |
        v          v           v
 Regional     Monthly       Product
 Analysis     Revenue       Analysis
        |          |           |
        +----------+-----------+
                   |
                   v
             Visualizations
                   |
                   v
          Business Insights
