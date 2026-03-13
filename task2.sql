CREATE DATABASE sales_project1;
USE sales_project1;
CREATE TABLE Customers(
CustomerID INT,
CustomerName VARCHAR(50),
Region VARCHAR(50),
City VARCHAR(50)
);
SELECT * FROM Customers;
CREATE TABLE Products(
ProductID VARCHAR(10),
ProductName VARCHAR(50),
Category VARCHAR(50),
Price INT
);
SELECT * FROM products;
CREATE TABLE Orders(
OrderID INT,
CustomerID INT,
ProductID VARCHAR(10),
Quantity INT,
OrderDate DATE
);
ALTER TABLE Orders 
MODIFY ProductID VARCHAR(10);
TRUNCATE TABLE Orders;
SELECT * FROM Orders;
#--Combining All three tables(JOIN)--
SELECT 
Customers.CustomerName,
Products.ProductName,
Products.Category,
Orders.Quantity,
Orders.OrderDate
FROM Orders
JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID
JOIN Products 
ON Orders.ProductID = Products.ProductID;
#--Total Sales ny Product--
SELECT 
Products.ProductName,
SUM(Orders.Quantity) AS Total_Sales
FROM Orders
JOIN Products
ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductName;
#--Sales by Region--
SELECT 
Customers.Region,
SUM(Orders.Quantity) AS Total_Sales
FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Region;
#--Top Customers--#
SELECT 
Customers.CustomerName,
SUM(Orders.Quantity) AS Total_Orders
FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerName
ORDER BY Total_Orders DESC;
#--Monthly Orders--#
SELECT 
MONTH(OrderDate) AS Month,
COUNT(OrderID) AS Total_Orders
FROM Orders
GROUP BY Month;
#--Best selling products--#
SELECT 
Products.ProductName,
SUM(Orders.Quantity) AS Quantity_Sold
FROM Orders
JOIN Products
ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY Quantity_Sold DESC
LIMIT 1;




