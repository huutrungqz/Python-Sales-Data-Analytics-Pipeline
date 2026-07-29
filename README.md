# 📊 Sales Analytics Data Warehouse Pipeline
### Building an End-to-End Sales Data Warehouse using Python & PostgreSQL
  
Author: Nguyen Huu Trung  
Tools: Python, PostgreSQL, SQL, Pandas, SQLAlchemy

---

## 📑 Table of Contents  
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

# 🏗 Data Warehouse Architecture

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

# 📁 Project Structure

```text
Python-Sales-Data-Analytics-Pipeline/
│
├── 1. etl/          # Python ETL scripts
├── 2. sql/          # SQL transformations & analytics
├── data/            # Source datasets
├── logs/            # ETL logs
├── .env.example     # Environment variables template
├── .gitignore
├── requirements.txt
└── README.md
```

---


## ⚒️ Main Process

1️⃣ Data Cleaning & Preprocessing  
2️⃣ Exploratory Data Analysis (EDA)  
3️⃣ SQL/ Python Analysis 

👉🏻 First, explain codes' purpose - what they do in 1, 2 short sentences.

*_Example_*

## Task 1: Analyze bounce rate...

Bounce rate represents the percentage of website sessions where users visit only one page and leave without interacting further with the site. A high bounce rate can indicate that visitors are not [....]

**_📌You need to show your understanding/ thinking process when you do this analysis. In the above exp, I explain the meaning of Bounce Rate in Marketing performance analysis - which demonstrates my understanding about the metric & its role in my projects/ flow of analysis"_**
**_📌If the task is just simple as "Remove duplication, Replace null value.."--> Summarize all steps related to Transforming & Cleaning data steps in a group & explain shortly at once the reason why you need that transformation_**

👉🏻 Then how your query/ code & Insert screenshots of your result

 **_If your result is a very long table with many records, only show top 5/10 and bottom 5/10 rows, or records that relevant to the insights/ observation below_**

*_Example_*

### Project Results:

| Period   | Name                | Count Items | Count Orders | Sales        |
|:---------|:--------------------|------------:|-------------:|-------------:|
| Apr 2014 | Bib-Shorts          |           4 |            1 |       233.97 |
| Feb 2014 | Bib-Shorts          |           4 |            2 |       233.97 |
| Jul 2013 | Bib-Shorts          |           2 |            1 |       116.99 |
| Jun 2013 | Bib-Shorts          |           2 |            1 |       116.99 |
| Apr 2014 | Bike Racks          |          45 |           45 |     5,400.00 |
| Aug 2013 | Bike Racks          |         222 |           63 |    17,387.18 |
| Dec 2013 | Bike Racks          |         162 |           48 |    12,582.29 |
| Feb 2014 | Bike Racks          |          27 |           27 |     3,240.00 |
| Jan 2014 | Bike Racks          |         161 |           53 |    12,840.00 |
| Jul 2013 | Bike Racks          |         422 |           75 |    29,802.30 |
| ...      | ...                 |         ... |          ... |          ... |
| May 2014 | Vests               |         610 |          103 |    23,640.71 |
| Nov 2013 | Vests               |         315 |           75 |    12,937.24 |
| Oct 2013 | Vests               |         611 |           93 |    23,255.74 |
| Sep 2013 | Vests               |         623 |          102 |    24,100.47 |
| Jul 2013 | Wheels              |           4 |            1 |       698.63 |
| Jun 2013 | Wheels              |           3 |            1 |       450.91 |
| Sep 2013 | Wheels              |           1 |            1 |        83.30 |

*A summary of the full results. The complete dataset is available in the repository.*

👉🏻 Finally, explain your observations/ findings from the results 
  
 _Describe trends, key metrics, and patterns._  

---

## 🔎 Final Conclusion & Recommendations  

👉🏻 Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following:  

📍 Key Takeaways:  
✔️ Recommendation 1  
✔️ Recommendation 2  
✔️ Recommendation 3

**_📌Remember to summarize the most core insights/ observations you extract from the entire projects. 
 Recap ONLY key actions/ recommendations. DO NOT copy paste everything above_**
