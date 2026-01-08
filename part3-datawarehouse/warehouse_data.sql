INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true);

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop Pro','Electronics','Laptop',75000),
('P002','Smartphone X','Electronics','Mobile',45000);

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','John Doe','Mumbai','MH','Retail'),
('C002','Jane Smith','Delhi','DL','Retail');

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,2,75000,5000,145000),
(20240106,2,2,1,45000,0,45000);
