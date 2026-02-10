create database banking_finance;	
use banking_finance;
create table customer
(customer_id int auto_increment primary key,
customer_name varchar(20), 
gender enum('M','F','O'),
city varchar(20), 
date_of_birth date,
join_date date);

INSERT INTO customer (customer_name, gender, city, date_of_birth, join_date) VALUES
('Amit Sharma','M','Mumbai','1992-05-14','2022-01-10'),
('Priya Patil','F','Pune','1995-08-21','2023-03-15'),
('Rahul Desai','M','Kolhapur','1990-11-05','2021-07-20'),
('Sneha Kulkarni','F','Nagpur','1998-01-30','2023-06-11'),
('Vikas More','M','Mumbai','1989-09-12','2020-10-01'),
('Anjali Joshi','F','Pune','1996-04-18','2022-12-05'),
('Suresh Pawar','M','Kolhapur','1991-06-22','2021-04-09'),
('Kavita Shinde','F','Nagpur','1993-02-10','2022-08-19'),
('Rohit Patil','M','Mumbai','1997-07-17','2023-01-01'),
('Neha Jadhav','F','Pune','1994-12-25','2021-11-30'),
('Ajay Kumar','M','Delhi','1988-03-09','2019-06-14'),
('Pooja Singh','F','Delhi','1999-10-20','2024-02-02'),
('Manoj Verma','M','Delhi','1991-01-15','2022-09-09'),
('Rina Gupta','F','Delhi','1995-05-06','2023-04-04'),
('Sunil Yadav','M','Nagpur','1987-08-13','2020-05-05'),
('Komal Patil','F','Pune','1996-09-01','2022-02-02'),
('Nitin Bhosale','M','Kolhapur','1992-04-14','2021-12-12'),
('Payal More','F','Mumbai','1998-06-19','2023-07-07'),
('Akash Jain','M','Bengaluru','1990-11-11','2020-01-01'),
('Divya Rao','F','Bengaluru','1997-02-02','2022-10-10'),
('Prakash Shetty','M','Bengaluru','1989-03-03','2021-03-03'),
('Meena Iyer','F','Bengaluru','1994-12-12','2023-05-05'),
('Sanjay Mishra','M','Mumbai','1986-07-07','2019-09-09'),
('Shruti Kale','F','Pune','1999-01-01','2024-01-01'),
('Harsh Agarwal','M','Delhi','1993-08-08','2022-06-06');
select *from customer;

create table branches
(branch_id int auto_increment primary key,
branch_name varchar(20),
city varchar(20));

INSERT INTO branches (branch_name, city) VALUES
('Main Branch', 'Mumbai'),
('City Center', 'Pune'),
('Market Yard', 'Kolhapur'),
('MG Road', 'Bengaluru'),
('Civil Lines', 'Delhi'),
('Railway Road', 'Nagpur');
select *from branches;

create table Accounts
(account_id int auto_increment primary key,
customer_id int,
branch_id int,
account_type enum("saving","current","fixed"),
balance decimal(12,2),
open_date date,
foreign key (customer_id) references customer(customer_id),
foreign key (branch_id) references branches(branch_id));

INSERT INTO Accounts (customer_id, branch_id, account_type, balance, open_date) VALUES
(1,1,'saving',50000,'2022-01-10'),
(2,2,'saving',35000,'2023-03-15'),
(3,3,'current',120000,'2021-07-20'),
(4,4,'saving',45000,'2023-06-11'),
(5,1,'fixed',200000,'2020-10-01'),
(6,2,'saving',60000,'2022-12-05'),
(7,3,'current',90000,'2021-04-09'),
(8,6,'saving',30000,'2022-08-19'),
(9,1,'saving',70000,'2023-01-01'),
(10,2,'current',110000,'2021-11-30'),
(11,5,'saving',40000,'2019-06-14'),
(12,5,'saving',25000,'2024-02-02'),
(13,5,'fixed',180000,'2022-09-09'),
(14,5,'saving',52000,'2023-04-04'),
(15,6,'current',98000,'2020-05-05'),
(16,2,'saving',61000,'2022-02-02'),
(17,3,'fixed',150000,'2021-12-12'),
(18,1,'saving',48000,'2023-07-07'),
(19,4,'current',130000,'2020-01-01'),
(20,4,'saving',42000,'2022-10-10'),
(21,4,'fixed',210000,'2021-03-03'),
(22,4,'saving',37000,'2023-05-05'),
(23,1,'current',160000,'2019-09-09'),
(24,2,'saving',28000,'2024-01-01'),
(25,5,'saving',55000,'2022-06-06');
select *from Accounts;

create table transactions
(transaction_id int auto_increment primary key,
account_id int ,
transaction_date date,
transaction_type enum('deposit','withdrawal','transfer'),
amount decimal(12,2), 
foreign key (account_id) references Accounts(account_id));

INSERT INTO transactions (account_id, transaction_date, transaction_type, amount) VALUES
(1,'2024-01-05','deposit',10000),
(2,'2024-01-06','withdrawal',5000),
(3,'2024-01-07','deposit',20000),
(4,'2024-01-08','withdrawal',3000),
(5,'2024-01-09','deposit',25000),
(6,'2024-01-10','deposit',8000),
(7,'2024-01-11','withdrawal',6000),
(8,'2024-01-12','deposit',4000),
(9,'2024-01-13','withdrawal',2000),
(10,'2024-01-14','deposit',15000),
(11,'2024-01-15','deposit',7000),
(12,'2024-01-16','withdrawal',1000),
(13,'2024-01-17','deposit',30000),
(14,'2024-01-18','withdrawal',5000),
(15,'2024-01-19','deposit',22000),
(16,'2024-01-20','withdrawal',4000),
(17,'2024-01-21','deposit',18000),
(18,'2024-01-22','deposit',9000),
(19,'2024-01-23','withdrawal',7000),
(20,'2024-01-24','deposit',12000),
(21,'2024-01-25','deposit',35000),
(22,'2024-01-26','withdrawal',2000),
(23,'2024-01-27','deposit',27000),
(24,'2024-01-28','deposit',6000),
(25,'2024-01-29','withdrawal',3000);
select *from transactions;

create table loans
(loan_id int auto_increment primary key,
customer_id int,
loan_type enum('house','personal','education','vehical'),
loan_amount decimal(12,2),
interest_rate decimal(5,2),
loan_status enum('active','closed','default'),
start_date date,
foreign key (customer_id) references customer(customer_id));

INSERT INTO loans (customer_id, loan_type, loan_amount, interest_rate, loan_status, start_date) VALUES
(1,'house',2500000,8.5,'active','2021-01-01'),
(2,'personal',300000,12.5,'closed','2022-03-03'),
(3,'education',500000,7.2,'active','2020-06-01'),
(4,'vehical',600000,9.0,'active','2023-01-01'),
(5,'house',3500000,8.1,'active','2019-09-09'),
(6,'personal',200000,13.0,'closed','2021-12-12'),
(7,'education',450000,7.5,'active','2022-07-07'),
(8,'vehical',550000,9.2,'default','2021-05-05'),
(9,'personal',180000,12.0,'active','2023-02-02'),
(10,'house',2200000,8.3,'active','2020-10-10'),
(11,'education',400000,7.0,'closed','2019-06-06'),
(12,'personal',150000,13.5,'active','2024-02-02'),
(13,'house',3000000,8.0,'active','2022-08-08'),
(14,'vehical',500000,9.1,'closed','2021-04-04'),
(15,'personal',250000,12.8,'active','2020-05-05'),
(16,'education',350000,7.4,'active','2022-02-02'),
(17,'house',2800000,8.2,'active','2021-12-12'),
(18,'vehical',620000,9.3,'active','2023-07-07'),
(19,'personal',400000,12.6,'default','2020-01-01'),
(20,'education',480000,7.1,'active','2022-10-10'),
(21,'house',3200000,8.4,'active','2021-03-03'),
(22,'personal',220000,13.2,'closed','2023-05-05'),
(23,'vehical',700000,9.5,'active','2019-09-09'),
(24,'education',360000,7.6,'active','2024-01-01'),
(25,'personal',260000,12.9,'active','2022-06-06');
select *from loans;

-- 1.Display all records from the customer table.
select *from customer;
-- 2.Show customer names and cities only.
select customer_name,city from customer;
-- 3.Find all customers who live in Mumbai.
select *from customer where city="Mumbai";
-- 4.List all female customers.
select *from customer where gender="f";
-- 5.Display all branches with their cities.
select *from branches;
-- 6.Show all accounts with balance greater than ₹50,000.
select *from accounts where balance>50000;
-- 7.Find all saving accounts.
select *from accounts where account_type="saving";
-- 8.Display customers who joined after 2022-01-01.
select *from customer where join_date>'2022-01-01';
-- 9.Show all transactions of type deposit.
select *from transactions where transaction_type="deposit";
-- 10.List all loans that are currently active.
select *from loans where loan_status="active";
-- 11.Display customer names in ascending order.
select *from customer order by customer_name asc;
-- 12.Find customers whose name starts with ‘A’.
select *from customer where customer_name like 'A%';
-- 13.Count total number of customers.
select count(*) as total_customer from customer;
-- 14.Find the average account balance.
select avg(balance) as avg_balance from accounts;
-- 15.Display number of accounts for each account type.
SELECT account_type, COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;


-- from insights -
--  Mumbai branch has highest deposits
SELECT b.branch_name, b.city, SUM(a.balance) AS total_deposits
FROM Accounts a
JOIN branches b ON a.branch_id = b.branch_id
GROUP BY b.branch_name, b.city
ORDER BY total_deposits DESC limit 1;

--  Savings accounts dominate customer base
SELECT account_type, COUNT(*) AS total_accounts
FROM Accounts
GROUP BY account_type;

--  Few customers hold majority of bank balance
SELECT c.customer_name, a.balance
FROM customer c
JOIN Accounts a ON c.customer_id = a.customer_id
ORDER BY a.balance DESC
LIMIT 5;

--  Loan penetration is low → cross-sell opportunity
SELECT COUNT(*) AS total_customers FROM customer;

--  Transaction activity peaks early in year
SELECT COUNT(DISTINCT customer_id) AS loan_customers
FROM loans;

