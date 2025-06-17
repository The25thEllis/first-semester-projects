-- 1. CREATE CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);
-- 2. CREATE PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);
-- 3. CREATE ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
--POPULATING CUSTOMER TABLE WITH SAMPLE DATA
INSERT
	INTO
	customers
VALUES
(1,
'Michael Scott',
'michael@dundermifflin.com',
'2024-01-10'),
(2,
'Pam Beesly',
'pam@dundermifflin.com',
'2024-02-15'),
(3,
'Jim Halpert',
'jim@dundermifflin.com',
'2024-03-20'),
(4,
'Dwight Schrute',
'dwight@dundermifflin.com',
'2024-01-25'),
(5,
'Stanley Hudson',
'stanley@dundermifflin.com',
'2024-04-05');
--POPULATING PRODUCTS TABLE WITH SAMPLE DATA 
INSERT
	INTO
	products
VALUES
(101,
'Ballpoint Pen',
'Stationery',
1.20),
(102,
'Stapler',
'Office Supplies',
4.50),
(103,
'Notebook',
'Stationery',
2.75),
(104,
'Desk Lamp',
'Office Equipment',
15.99),
(105,
'Paper',
'Stationery',
3.40);
--POPULATING ORDERS TABLE WITH SAMPLE DATA
INSERT
	INTO
	orders
VALUES
(1001,
1,
101,
5,
'2024-05-01'),
(1002,
2,
103,
2,
'2024-05-02'),
(1003,
3,
104,
1,
'2024-05-03'),
(1004,
4,
102,
3,
'2024-05-04'),
(1005,
5,
105,
4,
'2024-05-05');
--RETRIEVING ALL THE CUSTOMERS
SELECT
	*
FROM
	customers
	--ALTER ONE OF THE TABLES TO ADD A NEW COLUMN
ALTER TABLE customers
ADD phone_number VARCHAR(15);
-- RETRIEVE ALL ORDERS MADE BY A SPECIFIC CUSTOMER (WHERE + JOIN)
SELECT
	o.order_id,
	o.order_date,
	p.product_name,
	o.quantity
FROM
	orders o
JOIN products p ON
	o.product_id = p.product_id
WHERE
	o.customer_id = 3;
--TOTAL NUMBER OF ORDERS
SELECT
	COUNT(*) AS total_orders
FROM
	orders;
--CALCULATE THE TOTAL REVENUE FROM ALL ORDERS (SUM(PRICE * QUANTITY)).

SELECT
	SUM(p.price * o.quantity) AS total_revenue
FROM
	orders o
JOIN products p ON
	o.product_id = p.product_id;
-- USE INNER JOIN TO SHOW ORDER DETAILS INCLUDING CUSTOMER AND PRODUCT NAMES

SELECT
	o.order_id,
	c.name AS customer_name,
	p.product_name,
	o.quantity,
	o.order_date
FROM
	orders o
INNER JOIN customers c ON
	o.customer_id = c.customer_id
INNER JOIN products p ON
	o.product_id = p.product_id;
--USE LEFT JOIN TO SHOW ALL PRODUCTS AND ANY RELATED ORDER (EVEN IF NOT SOLD).

SELECT
	p.product_name,
	o.order_id,
	o.quantity
FROM
	products p
LEFT JOIN orders o ON
	p.product_id = o.product_id;
--AVERAGE PRODUCT PRICE.

SELECT
	AVG(price) AS average_price
FROM
	products;
--USE LEFT JOIN TO LIST ALL CUSTOMERS AND INCLUDE THEIR ORDERS (IF ANY).

SELECT
	c.customer_id,
	c.name AS customer_name,
	o.order_id,
	o.product_id,
	o.quantity,
	o.order_date
FROM
	customers c
LEFT JOIN orders o ON
	c.customer_id = o.customer_id;
