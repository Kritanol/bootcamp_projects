-- Restaurant owners
-- build 5 tables
-- 1x Fact 4x Dimension
-- Search Google how to add foreign key into the table
-- Write SQL 3-5 queries analyze data
-- 1X subquery/ with clause
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- Create menu table (Dimension Table 1) 
CREATE TABLE menu (
    menu_id INT NOT NULL PRIMARY KEY,
    menu_name TEXT,
    price real
);
-- Insert menu table
INSERT INTO menu VALUES
    (1, 'Fish & Chips', 400),
    (2, 'Beef Wellington', 4500),
    (3, 'Onion Soup', 250),
    (4, 'Rosemary Angus Beef Steak 400g.', 2800),
    (5, 'Spaghetti Carbonara', 350),
    (6, 'Cesar Salad', 280),
    (7, 'Pad Thai', 150),
    (8, 'Tom Yum Kung', 350),
    (9, 'Vanilla Ice Cream', 80);
-----------------------------------------------------------------------------------------
-- Create customer table (Dimension Table 2)
CREATE TABLE customer (
    customer_id INT NOT NULL PRIMARY KEY,
    customer_name TEXT,
    customer_lastname TEXT,
    gender TEXT,
    age int,
    district TEXT
);
-- Insert customer table
INSERT INTO customer values
    (1,  'Jim',    'Dole',  'M',  25, 'Pathumwan'),
    (2,  'Sarah',  'Leigh', 'F',  27, 'Phaya Thai'),
    (3,  'Andy',   'Green', 'M',  18, 'Sathon'),
    (4,  'Dennis', 'Gray',  'F',  35, 'Khlong Toey'),
    (5,  'Peter',  'Pan',   'M',  30, 'Sathon'),
    (6,  'James',  'Bond',  'M',  40, 'Lat Phrao'),
    (7,  'Jack',   'Brown', 'M',  33, 'Pathumwan'),
    (8,  'Jennie', 'Kim',   'F',  22, 'Phaya Thai'),
    (9,  'Anne',   'Black', 'F',  68, 'Ratchathewi'),
    (10, 'John',   'Lennon','M',  55, 'Khlong Toey'),
    (11, 'Ken',    'Brown', 'M',  33, 'Pathumwan'),
    (12, 'Jake',   'White', 'M',  24, 'Phaya Thai'),
    (13, 'Eva',    'Jones', 'F',  19, 'Ratchathewi'),
    (14, 'Patty',  'Star',  'F',  27, 'Sathon'),
    (15, 'Lindsy', 'Birds', 'F',  22, 'Khlong Toey'),
    (16, 'David',  'Thomson', 'M', 30, 'Lat Phrao'),
    (17, 'Laura', 'Blackman', 'F', 45, 'Phaya Thai'),
    (18, 'Jonas', 'Good', 'M', 36, 'Sathon'),
    (19, 'Janet', 'Louis', 'F', 29, 'Sathon'),
    (20, 'Abigail', 'McDonald', 'F', 59, 'Ratchathewi');
-----------------------------------------------------------------------------------------
-- Create payment table (Dimension Table 3)
CREATE TABLE payment (
    payment_ID INT NOT NULL PRIMARY KEY,
    payment_method TEXT
);
-- Insert payment table
INSERT INTO payment values
    (1, 'Cash'),
    (2, 'QR Code Transfer'),
    (3, 'Credit Card'),
    (4, 'Debit Card'),
    (5, 'Line Pay'),
    (6, 'True Money Wallet');
-----------------------------------------------------------------------------------------
-- Create branch table (Dimension Table 4)
CREATE TABLE branch (
    branch_ID INT NOT NULL PRIMARY KEY,
    branch_name TEXT
);
-- Insert branch table
INSERT INTO branch values
    (1, 'Siam Centre'),
    (2, 'Emporium'),
    (3, 'Samyarn Mitrtown');
-----------------------------------------------------------------------------------------
-- Create pattern table (Dimension Table 5)
CREATE TABLE pattern (
    pattern_ID INT NOT NULL PRIMARY KEY,
    pattern_of_dining TEXT
);
-- Insert pattern table
INSERT INTO pattern values
    (1, 'Dine-in'),
    (2, 'Take-away'),
    (3, 'Food Delivery');
-----------------------------------------------------------------------------------------
-- Create order table (Fact Table) 
CREATE TABLE orders (
    order_ID INT NOT NULL PRIMARY KEY,
    order_Date TEXT,
    customer_ID INT,
    menu_ID INT,
    payment_ID INT,
    branch_ID INT,
    pattern_ID INT,
    FOREIGN KEY (menu_ID) REFERENCES menu(menu_ID),
    FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID),
    FOREIGN KEY (payment_ID) REFERENCES payment(payment_ID),
    FOREIGN KEY (branch_ID) REFERENCES branch(branch_ID),
    FOREIGN KEY (pattern_ID) REFERENCES pattern(pattern_ID)
);
-- Insert order table
INSERT INTO orders values
    (1, "2022-01-14 00:00:00", 1, 3, 3, 2, 3),
    (2, "2022-01-20 00:00:00", 2, 1, 1, 2, 1),
    (3, "2022-02-11 00:00:00", 3, 2, 5, 1, 2),
    (4, "2022-02-12 00:00:00", 4, 9, 1, 3, 1),
    (5, "2022-02-20 00:00:00", 5, 6, 2, 1, 3),
    (6, "2022-03-19 00:00:00", 6, 4, 5, 3, 3),
    (7, "2022-04-17 00:00:00", 7, 8, 6, 2, 1),
    (8, "2022-04-29 00:00:00", 8, 5, 4, 1, 2),
    (9, "2022-05-08 00:00:00", 9, 7, 2, 2, 3),
    (10, "2022-05-11 00:00:00", 10, 8, 3, 3, 3),
    (11, "2022-05-18 00:00:00", 11, 2, 4, 1, 1),
    (12, "2022-05-25 00:00:00", 12, 8, 6, 1, 2),
    (13, "2022-06-11 00:00:00", 13, 3, 2, 2, 3),
    (14, "2022-06-25 00:00:00", 14, 7, 4, 2, 1),
    (15, "2022-06-26 00:00:00", 15, 4, 5, 3, 3),
    (16, "2022-06-30 00:00:00", 16, 2, 3, 3, 1),
    (17, "2022-07-04 00:00:00", 17, 5, 6, 1, 2),
    (18, "2022-08-10 00:00:00", 18, 9, 4, 2, 2),
    (19, "2022-08-15 00:00:00", 19, 1, 1, 3, 1),
    (20, "2022-08-20 00:00:00", 20, 2, 4, 2, 1);

.mode markdown
.header on 
-----------------------------------------------------------------------------------------
-- Question 1: How much the total income gained by each branch?

SELECT
  b.branch_name,
  sum(m.price) AS total_income
FROM customer AS c
JOIN orders AS o ON c.customer_ID = o.customer_ID
JOIN menu AS m ON m.menu_ID = o.menu_ID
JOIN branch as b on b.branch_ID = o.branch_ID
GROUP BY b.branch_name
ORDER BY total_income DESC

-----------------------------------------------------------------------------------------
-- Question 2: Among Dine-in, Take-Away and Food-delivery, Which pattern of dining gained the lowest income?

SELECT
  p.pattern_of_dining,
  SUM(m.price) AS total_income
FROM menu AS m
INNER JOIN orders AS o ON m.menu_ID = o.menu_ID
INNER JOIN pattern AS p ON p.pattern_ID = o.pattern_ID
GROUP BY p.pattern_of_dining
-- Ans. "Take-away"

-----------------------------------------------------------------------------------------
-- Question 3: What are the menus which "the starting letter J% firstname customer" order?

SELECT
  c.customer_name || ' ' || c.customer_lastname AS Full_name,
  c.gender,
  c.age,
  c.district,
  m.menu_name
FROM customer AS c
JOIN orders AS o ON c.customer_ID = o. customer_ID
JOIN menu AS m ON m.menu_ID = o.menu_ID
WHERE Full_name LIKE "J%"
ORDER BY Full_name

-----------------------------------------------------------------------------------------
-- Question 4: What is the most and the least popular menu in the restaurant?

SELECT
  m.menu_name,
  COUNT(m.menu_name) AS count_menu
FROM menu AS m
JOIN orders AS o ON m.menu_ID = o.menu_ID
GROUP BY m.menu_name
ORDER BY count_menu DESC 
-- Ans. The most and the least popular menu are Beef Wellington and Cesar Salad, respectively.

-----------------------------------------------------------------------------------------
-- Question 5: Which month gains maximum income?

SELECT
  strftime('%m', order_Date) AS month_ID,
  SUM(m.price) AS total_month_income
FROM menu AS m
JOIN orders as o ON m.menu_ID = o.menu_ID
GROUP BY month_ID
ORDER BY total_month_income DESC
-- Ans. June

-----------------------------------------------------------------------------------------
-- Question 6: How much "True Money Wallet" payment method gains?

SELECT
  pay.payment_method AS payment_method,
  SUM(m.price) AS payment_method_income
FROM menu AS m
JOIN orders AS o ON m.menu_ID = o.menu_ID
JOIN payment AS pay ON pay.payment_ID = o.payment_ID
GROUP BY payment_method
ORDER BY payment_method_income DESC  
-- Ans. 1050

-----------------------------------------------------------------------------------------
-- Question 7: Which district gains maximum income? (Sub-Query: With Clause)

WITH SUB AS (
  SELECT *
  FROM menu AS m
  JOIN orders AS o ON m.menu_ID = o.menu_ID
  JOIN customer AS c ON c.customer_ID = o.customer_ID
)
SELECT
  district,
  SUM(price) AS district_income
FROM SUB
GROUP BY district
ORDER BY SUM(price) DESC
-- Ans. Lat Phrao District

-----------------------------------------------------------------------------------------
