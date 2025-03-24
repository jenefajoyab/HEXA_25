create database CMS

create table users
(
UserID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
Password VARCHAR(255),
ContactNumber VARCHAR(20),
Address TEXT
); 

INSERT INTO users  VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', 'password1', '9876543210', '123, MG Road, Delhi'),
(2, 'Priya Iyer', 'priya.iyer@example.com', 'password2', '9823456789', '456, Jayanagar, Bangalore'),
(3, 'Rajesh Kumar', 'rajesh.kumar@example.com', 'password3', '9812345678', '789, Anna Nagar, Chennai'),
(4, 'Neha Verma', 'neha.verma@example.com', 'password4', '9887654321', '101, Park Street, Kolkata'),
(5, 'Suresh Reddy', 'suresh.reddy@example.com', 'password5', '9865432109', '222, Banjara Hills, Hyderabad'),
(6, 'Anjali Patel', 'anjali.patel@example.com', 'password6', '9856743210', '333, SG Highway, Ahmedabad'),
(7, 'Vikram Singh', 'vikram.singh@example.com', 'password7', '9845678901', '444, Sector 62, Noida'),
(8, 'Sneha Das', 'sneha.das@example.com', 'password8', '9832109876', '555, Salt Lake, Kolkata'),
(9, 'Manoj Nair', 'manoj.nair@example.com', 'password9', '9821098765', '666, Marine Drive, Mumbai'),
(10, 'Ritu Choudhary', 'ritu.choudhary@example.com', 'password10', '9810987654', '777, Civil Lines, Jaipur');

create table Courier
(
CourierID INT PRIMARY KEY,
SenderName VARCHAR(255),
SenderAddress TEXT,
ReceiverName VARCHAR(255),
ReceiverAddress TEXT,
Weight DECIMAL(5, 2),
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE
); 

INSERT INTO Courier VALUES
(1, 'Amit Sharma', '123, MG Road, Delhi', 'Ravi Verma', '456, Andheri West, Mumbai', 2.50, 'In Transit', 'TRK1234567890', '2025-03-25'),
(2, 'Priya Iyer', '78, Jayanagar, Bangalore', 'Neha Gupta', '101, Salt Lake, Kolkata', 1.20, 'Delivered', 'TRK1234567891', '2025-03-20'),
(3, 'Rajesh Kumar', '89, Anna Nagar, Chennai', 'Suresh Reddy', '222, Banjara Hills, Hyderabad', 3.75, 'Out for Delivery', 'TRK1234567892', '2025-03-23'),
(4, 'Neha Verma', '34, Park Street, Kolkata', 'Amit Mishra', '654, Civil Lines, Jaipur', 2.00, 'Pending', 'TRK1234567893', NULL),
(5, 'Suresh Reddy', '222, Banjara Hills, Hyderabad', 'Meera Joshi', '555, MG Road, Pune', 4.60, 'In Transit', 'TRK1234567894', '2025-03-26'),
(6, 'Anjali Patel', '333, SG Highway, Ahmedabad', 'Vikram Singh', '444, Sector 62, Noida', 2.95, 'Delivered', 'TRK1234567895', '2025-03-19'),
(7, 'Vikram Singh', '444, Sector 62, Noida', 'Sneha Das', '102, Gariahat, Kolkata', 1.80, 'In Transit', 'TRK1234567896', '2025-03-24'),
(8, 'Sneha Das', '555, Salt Lake, Kolkata', 'Manoj Nair', '666, Marine Drive, Mumbai', 3.20, 'Out for Delivery', 'TRK1234567897', '2025-03-22'),
(9, 'Manoj Nair', '666, Marine Drive, Mumbai', 'Ritu Choudhary', '777, Civil Lines, Jaipur', 2.10, 'Delivered', 'TRK1234567898', '2025-03-18'),
(10, 'Ritu Choudhary', '777, Civil Lines, Jaipur', 'Amit Sharma', '123, MG Road, Delhi', 4.00, 'Pending', 'TRK1234567899', NULL);

create table CourierServices
(
ServiceID INT PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2)
);

INSERT INTO CourierServices  VALUES
(1, 'Standard Delivery', 150.00),
(2, 'Express Delivery', 300.00),
(3, 'Same Day Delivery', 500.00),
(4, 'Overnight Delivery', 400.00),
(5, 'International Shipping', 1200.00),
(6, 'Freight Shipping', 2500.00),
(7, 'Document Courier', 100.00),
(8, 'Parcel Courier', 200.00),
(9, 'Heavy Goods Courier', 1800.00),
(10, 'Drone Delivery', 700.00);

create table Employee
(
EmployeeID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2)
); 

INSERT INTO Employee  VALUES  
(1, 'Arjun Mehta', 'arjun.mehta@company.com', '9876543210', 'Operations Manager', 78000.00),  
(2, 'Kavya Srinivasan', 'kavya.srinivasan@company.com', '9823456789', 'Logistics Coordinator', 62000.00),  
(3, 'Rahul Malhotra', 'rahul.malhotra@company.com', '9812345678', 'HR Executive', 51000.00),  
(4, 'Divya Chauhan', 'divya.chauhan@company.com', '9887654321', 'Finance Officer', 56000.00),  
(5, 'Aditya Deshmukh', 'aditya.deshmukh@company.com', '9865432109', 'Fleet Supervisor', 73000.00),  
(6, 'Pooja Bhardwaj', 'pooja.bhardwaj@company.com', '9856743210', 'Dispatch Manager', 64000.00),  
(7, 'Rohan Tiwari', 'rohan.tiwari@company.com', '9845678901', 'Delivery Associate', 49000.00),  
(8, 'Meenal Joshi', 'meenal.joshi@company.com', '9832109876', 'Customer Service Executive', 41000.00),  
(9, 'Vivek Kapoor', 'vivek.kapoor@company.com', '9821098765', 'Marketing Manager', 74000.00),  
(10, 'Simran Kaur', 'simran.kaur@company.com', '9810987654', 'Warehouse Supervisor', 67000.00);  

create table Location
(
LocationID INT PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT
); 

INSERT INTO Location  VALUES
(1, 'Head Office', '123, Connaught Place, New Delhi'),
(2, 'Warehouse A', '45, Electronic City, Bangalore'),
(3, 'Branch Office Mumbai', '78, Bandra Kurla Complex, Mumbai'),
(4, 'Regional Hub Chennai', '56, T Nagar, Chennai'),
(5, 'Warehouse B', '98, Salt Lake, Kolkata'),
(6, 'Logistics Center', '67, Banjara Hills, Hyderabad'),
(7, 'Customer Support Hub', '34, MG Road, Pune'),
(8, 'Corporate Office', '12, Sector 62, Noida'),
(9, 'Distribution Center', '23, Civil Lines, Jaipur'),
(10, 'Branch Office Ahmedabad', '89, SG Highway, Ahmedabad');

create table Payment
(
PaymentID INT PRIMARY KEY,
CourierID INT,
LocationId INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
constraint fk_cid FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
constraint fk_loc FOREIGN KEY (LocationID) REFERENCES Location(LocationID));

INSERT INTO Payment  VALUES
(1, 1, 1, 500.00, '2025-03-10'),
(2, 2, 3, 750.00, '2025-03-12'),
(3, 3, 5, 1200.00, '2025-03-14'),
(4, 4, 2, 450.00, '2025-03-15'),
(5, 5, 6, 900.00, '2025-03-17'),
(6, 6, 8, 650.00, '2025-03-19'),
(7, 7, 4, 1100.00, '2025-03-20'),
(8, 8, 7, 800.00, '2025-03-21'),
(9, 9, 9, 500.00, '2025-03-22'),
(10, 10, 10, 950.00, '2025-03-23');

---------------------------------------------------------
--TASK 2
--1. List all customers:
SELECT Name from users
select SenderName from Courier

--2. List all orders for a specific customer
SELECT * FROM Courier WHERE SenderName = 'Neha Verma'; 

--3. List all couriers:
SELECT * FROM Courier

--4. List all packages for a specific order:
SELECT * FROM Courier WHERE CourierID = 5; 

--5. List all deliveries for a specific courier:
SELECT * FROM Courier WHERE CourierID = 4; 

--6. List all undelivered packages:
SELECT * FROM Courier WHERE Status <> 'Delivered';

--7. List all packages that are scheduled for delivery today:
SELECT * FROM Courier WHERE DeliveryDate = cast(GETDATE() as date);

--8. List all packages with a specific status:
SELECT * FROM Courier WHERE Status = 'In Transit'; 

--9. Calculate the total number of packages for each courier.
SELECT CourierID, COUNT(*) AS TotalPackages 
FROM Courier 
GROUP BY CourierID;

--10. Find the average delivery time for each courier
ALTER TABLE Courier  
ADD DispatchDate DATE;
UPDATE Courier SET DispatchDate = '2025-03-29' WHERE CourierID = 1;
UPDATE Courier SET DispatchDate = '2025-03-22' WHERE CourierID = 2;
UPDATE Courier SET DispatchDate = '2025-03-25' WHERE CourierID = 3;
UPDATE Courier SET DispatchDate = '2025-03-20' WHERE CourierID = 4;
UPDATE Courier SET DispatchDate = '2025-03-27' WHERE CourierID = 5;
UPDATE Courier SET DispatchDate = '2025-03-31' WHERE CourierID = 6;
UPDATE Courier SET DispatchDate = '2025-03-25' WHERE CourierID = 7;
UPDATE Courier SET DispatchDate = '2025-03-24' WHERE CourierID = 8;
UPDATE Courier SET DispatchDate = '2025-03-20' WHERE CourierID = 9;
UPDATE Courier SET DispatchDate = '2025-03-21' WHERE CourierID = 10;

SELECT CourierID, AVG(DATEDIFF(Day,DeliveryDate, DispatchDate)) AS AvgDeliveryTime 
FROM Courier 
WHERE DeliveryDate IS NOT NULL
GROUP BY CourierID;


--11. List all packages with a specific weight range:
SELECT * FROM Courier WHERE Weight BETWEEN 2.00 AND 3.00; 

--12. Retrieve employees whose names contain 'John'
INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)  
VALUES (11, 'Johnson Kumar', 'johnson.kumar@company.com', '9876541230', 'Route Planner', 62000.00);
SELECT * FROM Employee WHERE Name LIKE '%John%';

--13. Retrieve all courier records with payments greater than $50. 
SELECT * FROM Payment WHERE Amount > 50.00;

-------------------------------------------------------------
--TASK 3
--14. Find the total number of couriers handled by each employee. 
ALTER TABLE Courier  
ADD AssignedEmployeeID INT,  
constraint fk_assign FOREIGN KEY (AssignedEmployeeID) REFERENCES Employee(EmployeeID);

UPDATE Courier SET AssignedEmployeeID = 1 WHERE CourierID IN (1, 4, 7); 
UPDATE Courier SET AssignedEmployeeID = 2 WHERE CourierID IN (2, 5); 
UPDATE Courier SET AssignedEmployeeID = 3 WHERE CourierID IN (3, 6, 8, 9); 
UPDATE Courier SET AssignedEmployeeID = NULL WHERE CourierID = 10;

SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersHandled  
FROM Employee e  
left JOIN Courier c ON e.EmployeeID = c.AssignedEmployeeID  
GROUP BY e.EmployeeID, e.Name  
ORDER BY TotalCouriersHandled DESC;



--15. Calculate the total revenue generated by each location  
SELECT p.LocationID,l.LocationName,SUM(p.Amount) AS TotalRevenue  
FROM Payment p
join Location l on p.LocationID=l.LocationID
GROUP BY p.LocationID,LocationName  
ORDER BY TotalRevenue DESC;


--16. Find the total number of couriers delivered to each location.  
SELECT p.LocationId,LocationName, COUNT(CourierID) AS TotalCouriersDelivered  
FROM Payment p 
join  Location l on l.LocationID=p.LocationId
GROUP BY p.LocationId,LocationName  
ORDER BY TotalCouriersDelivered DESC;


--17. Find the courier with the highest average delivery time:
SELECT top 1 CourierID, AVG(DATEDIFF(day,DeliveryDate, DispatchDate)) AS AvgDeliveryTime  
FROM Courier  
WHERE DeliveryDate IS NOT NULL  
GROUP BY CourierID  
ORDER BY AvgDeliveryTime DESC  


--18. Find Locations with Total Payments Less Than a Certain Amount 
SELECT p.LocationID,LocationName,SUM(Amount) AS TotalPayments  
FROM Payment p
join Location l on l.LocationID=p.LocationId
GROUP BY p.LocationID,LocationName,Amount  
HAVING Amount < 500  
ORDER BY TotalPayments ASC;

--19. Calculate Total Payments per Location  
SELECT p.LocationID,LocationName,SUM(Amount) AS TotalPayments  
FROM Payment p
join Location l on l.LocationID=p.LocationId
GROUP BY p.LocationID,LocationName,Amount  

--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location 
--(LocationID = X):  
SELECT CourierID, SUM(Amount) AS TotalPayments  
FROM Payment p
join Location l on p.LocationID=l.LocationID
WHERE LocationName like 'Hyderabad'
GROUP BY CourierID  
HAVING SUM(Amount) > 1000  
ORDER BY TotalPayments DESC;

SELECT CourierID, SUM(Amount) AS TotalPayments  
FROM Payment  
WHERE LocationID = 5
GROUP BY CourierID  
HAVING  SUM(Amount)> 1000  
ORDER BY TotalPayments DESC;


--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date 
--(PaymentDate > 'YYYY-MM-DD'): 
SELECT CourierID, SUM(Amount) AS TotalPayments  
FROM Payment  
WHERE PaymentDate > '2025-03-07'  
GROUP BY CourierID  
HAVING  SUM(Amount)> 1000  
ORDER BY TotalPayments DESC;


--22. Retrieve locations where the total amount received is more than $5000 before a certain date 
--(PaymentDate > 'YYYY-MM-DD') 

SELECT LocationID, SUM(Amount) AS TotalPayments  
FROM Payment  
WHERE PaymentDate < '2025-03-15'  
GROUP BY LocationID  
HAVING  SUM(Amount)> 5000
ORDER BY TotalPayments DESC;

-----------------------------------------------------
--TASK 3
--23. Retrieve Payments with Courier Information
SELECT p.PaymentID, p.CourierID, c.SenderName,c.ReceiverName,p.LocationId, p.Amount, p.PaymentDate  
FROM Payment p  
JOIN Courier c ON p.CourierID = c.CourierID;

--24. Retrieve Payments with Location Information  
SELECT p.PaymentID, p.CourierID,p.LocationId,l.LocationName, p.Amount, p.PaymentDate
from Payment p
join Location l on l.LocationID=p.LocationId

--25. Retrieve Payments with Courier and Location Information
SELECT p.PaymentID, p.CourierID,c.SenderName,c.ReceiverName,p.LocationId,l.LocationName, p.Amount, p.PaymentDate
from Payment p
join Location l on l.LocationID=p.LocationId
JOIN Courier c ON p.CourierID = c.CourierID;

--26. List all payments with courier details  
SELECT p.PaymentID, p.CourierID, c.SenderName,c.ReceiverName,p.LocationId, p.Amount, p.PaymentDate  
FROM Payment p  
left JOIN Courier c ON p.CourierID = c.CourierID;

--27. Total payments received for each courier 
SELECT p.CourierID,c.SenderName, SUM(Amount) AS TotalPayments  
FROM Payment p 
join Courier c on p.CourierID = c.CourierID
GROUP BY p.CourierID ,c.SenderName 
ORDER BY SUM(Amount) DESC;

--28. List payments made on a specific date 
select * from Payment
where PaymentDate= '2025-03-15' 

--29. Get Courier Information for Each Payment 
SELECT p.PaymentID, p.CourierID, c.SenderName,c.ReceiverName,p.LocationId, p.Amount, p.PaymentDate  
FROM Payment p  
JOIN Courier c ON p.CourierID = c.CourierID;

--30. Get Payment Details with Location  
SELECT p.PaymentID, p.CourierID,p.LocationId,l.LocationName, p.Amount, p.PaymentDate
from Payment p
join Location l on l.LocationID=p.LocationId

--31. Calculating Total Payments for Each Courier 
select CourierID,sum(Amount)
from Payment
group by CourierID

--32. List Payments Within a Date Range  
select * from Payment
where PaymentDate between '2025-03-14' and '2025-03-17'

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are 
--no matches on either side 
ALTER TABLE Courier  
ADD UserID INT,
CONSTRAINT FK_Courier_User  FOREIGN KEY (UserID) REFERENCES Users(UserID);

UPDATE Courier SET UserID = 1 WHERE CourierID = 1;
UPDATE Courier SET UserID = 2 WHERE CourierID = 2;
UPDATE Courier SET UserID = 3 WHERE CourierID = 3;
UPDATE Courier SET UserID = 4 WHERE CourierID = 4;
UPDATE Courier SET UserID = 5 WHERE CourierID = 5;
UPDATE Courier SET UserID = 6 WHERE CourierID = 6;
UPDATE Courier SET UserID = 7 WHERE CourierID = 7;
UPDATE Courier SET UserID = 8 WHERE CourierID = 8;
UPDATE Courier SET UserID = 9 WHERE CourierID = 9;
UPDATE Courier SET UserID = 10 WHERE CourierID = 10;

SELECT u.UserID, u.Name AS UserName, c.CourierID, c.TrackingNumber, c.Status  
FROM Users u  
FULL OUTER JOIN Courier c ON u.UserID = c.UserID;


--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no 
--matches on either side  
SELECT c.CourierID, c.TrackingNumber, s.ServiceID, s.ServiceName, s.Cost  
FROM Courier c  
FULL OUTER JOIN CourierServices s ON c.ServiceID = s.ServiceID;

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are 
--no matches on either side  
ALTER TABLE Payment  
ADD EmployeeID INT,
CONSTRAINT FK_Payment_Employee  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

UPDATE Payment  
SET EmployeeID = 1  
WHERE PaymentID IN (1, 2, 3);  

UPDATE Payment  
SET EmployeeID = 2  
WHERE PaymentID IN (4, 5, 6);  

SELECT e.EmployeeID, e.Name AS EmployeeName, p.PaymentID, p.Amount, p.PaymentDate  
FROM Employee e  
FULL OUTER JOIN Payment p ON e.EmployeeID = p.EmployeeID;


--36. List all users and all courier services, showing all possible combinations.  
SELECT u.*, s.*  
FROM Users u  
CROSS JOIN CourierServices s;


--37. List all employees and all locations, showing all possible combinations:
SELECT e.*, l.*  
FROM Employee e  
CROSS JOIN Location l;


--38. Retrieve a list of couriers and their corresponding sender information (if available)  
select CourierID,SenderName,SenderAddress
from Courier

--39. Retrieve a list of couriers and their corresponding receiver information (if available):  
select CourierID,ReceiverName,ReceiverAddress
from Courier

--40. Retrieve a list of couriers along with the courier service details (if available):
ALTER TABLE Courier  
ADD ServiceID INT,  
constraint fk_serv FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID);

UPDATE Courier SET ServiceID = 1 WHERE CourierID IN (1, 4, 7);  
UPDATE Courier SET ServiceID = 2 WHERE CourierID IN (2, 5, 8);  
UPDATE Courier SET ServiceID = 3 WHERE CourierID IN (3, 6, 9); 
UPDATE Courier SET ServiceID = NULL WHERE CourierID = 10; 
SELECT c.*, s.ServiceName, s.Cost  
FROM Courier c  
LEFT JOIN CourierServices s ON c.ServiceID = s.ServiceID;


--41. Retrieve a list of employees and the number of couriers assigned to each employee:
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersAssigned  
FROM Employee e  
LEFT JOIN Courier c ON e.EmployeeID = c.AssignedEmployeeID  
GROUP BY e.EmployeeID, e.Name  
ORDER BY TotalCouriersAssigned DESC;


--42. Retrieve a list of locations and the total payment amount received at each location: 
select l.LocationID,l.LocationName,sum(Amount)
from Location l
join Payment p
on l.LocationID=p.LocationId
group by l.LocationID,l.LocationName

--43. Retrieve all couriers sent by the same sender (based on SenderName).
select * FROM Courier
where SenderName='Suresh Reddy'

--44. List all employees who share the same role. 
SELECT Role, name   
FROM Employee 
where Role='HR Executive'
GROUP BY Role,name;


--45. Retrieve all payments made for couriers sent from the same location.
SELECT p.*, c.SenderAddress  
FROM Payment p  
JOIN Courier c ON p.CourierID = c.CourierID  
WHERE c.SenderAddress like '%Mumbai';


--46. Retrieve all couriers sent from the same location (based on SenderAddress).
SELECT *
FROM Courier   
WHERE SenderAddress like '%Hyderabad'


--47. List employees and the number of couriers they have delivered:  
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalDelivered  
FROM Employee e  
JOIN Courier c ON e.EmployeeID = c.AssignedEmployeeID  
WHERE c.Status = 'Delivered'  
GROUP BY e.EmployeeID, e.Name  
ORDER BY TotalDelivered DESC;


--48. Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT p.CourierID, SUM(p.Amount) AS TotalPaid, s.Cost  
FROM Payment p  
JOIN Courier c ON p.CourierID = c.CourierID  
JOIN CourierServices s ON c.ServiceID = s.ServiceID  
GROUP BY p.CourierID, s.Cost  
HAVING SUM(p.Amount) > s.Cost  
ORDER BY TotalPaid DESC;

---------------------------------
--TASK 4
--49. Find couriers that have a weight greater than the average weight of all couriers 
SELECT *  FROM Courier  
WHERE Weight > (SELECT AVG(Weight) FROM Courier);


--50. Find the names of all employees who have a salary greater than the average salary:  
SELECT *  FROM Courier  
WHERE Weight > (SELECT AVG(Weight) FROM Courier);


--51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT ServiceName,SUM(Cost) AS TotalCost  FROM CourierServices  
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)
group by ServiceName

--52. Find all couriers that have been paid for  
SELECT  c.*  
FROM Courier c  
JOIN Payment p ON c.CourierID = p.CourierID;

--53. Find the locations where the maximum payment amount was made
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalAmount  
FROM Location l  
JOIN Payment p ON l.LocationID = p.LocationId  
GROUP BY l.LocationID, l.LocationName  
HAVING SUM(p.Amount) = (  
    SELECT MAX(Amount) FROM Payment  
    ) ;

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender 
--(e.g., 'SenderName'): 
SELECT *  FROM Courier  
WHERE Weight > (SELECT MAX(Weight) FROM Courier WHERE SenderName = 'Sneha Das');
