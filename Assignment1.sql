
--Create the database named "TechShop" 
CREATE DATABASE TechShop
USE TechShop

CREATE TABLE Customers
(
CustomerID int IDENTITY(1,1) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(max),
Phone bigint,
Address varchar(max)
)
GO

INSERT INTO Customers
VALUES
('Jenefa', 'Joy', 'jenefa.joy@example.com', 9876543210, 'Chennai'),
('Kavya', 'Reddy', 'kavya.reddy@example.com', 8765432109, 'Mumbai'),
('Janis', 'Doe', 'janis.doe@example.com', 7654321098, 'Madurai'),
('Kelci', 'Brown', 'kelci.brown@example.com', 6543210987, 'Trichy'),
('Logeshwari', 'Kumar', 'logeshwari.kumar@example.com', 5432109876, 'Delhi'),
('Hari', 'Sharma', 'hari.sharma@example.com', 4321098765, 'Chennai'),
('Satindra', 'Patel', 'satindra.patel@example.com', 3210987654, 'Mumbai'),
('Aman', 'Verma', 'aman.verma@example.com', 2109876543, 'Madurai'),
('Sahil', 'Gupta', 'sahil.gupta@example.com', 1098765432, 'Trichy'),
('Nikhisha', 'Singh', 'nikhisha.singh@example.com', 9876543201, 'Delhi');

SELECT * FROM Customers

CREATE TABLE Products
(
ProductID int IDENTITY(1,1) PRIMARY KEY ,
ProductName varchar(30) NOT NULL,
Description varchar(max),
Price decimal(10,2)
)

INSERT INTO Products
VALUES
('Laptop', 'High-performance laptop with 16GB RAM and 512GB SSD', 79999.99),
('Smartphone', 'Latest 5G smartphone with 128GB storage and AMOLED display', 49999.50),
('Headphones', 'Wireless noise-canceling over-ear headphones', 9999.99),
('Smartwatch', 'Water-resistant smartwatch with health tracking features', 15999.75),
('Tablet', '10-inch tablet with stylus support and 256GB storage', 34999.25),
('Camera', 'Mirrorless digital camera with 24MP sensor and 4K recording', 64999.00),
('Gaming Console', 'Next-gen gaming console with 1TB storage', 49999.99),
('Bluetooth Speaker', 'Portable Bluetooth speaker with deep bass and 10-hour battery life', 4999.50),
('Monitor', '27-inch 4K UHD monitor with HDR support', 28999.99),
('Keyboard', 'Mechanical RGB gaming keyboard with customizable keys', 7999.99);

SELECT * FROM Products

CREATE TABLE Orders
(
OrderID int IDENTITY(1,1) PRIMARY KEY ,
CustomerID INT,
OrderDate date,
TotalAmount decimal(10,2),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
)
--DROP TABLE Orders
 INSERT INTO Orders
 VALUES
 (1, '2024-03-10', 79999.99),  
(2, '2024-03-11', 49999.50),  
(3, '2024-03-12', 9999.99),   
(4, '2024-03-13', 15999.75),  
(5, '2024-03-14', 34999.25),  
(6, '2024-03-15', 64999.00),  
(7, '2024-03-16', 49999.99),  
(8, '2024-03-17', 4999.50),   
(9, '2024-03-18', 28999.99),  
(10, '2024-03-19', 7999.99)

SELECT * FROM Orders

CREATE TABLE OrderDetails
(
OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
OrderID INT,
ProductID int,
Quantity int,
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
)
--DROP TABLE OrderDetails
INSERT INTO OrderDetails 
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2)

SELECT * FROM OrderDetails

CREATE TABLE Inventory
(
InventoryID INT IDENTITY(1,1) PRIMARY KEY,
ProductID int,
QuantityInStock int,
LastStockUpdate int,
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
)
--DROP TABLE Inventory
INSERT INTO Inventory 
VALUES
(1, 50, 20240310),
(2, 100, 20240311),
(3, 200, 20240312),
(4, 80, 20240313),
(5, 60, 20240314),
(6, 40, 20240315),
(7, 30, 20240316),
(8, 150, 20240317),
(9, 70, 20240318),
(10, 90, 20240319)

SELECT * FROM Inventory
--Write an SQL query to retrieve the names and emails of all customers.
SELECT FirstName, LastName, Email FROM Customers

--Write an SQL query to list all orders with their order dates and corresponding customer 
--names. 
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders, Customers 
WHERE Orders.CustomerID = Customers.CustomerID

--Write an SQL query to insert a new customer record into the "Customers" table. Include 
customer information such as name, email, and address. 
INSERT INTO Customers
VALUES
('Sam', 'Smith', 'sam.smith@example.com', 9876543210, 'Chennai')

--Write an SQL query to update the prices of all electronic gadgets in the "Products" table by 
--increasing them by 10%. 
UPDATE Products SET Price+=Price*0.1

--Write an SQL query to delete a specific order and its associated order details from the 
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DELETE Orders WHERE OrderID=10

--Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
--order date, and any other necessary information. 
INSERT INTO Orders 
VALUES (10, '2024-03-20', 29999.99)

--Write an SQL query to update the contact information (e.g., email and address) of a specific 
--customer in the "Customers" table. Allow users to input the customer ID and new contact 
--information. 
UPDATE Customers
SET Email = 'new.email@example.com', Address = 'New Address'
WHERE CustomerID = 10

--Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
--table based on the prices and quantities in the "OrderDetails" table. 
UPDATE Orders 
SET TotalAmount = (SELECT SUM(OrderDetails.Quantity * Products.Price) 
                   FROM OrderDetails , Products  
                   WHERE OrderDetails.ProductID = Products.ProductID 
                   AND OrderDetails.OrderID = Orders.OrderID)

--9.Write an SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
--as a parameter
DELETE FROM Orders WHERE OrderID=1 AND CustomerID=1

--Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details. 
INSERT INTO Products  
VALUES ('Smartphone', 'Latest model with high-end features', 45000.00)

ALTER TABLE Orders
ADD OrderStatus varchar(20)

--Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status. 
UPDATE Orders 
SET OrderStatus ='Shipped'
WHERE OrderID = 1

SELECT * FROM Orders

ALTER TABLE Customers 
ADD TotalOrders INT DEFAULT 0
-- Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table. 
UPDATE Customers 
SET TotalOrders = (SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID)

SELECT * FROM Customers
--------------------------------------------------------
ALTER TABLE Products 
ADD Category VARCHAR(50) 

SELECT * FROM Products;
SELECT * FROM OrderDetails
UPDATE Products SET Category = 'Electronic Gadget' WHERE ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Smartwatch');
UPDATE Products SET Category = 'Audio Gadget' WHERE ProductName IN ('Headphones', 'Bluetooth Speaker');
UPDATE Products SET Category = 'Gaming Gadget' WHERE ProductName = 'Gaming Console';
UPDATE Products SET Category = 'Photography Gadget' WHERE ProductName = 'Camera';
UPDATE Products SET Category = 'Computer Peripheral' WHERE ProductName IN ('Monitor', 'Keyboard');

--Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
--customer name) for each order. 
SELECT OrderID, Orders.CustomerID,OrderDate, TotalAmount,FirstName,LastName,Email,Phone,
Address FROM Customers,Orders WHERE Orders.CustomerID=Customers.CustomerID
  

--Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue.  
SELECT OrderDetails.ProductID,ProductName, Quantity*Price AS Revenue 
FROM Products,OrderDetails WHERE Products.ProductID=OrderDetails.ProductID  

SELECT ProductName,sum(Price*Quantity) as revenue
FROM Products p 
JOIN OrderDetails od ON p.ProductID=od.ProductID
WHERE Category='Electronic Gadget'
GROUP BY  ProductName

-- Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information. 
SELECT * from Customers
where Customers.CustomerID IN (select CustomerID from Orders)

--Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--total quantity ordered. Include the product name and the total quantity ordered.
SELECT TOP 1 ProductName,max(Quantity) as maxqty
from Products p 
inner join OrderDetails o ON p.ProductID= o.ProductID 
GROUP BY(ProductName) 
ORDER BY maxqty DESC

--Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
--categories.
SELECT ProductName,Category
FROM Products WHERE Category='Electronic Gadget'

--Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value. 
SELECT FirstName,LastName,o.CustomerID,avg(TotalAmount)
from Customers c
join orders o on c.CustomerID=o.CustomerID
group by FirstName,LastName,o.CustomerID

--Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue. 
SELECT top 1 FirstName,LastName,o.OrderID,TotalAmount
from Customers c
join orders o on c.CustomerID=o.CustomerID
group by FirstName,LastName,o.OrderID,TotalAmount
order by TotalAmount desc

--Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered. 
SELECT ProductName,sum(Quantity)
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID=od.ProductID
WHERE Category='Electronic Gadget'
GROUP BY ProductName

--Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter. 
SELECT FirstName,LastName,Category FROM Customers c
join Orders o on c.CustomerID=o.CustomerID
join OrderDetails od on o.OrderID=od.OrderID
JOIN Products p on od.ProductID=p.ProductID
where Category='Electronic Gadget' and ProductName='Smartphone'

-- Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters. 
SELECT SUM(O.TotalAmount) AS TotalRevenue
FROM Orders O
WHERE O.OrderDate BETWEEN '2024-03-10' AND '2024-03-18' ;



SELECT CustomerID, 
       (SELECT FirstName + ' ' + LastName FROM Customers WHERE Customers.CustomerID = Orders.CustomerID) AS CustomerName,
       AVG(TotalAmount) AS AvgOrderValue
FROM Orders
GROUP BY CustomerID;
 
SELECT (FirstName+' '+ LastName) as Name,avg(Price*Quantity) as average
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID=o.CustomerID
LEFT JOIN OrderDetails od ON od.OrderID=o.OrderID
LEFT JOIN Products p ON p.ProductID=od.ProductID
GROUP BY FirstName,LastName

SELECT TOP 1 (FirstName+' '+ LastName) as Name,o.OrderID,max(Price*Quantity) as maxamt
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID=o.CustomerID
LEFT JOIN OrderDetails od ON od.OrderID=o.OrderID
LEFT JOIN Products p ON p.ProductID=od.ProductID
GROUP BY FirstName,LastName,o.OrderID
ORDER BY maxamt DESC

--------------------------------------------------------------
-- TASK 4

--Write an SQL query to find out which customers have not placed any orders. 
SELECT FirstName+' '+LastName AS Name from Customers
where CustomerId NOT IN (select CustomerId from Orders)

--Write an SQL query to find the total number of products available for sale
SELECT ProductName,SUM(QuantityInStock) as qty from
Products,Inventory
WHERE Products.ProductID IN (select ProductID from Inventory)
GROUP BY ProductName

--Write an SQL query to calculate the total revenue generated by TechShop.
SELECT SUM(TotalAmount) AS TotalRevenue 
FROM Orders 

--Write an SQL query to calculate the average quantity ordered for products in a specific category. 
--Allow users to input the category name as a parameter. 
SELECT ProductName,(select avg(Quantity) from OrderDetails od where od.ProductID=p.ProductID )
from Products p where Category='Electronic Gadget'
GROUP BY p.ProductName, p.ProductID

--Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
--to input the customer ID as a parameter
select FirstName+' '+ LastName as Name,(select sum(TotalAmount) from Orders o where c.CustomerID=O.CustomerID)
from Customers c where CustomerID=2

--Write an SQL query to find the most popular product category, which is the one with the highest 
--total quantity ordered across all orders. 
SELECT Category FROM Products 
WHERE ProductID = (
    SELECT TOP 1 ProductID FROM OrderDetails 
    GROUP BY ProductID 
    ORDER BY SUM(Quantity) DESC
);


--Write an SQL query to find the customer who has spent the most money (highest total revenue) 
--on electronic gadgets. List their name and total spending. 
SELECT FirstName + ' ' + LastName AS CustomerName,sum(TotalAmount)
FROM Customers,Orders
WHERE Customers.CustomerID = (
    SELECT TOP 1 O.CustomerID
    FROM Orders O
    JOIN OrderDetails OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    WHERE Category = 'Electronic Gadget'
    GROUP BY O.CustomerID
    ORDER BY SUM(OI.Quantity * P.Price) DESC)
group by FirstName,LastName;

--Write an SQL query to find the customers who have placed the most orders. List their names 
--and the number of orders they've placed.
SELECT FirstName + ' ' + LastName AS CustomerName, 
(SELECT COUNT(*) FROM Orders O WHERE O.CustomerID = C.CustomerID) AS TotalOrders
FROM Customers C
WHERE CustomerID = (
    SELECT TOP 1 O.CustomerID 
    FROM Orders O
    GROUP BY O.CustomerID, O.OrderID
    ORDER BY COUNT(O.OrderID) DESC
);

-- Write an SQL query to find the total number of orders placed by each customer and list their 
--names along with the order count. 
SELECT FirstName + ' ' + LastName AS CustomerName, 
       (SELECT COUNT(*) FROM Orders O WHERE O.CustomerID = C.CustomerID) AS TotalOrders
FROM Customers C;

--Write an SQL query to calculate the average order value (total revenue divided by the number of 
--orders) for all customers
SELECT FirstName + ' ' + LastName AS CustomerName,
(select TotalAmount/(select count(*) from Orders o where c.CustomerID=o.CustomerID )from Orders o where c.CustomerID=o.CustomerID)
from Customers c


