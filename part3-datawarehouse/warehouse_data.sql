INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);


INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Samsung Galaxy S21','Electronics','Mobile',45999),
('P003','Apple MacBook Pro','Electronics','Laptop',52999),
('P007','HP Laptop','Electronics','Laptop',52999),
('P012','Dell Monitor 24inch','Electronics','Monitor',12999),
('P014','iPhone 13','Electronics','Mobile',69999),

('P002','Nike Running Shoes','Fashion','Footwear',3499),
('P004','Levis Jeans','Fashion','Clothing',2999),
('P008','Adidas T-Shirt','Fashion','Clothing',1299),
('P011','Puma Sneakers','Fashion','Footwear',4599),
('P020','Reebok Trackpants','Fashion','Clothing',1899),

('P006','Organic Almonds','Groceries','Dry Fruits',899),
('P009','Basmati Rice 5kg','Groceries','Grains',650),
('P015','Organic Honey 500g','Groceries','Condiments',450),
('P018','Masoor Dal 1kg','Groceries','Pulses',120),
('P019','Boat Earbuds','Electronics','Accessories',1499);


INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Bangalore','KA','Retail'),
('C002','Priya Patel','Mumbai','MH','Retail'),
('C003','Amit Kumar','Delhi','DL','Retail'),
('C004','Sneha Reddy','Hyderabad','TS','Retail'),
('C005','Vikram Singh','Chennai','TN','Retail'),
('C006','Anjali Mehta','Bangalore','KA','Retail'),
('C007','Ravi Verma','Pune','MH','Retail'),
('C008','Pooja Iyer','Bangalore','KA','Retail'),
('C009','Karthik Nair','Kochi','KL','Retail'),
('C010','Deepa Gupta','Delhi','DL','Retail'),
('C011','Arjun Rao','Hyderabad','TS','Retail'),
('C012','Lakshmi Krishnan','Chennai','TN','Retail');


INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240115,1,1,1,45999,0,45999),
(20240116,6,2,2,2999,0,5998),
(20240118,7,3,1,52999,0,52999),
(20240120,12,5,3,650,0,1950),
(20240122,4,6,1,12999,0,12999),
(20240123,5,7,2,1999,0,3998),
(20240125,8,8,1,1299,0,1299),
(20240128,9,9,1,4599,0,4599),
(20240201,11,10,5,899,0,4495),
(20240202,5,11,1,69999,0,69999),

(20240205,2,12,1,52999,0,52999),
(20240208,13,1,3,450,0,1350),
(20240210,15,2,2,1499,0,2998),
(20240212,8,3,3,1299,0,3897),
(20240215,10,4,1,5499,0,5499),
(20240218,16,5,1,32999,0,32999),
(20240220,14,6,2,1899,0,3798),
(20240222,18,7,10,120,0,1200),
(20240225,2,8,1,45999,0,45999),
(20240228,17,9,2,2999,0,5998),

-- repeat similar valid rows to reach 40 total
(20240115,1,10,1,45999,0,45999),
(20240116,6,11,2,2999,0,5998),
(20240118,7,12,1,52999,0,52999),
(20240120,12,1,3,650,0,1950),
(20240122,4,2,1,12999,0,12999),
(20240123,5,3,2,1999,0,3998),
(20240125,8,4,1,1299,0,1299),
(20240128,9,5,1,4599,0,4599),
(20240201,11,6,5,899,0,4495),
(20240202,5,7,1,69999,0,69999),

(20240205,2,8,1,52999,0,52999),
(20240208,13,9,3,450,0,1350),
(20240210,15,10,2,1499,0,2998),
(20240212,8,11,3,1299,0,3897),
(20240215,10,12,1,5499,0,5499);

