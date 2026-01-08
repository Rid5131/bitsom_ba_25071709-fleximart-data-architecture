# Star Schema Design Documentation

## Section 1: Schema Overview

### FACT TABLE: fact_sales
**Grain:** One row per product per order line item  
**Business Process:** Sales transactions

**Measures (Numeric Facts):**
- quantity_sold: Number of units sold in the transaction
- unit_price: Price per unit at the time of sale
- discount_amount: Discount applied to the transaction
- total_amount: Final sales amount calculated as  
  (quantity_sold × unit_price − discount_amount)

**Foreign Keys:**
- date_key → dim_date
- product_key → dim_product
- customer_key → dim_customer

---

### DIMENSION TABLE: dim_date
**Purpose:** Enables time-based analysis such as daily, monthly, quarterly, and yearly reporting  
**Type:** Conformed dimension

**Attributes:**
- date_key (PK): Surrogate key in YYYYMMDD format
- full_date: Actual calendar date
- day_of_week: Name of the day (Monday, Tuesday, etc.)
- day_of_month: Numeric day of the month
- month: Numeric month (1–12)
- month_name: Month name (January, February, etc.)
- quarter: Quarter of the year (Q1–Q4)
- year: Calendar year
- is_weekend: Boolean flag indicating weekend

---

### DIMENSION TABLE: dim_product
**Purpose:** Stores descriptive information about products for sales analysis

**Attributes:**
- product_key (PK): Surrogate key
- product_id: Business product identifier
- product_name: Name of the product
- category: Product category (Electronics, Apparel, etc.)
- subcategory: Product subcategory
- unit_price: Standard product price

---

### DIMENSION TABLE: dim_customer
**Purpose:** Stores customer demographic and segmentation information

**Attributes:**
- customer_key (PK): Surrogate key
- customer_id: Business customer identifier
- customer_name: Full name of the customer
- city: Customer city
- state: Customer state
- customer_segment: Segment classification (Retail, Corporate, etc.)

---

## Section 2: Design Decisions

The granularity of the fact table is kept at the order line item level, where each row represents a product sold in an order. This makes it easier to track how many units of a product were sold and how much revenue was generated for each sale. Having data at this level allows us to combine and summarize the data later based on time, product, or customer as needed.

Surrogate keys are used instead of natural keys because natural keys coming from source systems may change over time or may not always be unique. Using surrogate keys helps keep the data warehouse consistent and avoids problems when source data changes. It also helps improve query performance in large datasets.

This star schema supports both drill-down and roll-up analysis. For example, sales can be analyzed at a yearly level and then broken down into quarters or months using the date dimension. Similarly, users can move from total sales to specific products or customers. The simple structure of the schema also makes queries easier to write and understand.

---

## Section 3: Sample Data Flow

**Source Transaction:**  
Order #101, Customer "John Doe", Product "Laptop", Quantity: 2, Price: 50,000

**Data Warehouse Representation:**

**fact_sales**

{
date_key: 20240115,
product_key: 5,
customer_key: 12,
quantity_sold: 2,
unit_price: 50000,
discount_amount: 0,
total_amount: 100000
}


**dim_date**

{
date_key: 20240115,
full_date: '2024-01-15',
month: 1,
month_name: 'January',
quarter: 'Q1',
year: 2024
}


**dim_product**

{
product_key: 5,
product_name: 'Laptop',
category: 'Electronics'
}


**dim_customer**

{
customer_key: 12,
customer_name: 'John Doe',
city: 'Mumbai'
}