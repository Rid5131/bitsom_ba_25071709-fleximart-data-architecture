ENTITY: customers
Purpose: Stores customer demographic and contact data

Attributes:
customer_id (PK): Unique customer identifier
first_name: Customer first name
last_name: Customer last name
email: Unique email
phone: Standardized contact number
city: City of residence
registration_date: Account creation date

ENTITY: products
Stores product catalog information

ENTITY: orders
Stores high-level order details

ENTITY: order_items
Stores line-item details per order
Relationships
One customer → many orders
One order → many order items
One product → many order items


This database design adheres to Third Normal Form (3NF) by ensuring that every non-key attribute is fully functionally dependent on the primary key and that no transitive dependencies exist. In the customers table, attributes such as first_name, last_name, email, phone, city, and registration_date depend solely on customer_id. Similarly, product-related attributes depend only on product_id. Order-level details such as order_date and total_amount depend only on order_id, while order_items resolves the many-to-many relationship between orders and products. This separation avoids redundancy, prevents update anomalies, and ensures data integrity.