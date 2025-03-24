CREATE DATABASE HMBank

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    email VARCHAR(MAX)  NOT NULL,
    phone_number BIGINT NOT NULL,
    address VARCHAR(MAX) NOT NULL
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    account_type VARCHAR(20) CHECK (account_type IN ('savings', 'current', 'zero_balance')),
    balance DECIMAL(18,2) NOT NULL CHECK (balance >= 0),
    CONSTRAINT fk_cust FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY IDENTITY(1,1),
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),
    amount DECIMAL(18,2) NOT NULL,
    transaction_date DATE NOT NULL,
    CONSTRAINT fk_acc FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);



INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) VALUES
('Jenefa', 'Joy', '1995-06-15', 'jenefa.joy@mail.com', '9876543210', '123, Green Street, NY'),
('Aasmi', 'Kothari', '1992-09-21', 'aasmi.kothari@mail.com', '9876543211', '456, Lakeview Road, LA'),
('Mudit', 'Golchha', '1990-11-11', 'mudit.golchha@mail.com', '9876543212', '789, Blue Avenue, TX'),
('Hardik', 'Jain', '1993-02-28', 'hardik.jain@mail.com', '9876543213', '101, Maple Street, CA'),
('Sidhi', 'Jain', '1998-07-07', 'sidhi.jain@mail.com', '9876543214', '202, Palm Lane, FL'),
('Mahesh', 'Chauhan', '1991-05-30', 'mahesh.chauhan@mail.com', '9876543215', '303, Sunset Blvd, IL'),
('Shrey', 'Shah', '1994-08-10', 'shrey.shah@mail.com', '9876543216', '404, River Street, NJ'),
('Manpreeth', 'Singh', '1989-12-25', 'manpreeth.singh@mail.com', '9876543217', '505, Oak Drive, PA'),
('Virat', 'Kohli', '1988-11-05', 'virat.kohli@mail.com', '9876543218', '606, Cricket Lane, MI'),
('Nikitha', 'Sharma', '1997-04-14', 'nikitha.sharma@mail.com', '9876543219', '707, Rosewood Road, WA'),
('Hithen', 'Bhandari', '1996-03-19', 'hithen.bhandari@mail.com', '9876543220', '808, Mountain View, CO');

INSERT INTO Accounts  VALUES
(1, 'savings', 15000.00),
(2, 'current', 25000.00),
(3, 'savings', 18000.00),
(4, 'zero_balance', 0.00),
(5, 'savings', 12000.00),
(6, 'current', 35000.00),
(7, 'savings', 22000.00),
(8, 'savings', 27000.00),
(9, 'current', 50000.00),
(10, 'savings', 20000.00),
(11, 'zero_balance', 0.00);

INSERT INTO Transactions VALUES
(1, 'deposit', 5000.00, '2025-03-01'),
(2, 'withdrawal', 2000.00, '2025-03-02'),
(3, 'transfer', 3000.00, '2025-03-03'),
(4, 'deposit', 7000.00, '2025-03-04'),
(5, 'withdrawal', 1000.00, '2025-03-05'),
(6, 'transfer', 6000.00, '2025-03-06'),
(7, 'deposit', 4000.00, '2025-03-07'),
(8, 'withdrawal', 1500.00, '2025-03-08'),
(9, 'transfer', 8000.00, '2025-03-09'),
(10, 'deposit', 9000.00, '2025-03-10'),
(11, 'withdrawal', 500.00, '2025-03-11');

SELECT * FROM Customers
SELECT * FROM Accounts
SELECT * FROM Transactions
---------------------------------------------------------
--TASK 2
select first_name+' '+last_name as name,email,account_type
from Customers,Accounts
where Customers.customer_id=Accounts.customer_id

SELECT 
    T.transaction_id,
    C.customer_id,
    C.first_name + ' ' + C.last_name AS full_name,
    T.transaction_type,
    T.amount,
    T.transaction_date
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
JOIN Customers C ON A.customer_id = C.customer_id
ORDER BY T.transaction_date DESC;

UPDATE Accounts
SET balance = balance + 10000
WHERE account_id = 1;

select first_name+' '+last_name as full_name from Customers

DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';

UPDATE Accounts
SET account_type='savings' where account_id=11

SELECT * 
FROM Customers
WHERE address LIKE '%NY';

SELECT account_id,balance from Accounts
where account_id=1

SELECT * FROM Accounts
WHERE account_type='current' and balance>1000

SELECT * FROM Transactions
WHERE account_id=2

DECLARE @interest_rate INT
SET @interest_rate=5
SELECT account_id, balance, 
    @interest_rate AS interest_rate, 
    (balance * @interest_rate / 100) AS interest_accrued
FROM Accounts
WHERE account_type = 'savings';

DECLARE @overdraft_limit INT
SET @overdraft_limit=10000
SELECT *
FROM Accounts
WHERE balance < @overdraft_limit;

SELECT * FROM Customers
WHERE address NOT LIKE '%NY';
-------------------------------------

--TASK 3
--Write a SQL query to Find the average account balance for all customers.   
SELECT AVG(balance) AS avg_balance FROM Accounts;

--Write a SQL query to Retrieve the top 10 highest account balances. 
SELECT TOP 10 first_name+' '+last_name as name,account_id,balance
FROM Customers
JOIN Accounts ON Customers.customer_id=Accounts.customer_id
ORDER BY balance DESC;

--Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT SUM(amount)
FROM Transactions
WHERE transaction_type='deposit' AND transaction_date='2025-03-01'

--Write a SQL query to Find the Oldest and Newest Customers. 
SELECT TOP 1 * FROM Customers ORDER BY DOB ASC; 
SELECT TOP 1 * FROM Customers ORDER BY DOB DESC;

--Write a SQL query to Retrieve transaction details along with the account type.
SELECT T.transaction_id, A.account_id, A.account_type, T.transaction_type, T.amount, 
T.transaction_date FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id;

--Write a SQL query to Get a list of customers along with their account details. 
SELECT C.customer_id, C.first_name + ' ' + C.last_name AS full_name, 
A.account_id,  A.account_type,  A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id;

--Write a SQL query to Retrieve transaction details along with customer information for a 
--specific account. 
SELECT T.transaction_id, C.first_name + ' ' + C.last_name AS full_name, 
A.account_id, A.account_type, T.transaction_type, T.amount, T.transaction_date
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
JOIN Customers C ON A.customer_id = C.customer_id
WHERE A.account_id = 5;


INSERT INTO Accounts values(1,'current',10000) 

--Write a SQL query to Identify customers who have more than one account.
SELECT C.customer_id, C.first_name, C.last_name, COUNT(A.account_id) AS account_count
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
HAVING COUNT(A.account_id) > 1;

INSERT INTO Transactions
VALUES (1, 'withdrawal', 500.00, '2025-03-12')

-- Write a SQL query to Calculate the average daily balance for each account over a specified 
--period. 
SELECT account_id, AVG(balance) AS avg_daily_balance
FROM Accounts
WHERE account_id IN (
    SELECT DISTINCT account_id FROM Transactions WHERE transaction_date BETWEEN '2025-03-01' AND '2025-03-07')
GROUP BY account_id;

--Calculate the total balance for each account type.
SELECT account_type,sum(balance)
from Accounts
group by account_type

-- Identify accounts with the highest number of transactions order by descending order. 
select top 1 accounts.account_id,count(transaction_id) as num
from Accounts
left join Transactions on Accounts.account_id=Transactions.account_id
group by accounts.account_id
order by num desc

-- Write a SQL query to Calculate the difference in transaction amounts between deposits and 
--withdrawals.
SELECT account_id,
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS net_difference
FROM Transactions
GROUP BY account_id;


-- List customers with high aggregate account balances, along with their account types. 
SELECT top 1 C.customer_id, C.first_name + ' ' + C.last_name AS full_name, A.account_type, 
SUM(A.balance) AS total_balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY  C.customer_id, C.first_name, C.last_name,A.account_type
ORDER BY total_balance DESC;

--Identify and list duplicate transactions based on transaction amount, date, and account. 
SELECT account_id, amount, transaction_date, COUNT(account_id) AS duplicate_count
FROM Transactions
GROUP BY account_id, amount, transaction_date
HAVING COUNT(*) > 1;

-------------------
--TASK 4

--Retrieve the customer(s) with the highest account balance. 
SELECT TOP 1 C.customer_id,C.first_name + ' ' + C.last_name AS full_name, 
       (SELECT MAX(A.balance) 
        FROM Accounts A 
        WHERE A.customer_id = C.customer_id) AS balance
FROM Customers C
order by balance desc

--Calculate the average account balance for customers who have more than one account. 
SELECT AVG(balance) AS avg_balance
FROM Accounts
WHERE customer_id IN (
    SELECT customer_id
    FROM Accounts
    GROUP BY customer_id
    HAVING COUNT(account_id) > 1
);

--Retrieve accounts with transactions whose amounts exceed the average transaction amount.
SELECT *
FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions);

--Identify customers who have no recorded transactions. 
SELECT * FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Accounts A
    where account_id not in (select account_id from transactions)
);

--Calculate the total balance of accounts with no recorded transactions. 
SELECT account_id,balance from Accounts
where Accounts.account_id not in (select account_id from Transactions)

--Retrieve transactions for accounts with the lowest balance. 
SELECT * FROM Transactions
WHERE account_id IN (
    SELECT account_id 
    FROM Accounts 
    WHERE balance = (SELECT MIN(balance) FROM Accounts)
);

--Identify customers who have accounts of multiple types. 
SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_type) > 1;

--Retrieve all transactions for a customer with a given customer_id. 
SELECT * FROM Transactions
WHERE account_id IN (
    SELECT account_id FROM Accounts 
    WHERE customer_id =1
);

-- Calculate the total balance for each account type, including a subquery within the SELECT 
--clause.
SELECT account_type,sum(balance) as balance
from Accounts
group by account_type

---Calculate the percentage of each account type out of the total number of accounts.
SELECT account_type, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage
FROM Accounts
GROUP BY account_type;

