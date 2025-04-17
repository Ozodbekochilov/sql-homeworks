CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT
);

-- Insert 40 rows into Products
INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30),
(2, 'Smartphone', 800.00, 'Electronics', 50),
(3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60),
(5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120),
(7, 'Chair', 150.00, 'Furniture', 80),
(8, 'Desk', 200.00, 'Furniture', 75),
(9, 'Pen', 5.00, 'Stationery', 300),
(10, 'Notebook', 10.00, 'Stationery', 500),
(11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200),
(14, 'Shirt', 30.00, 'Clothing', 150),
(15, 'Jeans', 45.00, 'Clothing', 120),
(16, 'Jacket', 80.00, 'Clothing', 70),
(17, 'Shoes', 60.00, 'Clothing', 100),
(18, 'Hat', 20.00, 'Accessories', 50),
(19, 'Socks', 10.00, 'Clothing', 200),
(20, 'T-Shirt', 25.00, 'Clothing', 150),
(21, 'Lamp', 60.00, 'Furniture', 40),
(22, 'Coffee Table', 100.00, 'Furniture', 35),
(23, 'Book', 15.00, 'Stationery', 250),
(24, 'Rug', 90.00, 'Furniture', 60),
(25, 'Cup', 5.00, 'Accessories', 500),
(26, 'Bag', 25.00, 'Accessories', 300),
(27, 'Couch', 450.00, 'Furniture', 15),
(28, 'Fridge', 600.00, 'Electronics', 20),
(29, 'Stove', 500.00, 'Electronics', 15),
(30, 'Microwave', 120.00, 'Electronics', 25),
(31, 'Air Conditioner', 350.00, 'Electronics', 10),
(32, 'Washing Machine', 450.00, 'Electronics', 15),
(33, 'Dryer', 400.00, 'Electronics', 10),
(34, 'Hair Dryer', 30.00, 'Accessories', 100),
(35, 'Iron', 40.00, 'Electronics', 50),
(36, 'Coffee Maker', 50.00, 'Electronics', 60),
(37, 'Blender', 35.00, 'Electronics', 40),
(38, 'Juicer', 55.00, 'Electronics', 30),
(39, 'Toaster', 40.00, 'Electronics', 70),
(40, 'Dishwasher', 500.00, 'Electronics', 20);

SELECT Category, COUNT(*)
FROM Products
GROUP BY Category

SELECT AVG(Price)
FROM Products
WHERE Category = 'Electronics'
---------------------------------------------------------------------------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    LoyaltyStatus VARCHAR(50)
);

-- Insert 40 rows into Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'New York', 'Gold'),
(2, 'Bob', 'California', 'Silver'),
(3, 'Charlie', 'Texas', 'Gold'),
(4, 'David', 'Florida', 'Platinum'),
(5, 'Eve', 'California', 'Gold'),
(6, 'Frank', 'Texas', 'Silver'),
(7, 'Grace', 'New York', 'Platinum'),
(8, 'Helen', 'Florida', 'Gold'),
(9, 'Ivan', 'California', 'Silver'),
(10, 'Jack', 'New York', 'Gold'),
(11, 'Kathy', 'Texas', 'Gold'),
(12, 'Leo', 'California', 'Platinum'),
(13, 'Mona', 'New York', 'Silver'),
(14, 'Nina', 'Florida', 'Gold'),
(15, 'Oscar', 'California', 'Silver'),
(16, 'Paul', 'Texas', 'Gold'),
(17, 'Quincy', 'New York', 'Platinum'),
(18, 'Rachel', 'Florida', 'Silver'),
(19, 'Sam', 'California', 'Gold'),
(20, 'Tom', 'Texas', 'Platinum'),
(21, 'Uma', 'New York', 'Gold'),
(22, 'Vera', 'California', 'Platinum'),
(23, 'Walter', 'Florida', 'Silver'),
(24, 'Xander', 'Texas', 'Gold'),
(25, 'Yara', 'New York', 'Silver'),
(26, 'Zoe', 'California', 'Platinum'),
(27, 'Aaron', 'Texas', 'Gold'),
(28, 'Bella', 'Florida', 'Platinum'),
(29, 'Caleb', 'California', 'Silver'),
(30, 'Diana', 'Texas', 'Gold'),
(31, 'Eva', 'New York', 'Silver'),
(32, 'Finn', 'Florida', 'Gold'),
(33, 'Gina', 'California', 'Platinum'),
(34, 'Hank', 'Texas', 'Silver'),
(35, 'Ivy', 'New York', 'Gold'),
(36, 'Jason', 'California', 'Silver'),
(37, 'Ken', 'Texas', 'Platinum'),
(38, 'Lia', 'Florida', 'Gold'),
(39, 'Mick', 'New York', 'Platinum'),
(40, 'Noah', 'California', 'Gold');

SELECT Location
FROM Customers
WHERE Location LIKE 'L%';

SELECT Name
FROM Products
WHERE Name LIKE '%er';

SELECT Name, Location
FROM Customers
WHERE Location LIKE '%A';

SELECT MAX(Price)
FROM Products

SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products)

SELECT Name, StockQuantity,
       IIF(StockQuantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM Products;

SELECT Location, COUNT(*)
FROM customers
GROUP BY Location

-----------------------------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Insert 40 rows into Orders
INSERT INTO Orders VALUES
(1, 1, 2, '2023-01-01', 1, 800.00),
(2, 2, 3, '2023-01-02', 2, 800.00),
(3, 3, 4, '2023-01-03', 1, 250.00),
(4, 4, 5, '2023-01-04', 3, 150.00),
(5, 5, 6, '2023-01-05', 1, 30.00),
(6, 6, 7, '2023-01-06', 2, 300.00),
(7, 7, 8, '2023-01-07', 1, 200.00),
(8, 8, 9, '2023-01-08', 4, 40.00),
(9, 9, 10, '2023-01-09', 1, 10.00),
(10, 10, 11, '2023-01-10', 2, 360.00),
(11, 11, 12, '2023-01-11', 1, 500.00),
(12, 12, 13, '2023-01-12', 1, 25.00),
(13, 13, 14, '2023-01-13', 2, 60.00),
(14, 14, 15, '2023-01-14', 3, 135.00),
(15, 15, 16, '2023-01-15', 1, 80.00),
(16, 16, 17, '2023-01-16', 1, 60.00),
(17, 17, 18, '2023-01-17', 2, 40.00),
(18, 18, 19, '2023-01-18', 5, 50.00),
(19, 19, 20, '2023-01-19', 2, 50.00),
(20, 20, 21, '2023-01-20', 1, 60.00),
(21, 21, 22, '2023-01-21', 1, 100.00),
(22, 22, 23, '2023-01-22', 1, 15.00),
(23, 23, 24, '2023-01-23', 2, 180.00),
(24, 24, 25, '2023-01-24', 3, 15.00),
(25, 25, 26, '2023-01-25', 4, 100.00),
(26, 26, 27, '2023-01-26', 1, 450.00),
(27, 27, 28, '2023-01-27', 1, 600.00),
(28, 28, 29, '2023-01-28', 1, 500.00),
(29, 29, 30, '2023-01-29', 2, 240.00),
(30, 30, 31, '2023-01-30', 1, 350.00),
(31, 31, 32, '2023-01-31', 1, 450.00),
(32, 32, 33, '2023-02-01', 1, 40.00),
(33, 33, 34, '2023-02-02', 2, 100.00),
(34, 34, 35, '2023-02-03', 3, 120.00),
(35, 35, 36, '2023-02-04', 1, 60.00),
(36, 36, 37, '2023-02-05', 1, 35.00),
(37, 37, 38, '2023-02-06', 2, 110.00),
(38, 38, 39, '2023-02-07', 1, 40.00),
(39, 39, 40, '2023-02-08', 3, 120.00),
(40, 40, 1, '2023-02-09', 1, 1200.00);

SELECT MAX(Quantity), MIN(Quantity)
FROM Orders

-----MEDIUM----------------------------------

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, Amount) VALUES
(1, 101, '2023-01-15', 150.00),
(2, 102, '2023-02-10', 250.00),
(3, 103, '2023-03-05', 300.00),
(4, 101, '2023-04-01', 200.00),
(5, 104, '2023-05-12', 180.00),
(6, 102, '2023-06-20', 220.00),
(7, 105, '2023-07-18', 100.00),
(8, 103, '2023-08-25', 180.00),
(9, 106, '2023-09-30', 310.00),
(10, 102, '2023-10-10', 130.00);

SELECT CustomerID
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
EXCEPT
SELECT CustomerID
FROM Invoices;


CREATE TABLE Products_Discounted (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    DiscountedPrice DECIMAL(10, 2),
    Category VARCHAR(50)
);

INSERT INTO Products_Discounted (ProductID, Name, DiscountedPrice, Category) VALUES
(101, 'Apple', 0.80, 'Fruit'),
(102, 'Banana', 0.60, 'Fruit'),
(103, 'Orange', 0.75, 'Fruit');


SELECT Name
FROM Products
UNION ALL
SELECT Name
FROM Products_Discounted


SELECT Name
FROM Products
UNION
SELECT Name
FROM Products_Discounted

SELECT YEAR(OrderDate), AVG(TotalAmount)
FROM Orders
GROUP BY YEAR(OrderDate)


SELECT Name, Price,
CASE
	WHEN Price < 100 THEN 'LOW'
	WHEN Price  BETWEEN 100 AND 500 THEN 'MID'
	ELSE 'High'
END AS PriceGroup
FROM Products

SELECT DISTINCT Location  
FROM customers
ORDER BY Location ASC

---------------------------------------------------------
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);

SELECT ProductID, SUM(SaleAmount)
FROM Sales
GROUP BY ProductID

SELECT Name
FROM Products
WHERE Name LIKE '%oo%'

SELECT ProductID
FROM Products 
INTERSECT 
SELECT ProductID
FROM Products_Discounted

-------HARD------------------------------------------

SELECT TOP 3 CustomerID, SUM(Amount) AS Totalspent
FROM Invoices
GROUP BY CustomerID
ORDER BY Totalspent DESC;


SELECT ProductID, Name
FROM Products
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM Products_Discounted
);


SELECT Products.Name, COUNT(Sales.ProductID) AS TotalSales 
FROM Products
JOIN Sales ON Products.ProductID=Sales.ProductID
GROUP BY Products.Name


SELECT TOP 5 ProductID, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ProductID
ORDER BY TotalQuantity DESC;
