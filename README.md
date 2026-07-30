# 📊 Sales Analytics Data Warehouse Pipeline
### Building an End-to-End Sales Data Warehouse using Python & PostgreSQL
  
Author: Nguyen Huu Trung  
Tools: Python, PostgreSQL, SQL, Pandas, SQLAlchemy

---

# 📑 Table of Contents  
1. Background & Overview
2. Dataset Description
3. Data Warehouse Architecture
4. ETL Pipeline
5. Data Modeling
6. SQL Analytics
7. Project Structure
8. Technologies Used
9. Key Business Outcomes

---

# 📌 Background & Overview

## Business Problem

FMCG distributors generate sales data from multiple operational systems such as:

- Sales transactions
- Product master
- Customer master
- Sales targets
- Promotions
- Distributor orders
- Returns
- Employee information
- Territory mapping
  
These datasets are stored separately, making it difficult for analysts to produce reliable business reports.
This project builds an end-to-end analytics pipeline that integrates multiple data sources into a centralized Data Warehouse for business reporting and decision-making.

## Project Objectives

This project aims to:

- Build an automated ETL pipeline using Python.
- Load raw data into a PostgreSQL Data Warehouse.
- Transform data through Bronze → Silver → Gold layers.
- Design a Star Schema for analytics.
- Create fact and dimension tables.
- Build analytical data marts for business reporting.
- Enable sales performance analysis using SQL.

---

## Business Questions

This project helps answer questions such as:

- How are sales performing against targets?
- Which distributors contribute the highest revenue?
- Which products generate the most sales?
- Which customers contribute the most revenue?
- What is the product return rate?
- Which employees achieve the highest sales performance?
- Which territories perform best?


---

## 📂 Dataset Description & Data Structure  

### 📌 Data Source  
FMCG Distribution dataset.
Format
- CSV
- XLSX

Data includes ten business entities.


### 📊 Data Structure & Relationships  

#### 1️⃣ Tables Used:  

| Sales Transactions |
| Sales Target Plan |
| Customer Master |
| Product Master |
| Distributor Orders |
| Distributor Master |
| Employee Master |
| Territory Mapping |
| Return Transactions |
| Promotion Program |

### 🏗 Data Warehouse Architecture

```
Raw Files
      │
      ▼
Python ETL
      │
      ▼
Bronze Layer
      │
SQL Cleaning
      ▼
Silver Layer
      │
Business Modeling
      ▼
Gold Layer
      │
      ├── Fact Sales
      ├── Fact Returns
      ├── Fact Targets
      ├── Dim Customers
      ├── Dim Products
      ├── Dim Employees
      ├── Dim Distributors
      └── Dim Date
             │
             ▼
Business Data Marts
```

## 📁 Project Structure

```text
Python-Sales-Data-Analytics-Pipeline/
│
├── 1. etl/          # Python ETL scripts
├── 2. sql/          # SQL transformations & analytics
├── data/            # Source datasets
├── logs/            # ETL logs
├── .env.example     # Environment variables template
```

---


# ⚒️ Main Process

## Step 1: Data Ingestion (Python ETL)

### Purpose

The ETL layer is responsible for extracting raw business data from CSV/Excel files and loading them into the PostgreSQL **Bronze Layer (`raw` schema)**.

Each source dataset is processed independently to ensure data traceability and simplify future maintenance.

### Workflow

- Load database credentials from .env file
- Establish a PostgreSQL connection using SQLAlchemy
- Read source files with Pandas
- Load raw data into the `raw` schema
- Record ETL execution status through logging

### Python Implementation

```python
from dotenv import load_dotenv
import os
import pandas as pd
from sqlalchemy import create_engine
import logging

logging.basicConfig(
    filename='ingestion_log.txt',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

load_dotenv()

HOST = os.getenv("DB_HOST")
PORT = os.getenv("DB_PORT")
USER = os.getenv("USER_NAME")
PWD = os.getenv("DB_PASSWORD")
DB = os.getenv("DB_DBNAME")

engine = create_engine(
    f'postgresql+psycopg2://{USER}:{PWD}@{HOST}:{PORT}/{DB}'
)

file_path = r'...\SRC01_sales_transactions.csv'
table_name = 'sales_transactions'

def extract_raw_csv(file_path):
    return pd.read_csv(file_path)

try:
    table = extract_raw_csv(file_path)

    table.to_sql(
        name=table_name,
        con=engine,
        if_exists='replace',
        schema='raw'
    )

    logging.info(f'Load {table_name} successfully')

except Exception as e:
    logging.error(e)
```

### Output

*(Insert screenshot of PostgreSQL raw.sales_transactions table.)*

### Observation

All source datasets are successfully ingested into the Bronze layer while preserving the original business data.


## Step 2: Data Cleaning & Transformation (Bronze → Silver)

### Purpose

The Bronze tables contain raw operational data that may include inconsistent formats and data types.

The transformation process standardizes the data into clean, analysis-ready tables stored in the **Silver Layer**.

### Main Transformations

- Standardize data types
- Convert date columns
- Convert numeric values
- Handle null values
- Remove unnecessary columns
- Apply business rules
- Create cleaned Silver tables

### Example SQL

```sql
CREATE TABLE silver.sales_transactions AS

SELECT
    order_id,
    order_date::date,
    customer_id,
    employee_id,
    product_id,
    quantity::int,
    unit_price::numeric,
    net_amount::numeric
FROM raw.sales_transactions;
```

### Output

*(Insert screenshot of silver.sales_transactions.)*

### Observation

The Silver layer provides standardized datasets that are consistent and reusable across multiple analytical scenarios.


## Step 3: Data Warehouse Modeling (Silver → Gold)

### Purpose

Instead of querying transactional tables directly, this project adopts a **Star Schema** to improve analytical performance and simplify business reporting.

Dimension tables provide descriptive attributes, while fact tables store measurable business events.

### Data Model

Dimension Tables

- dim_customers
- dim_products
- dim_distributors
- dim_employees
- dim_date

Fact Tables

- fact_sales
- fact_returns
- fact_targets

### Example SQL

```sql
CREATE TABLE gold.fact_sales AS

SELECT
    customer_key,
    product_key,
    employee_key,
    distributor_key,
    date_key,
    quantity,
    sales_amount
FROM silver.sales_transactions;
```

### Business Data Marts

The Gold layer is further transformed into analytical data marts such as:

- mart_sales_vs_target
- mart_distributor_performance

### Output

*(Insert Star Schema image and a screenshot of one Data Mart.)*

### Observation

The Star Schema enables efficient analytical queries and provides a solid foundation for dashboards and KPI reporting.

# 🔎 Final Conclusion & Recommendations

## Project Summary

This project demonstrates the development of an end-to-end Sales Analytics Data Warehouse using Python and PostgreSQL.

Starting from multiple raw business datasets, the project automates the ETL process, standardizes raw operational data, and transforms it into a Star Schema that supports analytical reporting.

The final output consists of reusable fact tables, dimension tables, and business data marts that provide a scalable foundation for future reporting and dashboard development.

---

## Key Achievements

✔ Developed an automated ETL pipeline using Python.

✔ Successfully ingested multiple business datasets into the PostgreSQL Bronze layer.

✔ Standardized and transformed raw operational data into the Silver layer.

✔ Designed a Star Schema with fact and dimension tables.

✔ Built analytical data marts to support business reporting.

✔ Applied Data Warehouse concepts using the Bronze → Silver → Gold architecture.
