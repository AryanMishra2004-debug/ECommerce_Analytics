# E-Commerce Sales & Customer Analytics Dashboard

End-to-end analytics project analyzing e-commerce order, customer, payment, and review data using **SQL, Python, and Power BI**. Built on the [Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).

---

## 📌 Project Overview

This project simulates a real-world business analytics workflow: raw transactional data is loaded into a relational database, analyzed with SQL and Python to derive key business metrics, and visualized in an interactive Power BI dashboard.

**Business questions answered:**
- What is our monthly/weekly revenue trend?
- What is the Average Order Value (AOV)?
- What is each customer's Lifetime Value (CLV)?
- What % of customers make repeat purchases?
- How well do we retain customers over time?
- Which products/categories perform best and worst?
- How does performance vary by region?
- What is our cancellation/refund rate?
- How can customers be segmented for targeted strategy?

---

## 🛠️ Tech Stack

| Layer | Tools |
|---|---|
| Database | MySQL |
| Data Loading & Cleaning | Python (Pandas, SQLAlchemy) |
| Analysis | SQL (CTEs, window functions, joins, aggregations) |
| Visualization | Power BI (Power Query, DAX, data modeling) |
| Environment | VS Code |

---

## 📂 Project Structure

```
ecommerce-analytics/
├── data/
│   └── raw/              # Raw Olist CSV files (orders, customers, payments, etc.)
├── sql/                  # SQL analysis queries, one file per business question
│   ├── monthly_revenue.sql
│   ├── aov.sql
│   ├── clv.sql
│   ├── repeat_purchase_rate.sql
│   ├── cohort_retention.sql
│   ├── top_bottom_products.sql
│   ├── regional_performance.sql
│   └── cancellation_rate.sql
├── notebooks/
│   ├── load_data.py       # Loads raw CSVs into MySQL
│   └── segmentation.ipynb # RFM customer segmentation in Pandas
├── powerbi/
│   └── ecommerce_dashboard.pbix
└── README.md
```

---

## 🗄️ Dataset

**Source:** [Olist Brazilian E-Commerce Public Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

Contains ~100K orders placed between 2016–2018 across multiple Brazilian marketplaces, split across relational tables:

| Table | Description |
|---|---|
| `orders` | Order status and timestamps |
| `order_items` | Line-item level product/price/freight data |
| `order_payments` | Payment method, installments, value |
| `order_reviews` | Customer review scores and comments |
| `customers` | Customer ID and location |
| `products` | Product category and dimensions |
| `sellers` | Seller ID and location |
| `product_category_name_translation` | Portuguese → English category mapping |

---

## ⚙️ Setup & Reproduction

### 1. Clone and set up environment
```bash
git clone <your-repo-url>
cd ecommerce-analytics
pip install pandas sqlalchemy pymysql
```

### 2. Download the dataset
Download the CSVs from Kaggle and place them in `data/raw/`.

### 3. Create the database
```sql
CREATE DATABASE ecommerce_analytics;
```

### 4. Load data into MySQL
```bash
python notebooks/load_data.py
```

### 5. Run SQL analysis
Open any file in `sql/` using a SQL client (e.g. VS Code + SQLTools, or MySQL Workbench) connected to `ecommerce_analytics`.

### 6. Open the Power BI dashboard
Open `powerbi/ecommerce_dashboard.pbix` in Power BI Desktop and refresh the data connection to point to your local MySQL instance (`localhost:3306`, database `ecommerce_analytics`).

---

## 📊 Key Metrics & Analysis

- **Revenue trend** — monthly/weekly revenue and order volume
- **AOV** — average order value across delivered orders
- **CLV** — total revenue per unique customer, ranked
- **Repeat purchase rate** — % of customers with more than one order
- **Cohort retention** — month-over-month retention by first-purchase cohort
- **Product performance** — top/bottom performing products and categories
- **Regional performance** — revenue and order volume by state/region
- **Cancellation/refund rate** — % of orders canceled or unavailable
- **Customer segmentation** — RFM-based segmentation (Recency, Frequency, Monetary)

---

## 📈 Power BI Dashboard

Includes:
- Revenue, Orders, AOV, Customers, and Monthly Growth KPI cards
- Product/category performance breakdown
- Geographic performance map
- Star-schema data model with a dedicated date dimension table

---

## 🔑 Key Learnings

- Handling one-to-many join fan-out (e.g. `order_payments` installments) before aggregating
- Distinguishing `customer_id` (per-order) vs `customer_unique_id` (per-person) for accurate CLV/retention analysis
- Building a star schema with a custom date dimension table in Power Query
- Writing modular, CTE-based SQL for readability and debugging

---

## 📎 Author
Aryan Mishra [Linkedin](www.linkedin.com/in/aryan-mishra-05216a1aa)
















[Your Name] — [LinkedIn] — [Portfolio/GitHub]
