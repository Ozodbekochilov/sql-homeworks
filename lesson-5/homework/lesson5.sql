CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
	Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Olma', 1100),
(2, 'Banan',900),
(3, 'Gilos',1250);

SELECT ProductName AS [Name]
FROM Products

--------------------------------------------------------------------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
	Country VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES
(1, 'John Doe', 'New York', '10001', 'Uzbekiston'),
(2, 'Jane Smith', 'Boston', '20002', 'Uzbekiston'),
(3, 'Alice Johnson', 'Boston', '10003', 'Kazakhstan'),
(4, 'Bob Brown', 'New York', '30001', 'Uzbekiston'),
(5, 'Charlie Lee', 'Chicago', '40002', 'Kazakhstan');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Age INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FullName, Age, Salary) VALUES
(1, 'Ali Karimov', 22, 55000.00),
(2, 'Dilshod Ergashev', 30, 62000.00),
(3, 'Ziyoda Tursunova', 24, 48000.00),
(4, 'Iroda Nishonova', 26, 70000.00),
(5, 'Sherzod Bekmurodov', 21, 61000.00);

ALTER TABLE Employees
ADD Department VARCHAR(50);

UPDATE Employees SET Department = 'HR' WHERE EmployeeID IN (1, 3);
UPDATE Employees SET Department = 'IT' WHERE EmployeeID IN (2, 4);
UPDATE Employees SET Department = 'Finance' WHERE EmployeeID = 5;


SELECT *
FROM Customers AS Client
--------------------------------------------------------------------------

CREATE TABLE Products_Discounted (
    ProductID INT,
    ProductName VARCHAR(100),
	StockQuantity INT
);

INSERT INTO Products_Discounted (ProductID, ProductName, StockQuantity)
VALUES
(101, 'Olma',100),
(102, 'Anor',90),
(103, 'Tarvuz',120);

----------------------------------------------------------
CREATE TABLE OutOfStock (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

INSERT INTO OutOfStock (ProductID, ProductName) VALUES
(5, 'Printer'),
(6, 'Webcam');


SELECT ProductName 
FROM Products
UNION
SELECT ProductName 
FROM Products_Discounted;
--------------------------------------------
SELECT ProductName 
FROM Products
INTERSECT 
SELECT ProductName 
FROM Products_Discounted;

-----------------------------------------------

SELECT DISTINCT CustomerName, Country
FROM Customers


SELECT	ProductName, Price,
CASE 
	WHEN Price > 1000 THEN 'HIGH'
	ELSE 'LOW'
END AS PriceCategory
FROM Products;

----------------------------------------------------------

SELECT 
    ProductID,
    ProductName,
    StockQuantity,
    IIF(StockQuantity > 100, 'Yes', 'No') AS IsInStock
FROM Products_Discounted

--------------------------------------------------------------

SELECT ProductID, ProductName, StockQuantity,
CASE
	WHEN StockQuantity > 100 THEN 'YES'
	ELSE 'NO'
END AS CategoryName
FROM Products_Discounted
--------------------------------------------

SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM OutOfStock
---------------------------------------------------

SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted

---------------------------------------------------

SELECT *,
IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products

---------------------------------------------------------------
SELECT *
FROM Employees
WHERE Age > 25 OR Salary > 6000
-----------------------------------------------------------
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;

SELECT * FROM Employees
