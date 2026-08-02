CREATE OR REPLACE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1001, 101, '2026-05-01'),
(1002, 102, '2026-05-02'),
(1003, 103, '2026-05-03'),
(1004, 104, '2026-05-04'),
(1005, 105, '2026-05-05');

SELECT *
FROM orders;

--Q1
--Extracting day name from date
SELECT order_id,customer_id,order_date,DAYNAME(order_date) AS day_name
FROM orders;

CREATE OR REPLACE TABLE customer_signups(
    customer_id INT,
    customer_name STRING,
    signup_date DATE
);

INSERT INTO customer_signups VALUES
('201','John','2026-01-15'),
('202','Mary','2026-02-20'),
('203','Peter','2020-03-05'),
('204','Sarah','2026-04-18'),
('205','Thabo','2026-05-30');

SELECT *
FROM customer_signups;

--Q2
--Extracting the month name
SELECT customer_id,customer_name,signup_date,MONTHNAME(signup_date) AS signup_month_name
FROM customer_signups;

CREATE OR REPLACE TABLE sales (
    sale_id STRING,
    product_name STRING,
    sale_date DATE,
    amount INT
);

INSERT INTO sales VALUES
('S001', 'Laptop', '2026-01-10', 12000),
('S002', 'Mouse', '2026-02-15', 250),
('S003', 'Keyboard', '2026-03-20', 700),
('S004', 'Monitor', '2026-04-25', 3500),
('S005', 'Desk', '2026-05-30', 2000);

SELECT *
FROM sales;

--Q3
--Extracting the month number for sales
SELECT sale_id,product_name,sale_date, MONTH(sale_date) AS sale_month
FROM sales;

CREATE OR REPLACE TABLE transactions (
    transaction_id STRING,
    customer_id INT,
    transaction_date DATE,
    amount INT
);

INSERT INTO transactions VALUES
('T001', 101, '2024-12-15', 500),
('T002', 102, '2025-01-20', 1200),
('T003', 103, '2025-06-10', 800),
('T004', 104, '2026-02-05', 1500),
('T005', 105, '2026-05-25', 2000);

SELECT *
FROM transactions;

--Q4
--Extracting the year from transaction_date column
SELECT transaction_id,customer_id,transaction_date,YEAR(transaction_date) AS transaction_year
FROM transactions;

CREATE OR REPLACE TABLE deliveries (
    delivery_id STRING,
    customer_id INT,
    delivery_date DATE
);

INSERT INTO deliveries VALUES
('D001', 101, '2026-05-01'),
('D002', 102, '2026-05-08'),
('D003', 103, '2026-05-15'),
('D004', 104, '2026-05-22'),
('D005', 105, '2026-05-29');

SELECT *
FROM deliveries;

--Q5
--Extracting the day on delivery_date column
SELECT delivery_id,customer_id,delivery_date,DAY(delivery_date) AS day_of_month
FROM deliveries;

CREATE OR REPLACE TABLE employees (
    employee_id INT,
    employee_name STRING,
    department STRING
);

INSERT INTO employees VALUES
(301, 'Nandi', 'Sales'),
(302, 'Brian', 'IT'),
(303, 'Lerato', 'Finance'),
(304, 'Sipho', 'HR'),
(305, 'Aisha', 'Marketing');

SELECT *
FROM employees;

--Current ate,Convert And Format
--Q6
--Adding a column for todays date
SELECT employee_id,employee_name,department,CURRENT_DATE() AS today_date
FROM employees;

CREATE OR REPLACE TABLE online_orders (
    order_id INT,
    customer_id INT,
    order_date_text STRING
);

INSERT INTO online_orders VALUES
(4001, 101, '2026-01-15'),
(4002, 102, '2026-02-20'),
(4003, 103, '2026-03-25'),
(4004, 104, '2026-04-10'),
(4005, 105, '2026-05-05');

SELECT *
FROM online_orders;

--Q7
--convert the order_date_text to order_date
SELECT order_id,customer_id,order_date_text,TO_DATE(order_date_text) AS order_date
FROM online_orders;

CREATE OR REPLACE TABLE payment_dates (
    payment_id STRING,
    customer_id INT,
    payment_date DATE
);

INSERT INTO payment_dates VALUES
('P001', 101, '2026-01-05'),
('P002', 102, '2026-02-10'),
('P003', 103, '2026-03-15'),
('P004', 104, '2026-04-20'),
('P005', 105, '2026-05-25');

SELECT *
FROM payment_dates;

--Q8
--Format payment_date to string YYYY-MM-DD
SELECT payment_id, customer_id,payment_date,TO_CHAR(payment_date,'yyy-MM-dd') AS formatted_payment_date
FROM payment_dates;

CREATE OR REPLACE TABLE customer_purchases (
    customer_id INT,
    customer_name STRING,
    last_purchase_date DATE
);

INSERT INTO customer_purchases VALUES
(501, 'John', '2026-05-01'),
(502, 'Mary', '2026-05-10'),
(503, 'Peter', '2026-05-15'),
(504, 'Sarah', '2026-05-20'),
(505, 'Thabo', '2026-05-25');

SELECT *
FROM customer_purchases;

--Q9
--Calculating how many days have passed since each customers last purchase
SELECT customer_id,customer_name,last_purchase_date, DATEDIFF(CURRENT_DATE(),last_purchase_date) AS days_since_last_purchase
FROM customer_purchases;

CREATE OR REPLACE TABLE shipping_orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO shipping_orders VALUES
(6001, 101, '2026-05-01'),
(6002, 102, '2026-05-03'),
(6003, 103, '2026-05-05'),
(6004, 104, '2026-05-07'),
(6005, 105, '2026-05-09');

SELECT *
FROM shipping_orders;

--10
--Calculating expected delivery date by adding 7 days to the order_date
SELECT order_id,customer_id,order_date,DATEADD(order_date,7) AS expected_delivery_date
FROM shipping_orders;

CREATE OR REPLACE TABLE bookings (
    booking_id STRING,
    customer_id INT,
    booking_date DATE
);

INSERT INTO bookings VALUES
('B001',101,'2026-01-12'),
('B002',102,'2026-02-18'),
('B003',103,'2026-03-22'),
('B004',104,'2026-04-09'),
('B005',105,'2026-05-27');

SELECT *
FROM bookings;

--Q11
--Extrating year,moth,day from booking_date
SELECT booking_id, 
       customer_id,
       booking_date,
       YEAR(booking_date) AS booking_year,
       MONTH(booking_date) AS booking_month,
       DAY(booking_date) AS booking_day
FROM bookings;

CREATE OR REPLACE TABLE yearly_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO yearly_orders VALUES
(7001, 101, '2024-12-15', 500),
(7002, 102, '2025-01-20', 1200),
(7003, 103, '2025-06-10', 800),
(7004, 104, '2026-02-05', 1500),
(7005, 105, '2026-05-25', 2000);

--Q12
--Return orders made in 2026
SELECT *
FROM yearly_orders;

SELECT order_id, customer_id, order_date,YEAR(order_date) AS order_year, amount
FROM yearly_orders
WHERE YEAR(order_date) = 2026;

CREATE OR REPLACE TABLE monthly_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO monthly_orders VALUES
(8001, 101, '2026-01-15', 500),
(8002, 102, '2026-02-20', 1200),
(8003, 103, '2026-03-10', 800),
(8004, 104, '2026-03-25', 1500),
(8005, 105, '2026-05-30', 2000);

SELECT *
FROM monthly_orders;

--Q13
--Return order place in march(3)
SELECT order_id,customer_id,order_date,MONTH(order_date) AS order_month, amount
FROM monthly_orders
WHERE MONTH(order_date) = 3;

CREATE OR REPLACE TABLE weekday_deliveries (
    delivery_id STRING,
    customer_id INT,
    delivery_date DATE
);

INSERT INTO weekday_deliveries VALUES
('D001', 101, '2026-05-04'),
('D002', 102, '2026-05-05'),
('D003', 103, '2026-05-06'),
('D004', 104, '2026-05-07'),
('D005', 105, '2026-05-08');

SELECT *
FROM weekday_deliveries;

CREATE OR REPLACE TABLE subscriptions (
    subscription_id INT,
    customer_id INT,
    start_date DATE
);

INSERT INTO subscriptions VALUES
(9001, 101, '2026-01-15'),
(9002, 102, '2026-02-20'),
(9003, 103, '2026-03-10'),
(9004, 104, '2026-04-25'),
(9005, 105, '2026-05-05');

SELECT *
FROM subscriptions;
--Q14
--return the last day of each month
SELECT subscription_id, customer_id,start_date, LAST_DAY(start_date) AS month_end_date
FROM subscriptions;

--Q15

CREATE OR REPLACE TABLE campaign_sends(
    send_id STRING,
    customer_id INT,
    send_date DATE
);

INSERT INTO campaign_sends VALUES
('C001',101,'2026-01-12'),
('C002',102,'2026-02-18'),
('C003',103,'2026-03-22'),
('C004',104,'2026-04-09'),
('C005',105,'2026-05-27');

SELECT *
FROM campaign_sends;

--Q15
--Return the first day of the month
SELECT send_id,customer_id,send_date, DATE_TRUNC('month',send_date) AS month_start_date
FROM campaign_sends;

CREATE OR REPLACE TABLE  invoice_dates(
    invoice_id STRING,
    customer_id INT,
    invoice_date DATE
);

INSERT INTO  invoice_dates VALUES
('INV001',101,'2026-01-05'),
('INV002',102,'2026-02-10'),
('INV003',103,'2026-03-15'),
('INV004',104,'2026-01-20'),
('INV005',105,'2026-05-25');

SELECT *
FROM  invoice_dates;

--16
-- Convert date to string
SELECT invoice_id,customer_id,invoice_date,TO_CHAR(invoice_date,'MMMM yyyy') AS invoice_month_year
FROM invoice_dates;

CREATE OR REPLACE TABLE customer_birthdays (
    customer_id INT,
    customer_name STRING,
    date_of_birth DATE
);

INSERT INTO customer_birthdays VALUES
(1201, 'John', '1990-05-15'),
(1202, 'Mary', '1985-08-20'),
(1203, 'Peter', '2000-03-10'),
(1204, 'Sarah', '1995-12-25'),
(1205, 'Thabo', '1988-07-05');

SELECT *
FROM customer_birthdays;

--17
--Calculate customers age years using date of birth and current
SELECT customer_id,customer_name,date_of_birth,DATEDIFF(YEAR,date_of_birth,CURRENT_DATE())AS customer_age
FROM customer_birthdays;

CREATE OR REPLACE TABLE weekend_orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO weekend_orders VALUES
(9001, 101, '2026-05-01'),
(9002, 102, '2026-05-02'),
(9003, 103, '2026-05-03'),
(9004, 104, '2026-05-04'),
(9005, 105, '2026-05-05');

SELECT *
FROM weekend_orders;

--Q18
-- Add day name col and the type of day each day name
SELECT order_id,customer_id,order_date,DAYNAME(order_date) AS day_name,
      CASE
          WHEN DAYNAME(order_date) = 'Sat' OR DAYNAME(order_date) = 'Sun' THEN 'Weekend'
      ELSE 'Weekday'
      END AS day_type
FROM weekend_orders;

CREATE OR REPLACE TABLE quarterly_transactions (
    transaction_id INT,
    customer_id INT,
    transaction_date DATE,
    amount INT
);

INSERT INTO quarterly_transactions VALUES
(9001, 101, '2026-01-15', 500),
(9002, 102, '2026-03-20', 1200),
(9003, 103, '2026-04-10', 800),
(9004, 104, '2026-07-05', 1500),
(9005, 105, '2026-10-25', 2000);

SELECT *
FROM quarterly_transactions;

--Q19
--Extract quarter number from each transaction date
SELECT transaction_id,customer_id, transaction_date,QUARTER(transaction_date) AS transaction_quarter,amount
FROM quarterly_transactions;

CREATE OR REPLACE TABLE recent_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO recent_orders VALUES
(1501, 101, '2026-04-01', 500),
(1502, 102, '2026-04-15', 1200),
(1503, 103, '2026-05-01', 800),
(1504, 104, '2026-05-20', 1500),
(1505, 105, '2026-06-01', 2000);

SELECT *
FROM recent_orders;

--Q20
--Reurns orders that more than 30 days from today
SELECT order_id, customer_id, order_date,DATEDIFF(DAY,order_date,CURRENT_DATE()) AS days_since_order,amount
FROM recent_orders
WHERE DATEDIFF(DAY,order_date,CURRENT_DATE()) > 30;

CREATE OR REPLACE TABLE customer_recency(
    customer_id INT,
    customer_name STRING,
    last_purchase_date DATE,
    total_amount INT
);

INSERT INTO customer_recency VALUES
(1001,'John','2026-05-25',5000),
(1002,'Mary','2026-05-10',2500),
(1003,'Peter','2026-04-01',700),
(1004,'Sarah','2026-02-15',15000),
(1005,'Thabo','2025-12-20',300);

SELECT *
FROM customer_recency;

--Bonus Challenge
--Calculate the days of the last purchase, classify the customer activity
SELECT customer_id,
       customer_name,
       last_purchase_date,
       DATEDIFF(DAY,last_purchase_date,CURRENT_DATE()) AS days_since_last_purchase,
       CASE 
           WHEN DATEDIFF(DAY,last_purchase_date,CURRENT_DATE()) <= 30 THEN 'Active Customer'
           WHEN DATEDIFF(DAY,last_purchase_date,CURRENT_DATE()) BETWEEN 31 AND 90 THEN 'At Risk Customer'
           WHEN DATEDIFF(DAY,last_purchase_date,CURRENT_DATE()) > 90 THEN 'Inactive Customer'
       END AS customer_status
FROM customer_recency;