# 🍽️ Kolkata Restaurant Data Management & Analytics

![Project Type](https://img.shields.io/badge/Project-Data%20Analytics-orange)
![Database](https://img.shields.io/badge/Database-MySQL-blue)
![BI](https://img.shields.io/badge/BI-Power%20BI-yellow)
![Language](https://img.shields.io/badge/SQL-MySQL-lightgrey)

## 📌 Project Overview

**Kolkata Restaurant Data Management & Analytics** is an end-to-end data management and business intelligence project created for a moderate-sized restaurant in Kolkata.

The project demonstrates how raw restaurant operational data can be transformed into a structured relational database, analyzed using SQL, and converted into an interactive Power BI executive dashboard.

The solution focuses on:

- Sales and revenue performance
- Order volume and order types
- Customer activity and growth
- Menu and category performance
- Profitability
- Payment analysis
- Inventory monitoring
- Supplier management

---

## 🎯 Business Problem

A restaurant generates data across many different operational areas. If this information is stored separately without proper relationships and analysis, management may have difficulty answering questions such as:

- How much revenue is being generated?
- Which months perform best?
- Which menu categories generate the most revenue?
- How many orders are being placed?
- What is the average order value?
- How is the customer base changing?
- Which order type is most common?
- Which ingredients require replenishment?
- Which suppliers are connected to inventory requirements?

This project provides a centralized data management and reporting solution to answer these questions.

---

## 🎯 Project Objectives

1. Design a structured relational restaurant database.
2. Store restaurant data using appropriate tables, keys, constraints and data types.
3. Import and manage operational data using MySQL.
4. Perform basic, intermediate and advanced SQL analysis.
5. Build meaningful DAX measures in Power BI.
6. Develop a professional one-page executive dashboard.
7. Provide actionable business insights for restaurant management.

---

# 🗄️ Database Structure

The MySQL database contains **10 core relational tables**:

| # | Table | Purpose |
|---|---|---|
| 1 | Customers | Customer information and registration data |
| 2 | Employees | Employee and role information |
| 3 | Menu_Categories | Menu category information |
| 4 | Menu_Items | Restaurant menu items and pricing |
| 5 | Orders | Order-level transaction information |
| 6 | Order_Details | Individual items within each order |
| 7 | Payments | Payment transactions and methods |
| 8 | Suppliers | Supplier information |
| 9 | Inventory | Ingredient stock and reorder levels |
| 10 | Purchase_Orders | Inventory purchasing information |

### 🔗 Main Relationships

```text
Customers ────────────< Orders
Employees ────────────< Orders
Orders ───────────────< Order_Details
Orders ─────────────── Payments

Menu_Categories ──────< Menu_Items
Menu_Items ───────────< Order_Details

Suppliers ────────────< Inventory
Suppliers ────────────< Purchase_Orders
Inventory ────────────< Purchase_Orders
```

Primary keys and foreign keys are used to maintain data integrity and connect operational data across the database.

---

# 📊 Data

The project uses structured restaurant data covering:

- Customers
- Employees
- Menu categories
- Menu items
- Orders
- Order details
- Payments
- Suppliers
- Inventory
- Purchase orders

The raw data is maintained separately from the SQL analysis and Power BI files.

---

# 🧮 SQL Analysis

SQL analysis is organized into three levels.

### Level 1 — Basic SQL

Includes:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- COUNT
- SUM
- AVG
- MIN
- MAX

### Level 2 — Intermediate SQL

Includes:

- INNER JOIN
- LEFT JOIN
- CASE
- HAVING
- Date functions
- Aggregations
- Multiple-table analysis

### Level 3 — Advanced / Business SQL

Business-focused analysis includes:

- Monthly revenue
- Revenue by category
- Top-selling menu items
- Customer analysis
- Employee performance
- Payment analysis
- Order-type analysis
- Inventory monitoring
- Supplier analysis
- Profitability analysis

---

# 📈 Power BI Executive Dashboard

The project contains **one final executive dashboard page** designed for restaurant management.

### KPI Cards

The current dashboard shows:

| KPI | Value |
|---|---:|
| 💰 Total Revenue | ₹6.33M |
| 🧾 Total Orders | 4,000 |
| 👥 Total Customers | 500 |
| 🛒 Average Order Value | ₹1.58K |
| 📈 Total Profit | ₹2.98M |
| 📊 Profit Margin | 47.14% |

### Dashboard Visualizations

The dashboard includes:

- 📈 Monthly Revenue Trend
- 🍽️ Revenue by Menu Category
- 🍴 Top Selling Menu Items
- 🧾 Orders by Order Type
- 👥 Customer Growth
- ⚠️ Inventory Monitoring

### Interactive Filters

- 📅 Order Date
- 🍽️ Menu Category
- 🧾 Order Type
- 💳 Payment Mode

---

# 🧠 DAX Measures

Power BI DAX is used to create business calculations such as:

```text
Total Revenue
Total Orders
Total Customers
Average Order Value
Total Profit
Profit Margin %
Total Quantity Sold
Low Stock Items
Total Suppliers
Total Menu Items
```

These measures allow the dashboard to respond dynamically to filters and user selections.

---

# 🔄 Project Workflow

```text
Raw Data
    ↓
Data Cleaning & Preparation
    ↓
MySQL Relational Database
    ↓
Primary Keys + Foreign Keys + Constraints
    ↓
SQL Analysis
    ↓
Power BI Data Model
    ↓
DAX Measures
    ↓
Executive Dashboard
    ↓
Business Insights
```

---

# 💡 Business Value

The project helps restaurant management:

- Monitor overall revenue and profitability.
- Understand order volume and customer activity.
- Identify high-performing menu categories.
- Monitor customer growth.
- Understand order-type distribution.
- Identify inventory items approaching reorder levels.
- Support purchasing and operational decisions.
- Use data rather than assumptions for management decisions.

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Relational database management |
| **SQL** | Data querying and business analysis |
| **Power BI** | Dashboard and visualization |
| **DAX** | Business calculations and KPIs |
| **Excel / CSV** | Raw data preparation and storage |

---

# 📁 Project Structure

```text
KOLKATA_RESTAURANT_DATA_ANALYTICS
│
├── 01_Raw_Data
│   ├── customers
│   ├── employees
│   ├── menu_categories
│   ├── menu_items
│   ├── orders
│   ├── order_details
│   ├── payments
│   ├── suppliers
│   ├── inventory
│   └── purchase_orders
│
├── 02_SQL
│   ├── 01_create_tables.sql
│   ├── 02_basic_queries.sql
│   ├── 03_intermediate_queries.sql
│   └── 04_advanced_business_queries.sql
│
├── 03_PowerBI
│   └── Kolkata_Restaurant_Dashboard.pbix
│
├── 04_Documentation
│   ├── README.md
│   ├── Data_Dictionary.xlsx
│   ├── Business_Insights.md
│   └── Project_Summary.pdf
│
└── 05_Screenshots
    └── Executive_Dashboard.png
```

---

# 📌 Project Outcome

This project demonstrates an end-to-end **Data Management + Data Analytics** workflow:

> **Data → Database → SQL → Data Modeling → DAX → Power BI → Business Insights**

It demonstrates practical skills in:

- Relational database design
- Data management
- SQL querying
- Data modeling
- DAX
- Business intelligence
- Dashboard development
- Data storytelling

---

## 👤 Portfolio Project

**Project:** Kolkata Restaurant Data Management & Analytics  
**Domain:** Restaurant / Food Service  
**Focus:** Data Management + Data Analytics  
**Tools:** MySQL, SQL, Power BI, DAX, Excel/CSV

> **Note:** Dashboard KPI values and business insights should be revalidated against the final Power BI model before publishing the project publicly.
