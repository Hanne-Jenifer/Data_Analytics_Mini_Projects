# 🛒 Amazon Brazil Data Analysis Using SQL

This project analyzes **Amazon Brazil e-commerce data** across customers, orders, products, sellers,
and payments to investigate purchasing behavior, product performance, customer segments, payment
preferences, and sales trends using **PostgreSQL and advanced SQL techniques**.

---

## 🎯 Project Focus

The analysis investigates:

- Customer purchasing behavior and repeat purchases
- Payment preferences and transaction patterns
- Product and category performance
- Order values and purchase frequency
- High-value and loyal customers
- Seasonal and monthly sales trends
- Product sales performance over time
- Payment-method revenue and month-over-month growth

---

## 🗂️ Dataset

The project uses an interconnected Amazon Brazil e-commerce database containing:

| Table | Purpose |
| --- | --- |
| `customers` | Customer identifiers and location information |
| `orders` | Order status and order lifecycle timestamps |
| `order_items` | Products, sellers, prices, and shipping information |
| `product` | Product categories and product specifications |
| `seller` | Seller identifiers and location information |
| `payments` | Payment types, installments, and transaction values |

The analytical implementation uses the **six tables listed above** and their defined relationships.

---

## 🔍 Analysis

### 📌 Analysis I — Basic SQL

The first stage covers fundamental SQL operations and exploratory business analysis, including:

- Average payment value by payment type
- Payment-type share of total orders
- Product filtering based on price and category
- Top three months by total sales value
- Product categories with large price differences
- Payment types with the lowest transaction variability
- Identification of missing or invalid product-category values

### 👥 Analysis II — Customer, Product & Revenue

The second stage expands the analysis using **joins, grouping, temporary tables, and aggregations**
to examine:

- Order-value segments by payment type
- Product price ranges by category
- Customers with multiple orders
- Customer loyalty based on purchase frequency
- Top five product categories by total revenue

Customer segments are defined as:

| Segment | Orders |
| --- | ---: |
| **New** | 1 |
| **Returning** | 2–4 |
| **Loyal** | More than 4 |

### 📈 Analysis III — Advanced SQL

The final stage applies advanced SQL techniques to investigate:

- Seasonal sales performance
- Products performing above average sales quantity
- Monthly revenue trends during 2018
- Customer purchase-frequency segmentation
- Top 20 customers by average order value
- Cumulative product sales from first sale
- Monthly payment-method revenue and month-over-month growth

---

## 🧠 SQL Techniques

The project progresses from basic querying to advanced analytical SQL, including:

- Filtering and aggregation
- `JOIN` operations
- `GROUP BY` and `HAVING`
- Subqueries
- Common Table Expressions (`CTEs`)
- Window functions
- Ranking
- Recursive CTEs
- Date and time-based analysis
- Month-over-month calculations
- Statistical aggregation

---

## 🛠️ Tools & Technologies

| Technology | Purpose |
| --- | --- |
| **PostgreSQL** | Database creation and SQL analysis |
| **pgAdmin** | Database management and query execution |
| **SQL** | Querying, transformation, and analytical processing |
| **Excel** | 2018 revenue visualization |

---

## 🔄 Workflow

**Amazon Brazil Data → PostgreSQL Database → SQL Analysis → Advanced SQL → Analysis & Visualization**

---

## 📝 Note on Results

The available project materials contain the **SQL analysis and analytical requirements**, but do not
include the resulting query outputs. Numerical findings are therefore not stated in this README
rather than being inferred or fabricated.

---

## 👤 Author

**Hanne Jenifer**
