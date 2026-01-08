import pandas as pd
import mysql.connector
from datetime import datetime
import re

# ---------------- DATABASE CONFIG ----------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "root@123",
    "database": "fleximart"
}

# ---------------- UTILITY FUNCTIONS ----------------
def standardize_phone(phone):
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", str(phone))
    if len(digits) == 10:
        return "+91-" + digits
    return None

def standardize_category(cat):
    if pd.isna(cat):
        return "Unknown"
    return str(cat).strip().title()

def parse_date(date_val):
    try:
        return pd.to_datetime(date_val).date()
    except:
        return None

# ---------------- CONNECT DATABASE ----------------
conn = mysql.connector.connect(**DB_CONFIG)
cursor = conn.cursor()

report = []

# ---------------- CUSTOMERS ----------------
customers = pd.read_csv("/Users/riddhichawla/Desktop/Assignment/data/customer_raw.csv")
initial_count = len(customers)

customers.drop_duplicates(inplace=True)
customers["email"].fillna("unknown_" + customers.index.astype(str) + "@mail.com", inplace=True)
customers["phone"] = customers["phone"].apply(standardize_phone)
customers["registration_date"] = customers["registration_date"].apply(parse_date)

report.append(f"Customers processed: {initial_count}, loaded: {len(customers)}")

for _, row in customers.iterrows():
    cursor.execute("""
        INSERT IGNORE INTO customers
        (first_name, last_name, email, phone, city, registration_date)
        VALUES (%s,%s,%s,%s,%s,%s)
    """, tuple(row))

conn.commit()

# ---------------- PRODUCTS ----------------
products = pd.read_csv("/Users/riddhichawla/Desktop/Assignment/data/prodcuts_raw.csv")
initial_count = len(products)

products.drop_duplicates(inplace=True)
products["price"].fillna(products["price"].mean(), inplace=True)
products["stock_quantity"].fillna(0, inplace=True)
products["category"] = products["category"].apply(standardize_category)

report.append(f"Products processed: {initial_count}, loaded: {len(products)}")

for _, row in products.iterrows():
    cursor.execute("""
        INSERT IGNORE INTO products
        (product_name, category, price, stock_quantity)
        VALUES (%s,%s,%s,%s)
    """, tuple(row))

conn.commit()

# ---------------- SALES ----------------
sales = pd.read_csv("/Users/riddhichawla/Desktop/Assignment/data/sales_raw.csv")
initial_count = len(sales)

sales.drop_duplicates(inplace=True)
sales["order_date"] = sales["order_date"].apply(parse_date)
sales.dropna(subset=["customer_id", "product_id"], inplace=True)

report.append(f"Sales processed: {initial_count}, loaded: {len(sales)}")

for _, row in sales.iterrows():
    cursor.execute("""
        INSERT INTO orders (customer_id, order_date, total_amount)
        VALUES (%s,%s,%s)
    """, (row["customer_id"], row["order_date"], row["total_amount"]))
    order_id = cursor.lastrowid

    cursor.execute("""
        INSERT INTO order_items
        (order_id, product_id, quantity, unit_price, subtotal)
        VALUES (%s,%s,%s,%s,%s)
    """, (order_id, row["product_id"], row["quantity"], row["unit_price"], row["subtotal"]))

conn.commit()

# ---------------- REPORT ----------------
with open("data_quality_report.txt", "w") as f:
    for line in report:
        f.write(line + "\n")

cursor.close()
conn.close()

print("ETL Pipeline Completed Successfully")
