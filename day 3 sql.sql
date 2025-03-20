select 10+30 as Addition

select 50-30 as  subtraction

select 10* 30 as Multiplcation

select 100/2 as Division

select 17%3 as Modulo


select value,
ABS(value) As Absolute_values
From (VALUES(-15.72),(22.3),(0)) AS TestDate(value)

Select CEILING(15.2) -- Returns 16
Select CEILING(-15.2) -- Returns -15

Select FLOOR(15.2) -- Returns 15
Select FLOOR(-15.2) -- Returns -16

Select POWER(2,3) -- Returns 8

Select RAND(1) 

select Rand()


Declare @Counter INT   --int counter
Set @Counter = 1		-- counter=1
While(@Counter <= 10)
Begin					--{
 Print FLOOR(RAND() * 100) 
 Set @Counter = @Counter + 1
End						--}



Declare @Number int
Set @Number = 65
While(@Number <= 90)
Begin
 Print CHAR(@Number)
 Set @Number = @Number + 1
End
go

Declare @Number int
Set @Number = 65
While(@Number <= 90)
Begin
 Print LOWER(CHAR(@Number))
 Set @Number = @Number + 1
End
go

Select LOWER('CONVERT This String Into Lower Case')
Select UPPER('CONVERT This String Into Lower Case')
Select LEN('CONVERT This String Into Lower Case')
Select LEFT('CONVERT This String Into Lower Case',3)
SELECT LTRIM('    BikeStores') AS trimmed_text
SELECT RTRIM('BikeStores    ') AS trimmed_text
SELECT TRIM('    BikeStores    ') AS trimmed_text
SELECT CHARINDEX('@', 'john.doe@gmail.com') AS AtPosition
SELECT SUBSTRING('john.doe@gmail.com', 10, 10) AS EmailDomain
SELECT PATINDEX('%Street%', '123 Main Street, NY') AS Position
SELECT REPLACE('Tech Solutions Inc.', 'Inc.', 'LLC') AS UpdatedCompany
SELECT STUFF('Jon Doe', 1, 3, 'John')
SELECT REPLICATE('-', 20)
SELECT CONCAT('John', ' ', 'Doe') AS FullName
SELECT CONCAT_WS(', ', '123 Main St', 'New York', 'NY', '10001') AS FullAddress;
SELECT FORMAT(1234567890, '(###) ###-####') AS PhoneNumber;


select * from Production.products

select 
--AVG(list_price) as actual_avg_price,
ABS(list_price) as Price_Deviation
From Production.products 


-- Date  functions


select GETDATE() AS CurrentDateTime


SELECT CURRENT_TIMESTAMP AS CURRENTTIME;

SELECT SYSDATETIME() AS SYSTEMDATETIME

--DATE PART EXTRACTION
SELECT YEAR('2020-3-18') AS YEARVALUE
SELECT MONTH('2020-3-18') AS MONTHVALUE
SELECT DAY('2020-3-18') AS DAYVALUE

SELECT DATEPART(QUARTER,'2020-09-18') AS QUARTERVALUE

SELECT DATENAME(MONTH,'2025-03-18') AS MONTHNAME


SELECT DATEADD(DAY,30,'2025-03-18') AS DATEPLUS30DAYS

SELECT DATEDIFF(DAY,'2025-03-18','2025-09-28') AS DATEDIFFERENCE

SELECT EOMONTH('2025-05-18') AS LASTDAYOFMONTH

SELECT GETDATE()

SELECT CONVERT(VARCHAR,GETDATE()) AS FORMATTEDDATE


SELECT FORMAT(GETDATE(),'yyyy-MM-dd')

select ISDATE('2025-03-45') as IsvalidDate


-- JOINS

-- Creating Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

-- Creating Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

-- Insert Data into Customers Table
INSERT INTO Customers (CustomerID, Name, City) VALUES
(1, 'John Doe', 'New York'),
(2, 'Jane Smith', 'Los Angeles'),
(3, 'Alice Brown', 'Chicago'),
(4, 'Bob Johnson', 'Houston');

-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2024-03-01', 500.00),
(102, 1, '2024-03-05', 250.00),
(103, 3, '2024-03-07', 700.00),
(104, 3, '2024-03-10', 150.00);

--INNER JOIN

SELECT c.CustomerID, Name, City,OrderID, OrderDate, Amount
from Customers c
INNER JOIN
Orders e
ON
c.CustomerID=e.CustomerID

SELECT c.CustomerID, Name, City,OrderID, OrderDate, Amount
from Customers c
LEFT JOIN
Orders e
ON
c.CustomerID=e.CustomerID

SELECT c.CustomerID, Name, City,OrderID, OrderDate, Amount
from Customers c
RIGHT JOIN
Orders e
ON
c.CustomerID=e.CustomerID

SELECT c.CustomerID, Name, City,OrderID, OrderDate, Amount
from Customers c
FULL JOIN
Orders e
ON
c.CustomerID=e.CustomerID

SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.Amount
FROM Customers
CROSS JOIN Orders;

create table Employee1
(
id int primary key,
Name varchar(10),
Managerid int null
)

insert into Employee1 values
(1,'Poornima',null),
(2,'Geethica',1),
(3,'Manju Sri',1),
(4,'Jerome',2),
(5,'Nithyasri',3)

SELECT * FROM Employee1
SELECT E1.ID,E1.Name,e2.Name as ManagerName
from Employee1 e1
left join
Employee1 e2 
ON e1.Managerid=e2.id