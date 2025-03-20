SELECT P.product_name, C.category_name
FROM production.products P
INNER JOIN production.categories C ON P.category_id = C.category_id;


SELECT C.first_name + ' ' + C.last_name AS CustomerName, 
       O.order_date, 
       P.product_name, 
       ot.quantity
FROM sales.customers C
INNER JOIN sales.orders O ON O.customer_id = C.customer_id
INNER JOIN sales.Order_items ot ON O.order_id= ot.order_id
INNER JOIN production.products P ON ot.product_id = P.product_id


SELECT P.product_name, S.quantity
FROM production.products P
LEFT JOIN production.stocks S ON P.product_id = S.product_id

SELECT S1.first_name + ' ' + S1.last_name AS StaffName, 
       S2.first_name + ' ' + S2.last_name AS ManagerName
FROM sales.staffs S1
LEFT JOIN sales.staffs S2 ON S1.manager_id = S2.staff_id;


SELECT ST.store_name, 
       S.first_name + ' ' + S.last_name AS StaffMember
FROM sales.stores ST
RIGHT JOIN sales.staffs S ON ST.store_id = S.store_id;

SELECT TOP 3 C.first_name + ' ' + C.last_name AS CustomerName, 
       SUM(OI.quantity * OI.list_price) AS TotalSpent, 
       COUNT(O.order_id) AS NumberOfOrders
FROM sales.customers C
JOIN sales.orders O ON C.customer_id = O.customer_id
JOIN sales.order_items OI ON O.order_id = OI.order_id
JOIN production.products P ON OI.product_id = P.product_id
JOIN production.categories Ct ON P.category_id = Ct.category_id
WHERE Ct.category_name = 'Bikes'
GROUP BY C.first_name, C.last_name
ORDER BY TotalSpent DESC;


SELECT B.brand_name, 
       COUNT(P.product_id) AS NumberOfProducts, 
       AVG(P.list_price) AS AveragePrice,       
       SUM(S.quantity) AS TotalStock
FROM production.brands B
JOIN production.products P ON P.brand_id = B.brand_id
JOIN production.stocks S ON S.product_id = P.product_id
GROUP BY B.brand_name;

SELECT O.order_id, 
       O.order_date, 
       CONCAT(C.first_name, ' ', C.last_name) AS CustomerName, 
       P.product_name
FROM sales.orders O
JOIN sales.order_items OI ON O.order_id = OI.order_id
JOIN production.products P ON OI.product_id = P.product_id
JOIN production.categories CA ON P.category_id = CA.category_id
JOIN sales.customers C ON O.customer_id = C.customer_id
WHERE YEAR(O.order_date) = 2018 
AND CA.category_name = 'Mountain Bikes';

SELECT ST.store_name, 
       C.category_name, 
       SUM(OI.quantity * OI.list_price) AS TotalRevenue
FROM sales.orders O
JOIN sales.order_items OI ON O.order_id = OI.order_id
JOIN production.products P ON OI.product_id = P.product_id
JOIN production.categories C ON P.category_id = C.category_id
JOIN sales.stores ST ON O.store_id=ST.store_id
WHERE YEAR(O.order_date) = 2018
GROUP BY ST.store_name, C.category_name
ORDER BY ST.store_name, TotalRevenue DESC;





