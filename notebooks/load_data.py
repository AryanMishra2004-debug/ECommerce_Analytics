from sqlalchemy import create_engine
import pandas as pd

# Replace YOUR_PASSWORD with your actual MySQL root password
engine = create_engine("mysql+pymysql://root:aryan2004@localhost/ecommerce_analytics")

# maps table name -> actual CSV filename
tables = {
    "orders": "olist_orders_dataset.csv",
    "order_items": "olist_order_items_dataset.csv",
    "customers": "olist_customers_dataset.csv",
    "order_payments": "olist_order_payments_dataset.csv",
    "order_reviews": "olist_order_reviews_dataset.csv",
    "products": "olist_products_dataset.csv",
    "sellers": "olist_sellers_dataset.csv",
}

for table_name, filename in tables.items():
    df = pd.read_csv(f"data/raw/{filename}")
    df.to_sql(table_name, engine, if_exists="replace", index=False)
    print(f"Loaded {table_name}: {len(df)} rows")