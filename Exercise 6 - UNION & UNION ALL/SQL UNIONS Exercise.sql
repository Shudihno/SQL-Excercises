-- Create Sandton branch table
CREATE OR REPLACE TABLE branch_sandton_accounts (
  account_id STRING,
  account_holder STRING
);

--Insert values to branch_sandton_accounts table
INSERT INTO branch_sandton_accounts VALUES
('A001', 'Nomvula Dlamini'),
('A002', 'David Mokoena'),
('A003', 'Lerato Sithole'),
('A004', 'Peter Nkosi');

--Verfify rows on branch_sandton_accounts
SELECT *
FROM branch_sandton_accounts;

-- Create Rosebank branch table
CREATE OR REPLACE TABLE branch_rosebank_accounts (
  account_id STRING,
  account_holder STRING
);

INSERT INTO branch_rosebank_accounts VALUES
('A003', 'Lerato Sithole'),
('A004', 'Peter Nkosi'),
('A005', 'Zanele Khumalo'),
('A006', 'Thabo Motha');

--Verify the rows on  branch_rosebank_accounts
SELECT *
FROM  branch_rosebank_accounts;

--Q1
SELECT account_id, account_holder,'Sandton' AS city
FROM branch_sandton_accounts

UNION

SELECT account_id, account_holder,'Rosebank' AS city
FROM branch_rosebank_accounts;

--Create table savings_product
CREATE OR REPLACE TABLE savings_products(
    product_code String,
    product_name String
);

--Inserting values to savings_products
INSERT INTO savings_products VALUES
('SV01','Basic Savings'),
('SV02','Premium Savings'),
('SV03', 'Youth Savings'),
('SV04','Business Savings');

--Verify the savings_products table
SELECT *
FROM savings_products;

--Craeting current_products table
CREATE OR REPLACE TABLE current_products(
    product_code String,
    product_name String
);

--Inserting vlaues into current_products
INSERT INTO current_products VALUES
('CR01','Standard Current'),
('CR02','Gold Current'),
('SV03','Youth Savings'),
('CR03','Business Current');

--Verifying the current_products table
SELECT *
FROM current_products;

--Q2
SELECT product_code, product_name,'Savings Account' AS product_type
FROM savings_products

UNION

SELECT product_code,product_name,'Current Account' AS product_type
FROM current_products;

--Crateing table retail_banking_staff
CREATE OR REPLACE TABLE retail_banking_staff(
    staff_id String,
    staff_name String
);

--Inseting values into retail_banking_staff
INSERT INTO retail_banking_staff VALUES
('S001','Mpho Radebe'),
('S002','Brain Tshabalala'),
('S003', 'Aisha Patel'),
('S004','Kabelo Moabelo');

--Verifying the retail_banking_staff table
SELECT *
FROM retail_banking_staff;

--Creating table corporate_banking_staff
CREATE OR REPLACE TABLE corporate_banking_staff(
    staff_id String,
    staff_name String
);

--Inserting values into corporate_banking_staff
INSERT INTO corporate_banking_staff VALUES
('S003','Aisha Patel'),
('S005','Nandi Dube'),
('S006','Sipho Khumalo'),
('S004','Kabelo Moabelo');

--Verifying the corporate_banking_staff table
SELECT *
FROM corporate_banking_staff;

--Q3
SELECT staff_id,staff_name,'retail@nexbank.co.za' AS email
FROM retail_banking_staff

UNION

SELECT staff_id,staff_name,'corporate@nexbank.co.za' AS email
FROM corporate_banking_staff;

--Creating mobile_branch_cities
CREATE OR REPLACE TABLE mobile_branch_cities(
  city_code String,
  city_name String
);

--Insert into mobile_branch_cities
INSERT INTO mobile_branch_cities VALUES
('C01','Johannesburg'),
('C02','Pretoria'),
('C03','Cape Town'),
('C04','Durban');

--Verify the mobile_branch_cities table
SELECT *
FROM mobile_branch_cities;

--Create the digital_branch_cities
CREATE OR REPLACE TABLE digital_branch_cities(
  city_code String,
  city_name String
);

--Inserting into digital_branch_cities
INSERT INTO digital_branch_cities VALUES
('C03','Cape Town'),
('C05','Polokwane'),
('C06','Port Elizabeth'),
('C01','Johannesburg');

--Verifying the digital_branch_cities table
SELECT *
FROM digital_branch_cities;

--Q4
SELECT city_code,city_name,'Mobile Branch' AS region
FROM mobile_branch_cities

UNION

SELECT city_code,city_name, 'Digital Branch' AS region
FROM digital_branch_cities;

--Create push_notification_targets table
CREATE OR REPLACE TABLE push_notification_targets(
  customer_id String,
  customer_name String
);

--Insert int push_notification_targets table
INSERT INTO push_notification_targets VALUES
('C1003','Nomsa Zwane'),
('C1002','Andile Buthelezi'),
('C1003','Fatima Mohomed'),
('C1004','Ryno Van Zyl');

--Verifying the push_notification_targets table
SELECT *
FROM push_notification_targets;

--Create inapp_banner_targets
CREATE OR REPLACE TABLE inapp_banner_targets(
  customer_id String,
  customer_name String
);

--Insert values into inapp_banner_targets
INSERT INTO inapp_banner_targets VALUES
('C1003','Fatima Mahomed'),
('C1005','Thandeka Cele'),
('C1006','Samuel Nkosi'),
('C1002','Andile buthelezi');

--Verifying inapp_banner_targets table
SELECT *
FROM inapp_banner_targets;

--Q5
SELECT customer_id,customer_name,'Push Notification' AS segment
FROM push_notification_targets

UNION

SELECT customer_id,customer_name,'In-App Banner' AS segment
FROM inapp_banner_targets;

--Create atm01_transactions table
CREATE OR REPLACE TABLE atm01_transactions(
  txn_id String,
  account_id String,
  amount Float
);

--Insert into atm01_transactions table
INSERT INTO atm01_transactions VALUES
('T1001','A001','500.00'),
('T1002','A002','120.00'),
('T1003','A001','300.00'),
('T1004','A003','750.00');

--Verifying the atm01_transactions table
SELECT *
FROM atm01_transactions;

--Creating the atm02_transactions
CREATE OR REPLACE TABLE atm02_transactions(
  txn_id String,
  account_id String,
  amount Float
);

--Inserting int values
INSERT INTO atm02_transactions VALUES
('T1003','A001','300.00'),
('T1005','A004','900.00'),
('T1006','A002','450.00'),
('T1007','A005','150.00');

--Verifying atm02_transactions table
SELECT *
FROM atm02_transactions;

--Q6
SELECT txn_id,account_id,amount,'ATM-01 ' AS transaction_date
FROM atm01_transactions

UNION ALL

SELECT txn_id,account_id,amount,'ATM-02' AS transaction_date
FROM atm02_transactions;

--Create gauteng_loan_applications  table
CREATE OR REPLACE TABLE gauteng_loan_applications (
  app_id STRING,
  customer_id STRING,
  loan_type STRING
);

--Insert into gauteng_loan_applications table
INSERT INTO gauteng_loan_applications VALUES
('LA001','C1001','Home Loan'),
('LA002','C1002','Vehicle Loan'),
('LA003','C1003','Personal'),
('LA004','C1004','Home Loan');

--Verfying the gauteng_loan_applications table
SELECT *
FROM gauteng_loan_applications;

--Create western_cape_loan_applications table
CREATE OR REPLACE TABLE western_cape_loan_applications (
  app_id STRING,
  customer_id STRING,
  loan_type STRING
);

--Insert into western_cape_loan_applications table
INSERT INTO western_cape_loan_applications VALUES
('LA003','C1003','Personal'),
('LA005','C1005','Vehicle Loan'),
('LA006','C1006','Business'),
('LA007','C1007','Home Loan');

--Verfying the western_cape_loan_applications table
SELECT *
FROM western_cape_loan_applications;

--Q7
SELECT app_id,customer_id,loan_type,'Gauteng' AS  amount_requested
FROM gauteng_loan_applications

UNION ALL

SELECT app_id,customer_id,loan_type,'Western Cape' AS  amount_requested
FROM western_cape_loan_applications;

--Create mail_complaints table
CREATE OR REPLACE TABLE email_complaints(
  complaint_id String,
  customer_id String
);

--Inserting into the mail_complaints table
INSERT INTO email_complaints VALUES
('EC001','C2001'),
('EC002','C2002'),
('EC003','C2003'),
('EC004','C2004');

--Verifying the mail_complaints table
SELECT *
FROM email_complaints;

--Create app_complaints table
CREATE OR REPLACE TABLE app_complaints(
  complaint_id String,
  customer_id String
);

--Insert into app_complaints table
INSERT INTO app_complaints VALUES
('AC001','C2005'),
('AC002','C2001'),
('AC003','C2006'),
('AC004','C2007');

--Verfifying the app_complaints table
SELECT *
FROM app_complaints;

--Q8
SELECT complaint_id,customer_id,'Email' AS category,'Email System' AS logged_date
FROM email_complaints

UNION ALL

SELECT complaint_id,customer_id,'Mobile App' AS category,'Mobile App System' AS logged_date
FROM app_complaints;

--Create april_payments table
CREATE OR REPLACE TABLE april_payments (
  payment_id STRING,
  account_id STRING,
  amount DECIMAL(10,2)
);

--Insert values into april_payments
INSERT INTO april_payments VALUES
('PAY001','A001',12500.00),
('PAY002','A002',4800.00),
('PAY003','A003',9200.00),
('PAY004','A004',3300.00);

--Verifying the table
SELECT *
FROM april_payments;

--Create may_payments table
CREATE OR REPLACE TABLE may_payments (
  payment_id STRING,
  account_id STRING,
  amount DECIMAL(10,2)
);

--Inserting into may_payments table
INSERT INTO may_payments VALUES
('PAY005','A001',12500.00),
('PAY006','A005',7600.00),
('PAY007','A002',5100.00),
('PAY008','A006',2800.00);

--Verifying the may_payments table
SELECT *
FROM may_payments;

--Q9
SELECT payment_id,account_id,amount,'April Payment' AS payment_date
FROM april_payments

UNION ALL

SELECT payment_id,account_id,amount,'May Payment' AS payment_date
FROM may_payments;

--create debit_entries table
CREATE OR REPLACE TABLE debit_entries(
   entry_id String,
   account_id String,
   entry_type String
);

--insert into debit_entries table
INSERT INTO debit_entries VALUES
('DR001','A001','Debit'),
('DR002','A002','Debit'),
('DR003','A003','Debit'),
('DR004','A004','Debit');

--Verifying the debit_entries table
SELECT *
FROM debit_entries;

--Create a credit_entries table
CREATE OR REPLACE TABLE credit_entries(
  entry_id String,
  account_id String,
  entry_type String
);

--Insert values into credit_entries table
INSERT INTO credit_entries VALUES
('CR001','A001','Credit'),
('CR002','A005','Credit'),
('CR003','A002','Credit'),
('CR004','A006','Credit');

--Verifying the credit_entries table
SELECT *
FROM credit_entries;

--Q10
SELECT entry_id,account_id,entry_type,'R10000' AS amount,'Debit Entries'
FROM debit_entries

UNION ALL

SELECT entry_id,account_id,entry_type,'R10000' AS amount,'Credit Entries'
FROM credit_entries;

