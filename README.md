# 🛒 E-Commerce SQL Data Warehouse

## 📌 Project Overview
Built a production-style SQL Data Warehouse to analyze 100,000+ Brazilian e-commerce orders using Star Schema design and advanced SQL queries.

---

## 🛠️ Tech Stack
- **Database:** PostgreSQL 16
- **SQL Client:** DBeaver
- **Dataset:** Olist Brazilian E-Commerce (Kaggle)
- **Architecture:** Star Schema (Data Warehouse)

---

## 🏗️ Project Architecture
Raw Layer (Messy Data) → Clean Layer (Processed Data) → Star Schema (Data Warehouse) → Business Insights (Analytics)

### Layer 1 — Raw Layer
| Table | Description |
|---|---|
| customers_raw | Raw customer data |
| orders_raw | Raw orders data |
| products_raw | Raw products data |

### Layer 2 — Clean Layer
| Table | Records | Description |
|---|---|---|
| customers | 99,441 | Cleaned customer data |
| orders | 99,441 | Cleaned orders data |
| products | 32,951 | Cleaned products data |
| order_items | 112,650 | Cleaned items data |
| order_payments | 103,877 | Cleaned payments data |

### Layer 3 — Star Schema
| Table | Type | Records |
|---|---|---|
| fact_orders | Fact Table | 117,595 |
| dim_customers | Dimension | 99,441 |
| dim_products | Dimension | 32,951 |
| dim_sellers | Dimension | 3,095 |

---

## 📊 Business Insights Generated

### 1. 🏆 Top Customers
- Identified highest spending customers
- Analyzed purchase frequency per customer
- City and state wise customer distribution

### 2. 📈 Monthly Revenue Trend
- Month by month revenue analysis
- Business growth tracking
- Order volume trends

### 3. 🛍️ Best Selling Products
- Top 10 product categories by revenue
- Most ordered product categories
- Revenue per category analysis

### 4. 👥 Customer Segmentation
| Segment | Criteria |
|---|---|
| High Value | Total spend >= $1000 |
| Medium Value | Total spend >= $500 |
| Low Value | Total spend < $500 |

### 5. 🔄 Repeat vs New Customers
- Customer retention analysis
- Repeat purchase rate
- New vs returning customer ratio

### 6. 💳 Payment Method Analysis
| Payment Type | Transactions | Revenue |
|---|---|---|
| Credit Card | 86,769 | $15,589,100 |
| Boleto | 22,867 | $4,059,680 |
| Voucher | 6,268 | $405,873 |
| Debit Card | 1,691 | $253,534 |

---

## 🧠 SQL Skills Demonstrated
- ✅ Complex JOINs (multiple tables)
- ✅ CTEs (Common Table Expressions)
- ✅ Window Functions
- ✅ Aggregate Functions
- ✅ CASE Statements
- ✅ Data Type Casting
- ✅ NULL Handling (COALESCE)
- ✅ String Functions (TRIM, LOWER, UPPER)
- ✅ Date Functions (TO_CHAR, timestamp)
- ✅ Subqueries

---

## 📁 File Structure
```
ecommerce-sql-warehouse/
├── schema.sql      → Raw layer table definitions
├── cleaning.sql    → Data cleaning queries
├── warehouse.sql   → Star schema creation
├── analysis.sql    → Business insight queries
└── README.md       → Project documentation
```

---

## 🗃️ Dataset
- **Source:** Kaggle — Olist Brazilian E-Commerce
- **Link:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
- **Size:** 100,000+ orders, 2017-2018

---

## 💼 Resume Line
Built a SQL-based Data Warehouse using Star Schema to analyze 100K+ e-commerce transactions, generating insights on customer segmentation, revenue trends, and payment behavior using PostgreSQL.

---

## 👨‍💻 Author
- **Name:** Ujjwal
- **GitHub:** github.com/ujjwal
