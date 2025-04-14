CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    CategoryID INT,
    StockQuantity INT
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Insert categories into Categories table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Furniture'),
(4, 'Stationery'),
(5, 'Clothing'),
(6, 'Tools');


INSERT INTO Products (ProductID, Name, Price, CategoryID, StockQuantity) VALUES
(1, 'Laptop', 1200.00, 1, 30),
(2, 'Smartphone', 800.00, 1, 50),
(3, 'Tablet', 400.00, 1, 40),
(4, 'Monitor', 250.00, 1, 60),
(5, 'Keyboard', 50.00, 2, 100),
(6, 'Mouse', 30.00, 2, 120),
(7, 'Chair', 150.00, 3, 80),
(8, 'Desk', 200.00, 3, 75),
(9, 'Pen', 5.00, 4, 300),
(10, 'Notebook', 10.00, 4, 500),
(11, 'Printer', 180.00, 1, 25),
(12, 'Camera', 500.00, 1, 40),
(13, 'Flashlight', 25.00, 6, 200),
(14, 'Shirt', 30.00, 5, 150),
(15, 'Jeans', 45.00, 5, 120),
(16, 'Jacket', 80.00, 5, 70),
(17, 'Shoes', 60.00, 5, 100),
(18, 'Hat', 20.00, 2, 50),
(19, 'Socks', 10.00, 5, 200),
(20, 'T-Shirt', 25.00, 5, 150),
(21, 'Lamp', 60.00, 3, 40),
(22, 'Coffee Table', 100.00, 3, 35),
(23, 'Book', 15.00, 4, 250),
(24, 'Rug', 90.00, 3, 60),
(25, 'Cup', 5.00, 2, 500),
(26, 'Bag', 25.00, 2, 300),
(27, 'Couch', 450.00, 3, 15),
(28, 'Fridge', 600.00, 1, 20),
(29, 'Stove', 500.00, 1, 15),
(30, 'Microwave', 120.00, 1, 25),
(31, 'Air Conditioner', 350.00, 1, 10),
(32, 'Washing Machine', 450.00, 1, 15),
(33, 'Dryer', 400.00, 1, 10),
(34, 'Hair Dryer', 30.00, 2, 100),
(35, 'Iron', 40.00, 1, 50),
(36, 'Coffee Maker', 50.00, 1, 60),
(37, 'Blender', 35.00, 1, 40),
(38, 'Juicer', 55.00, 1, 30),
(39, 'Toaster', 40.00, 1, 70),
(40, 'Dishwasher', 500.00, 1, 20);

SELECT MIN(Price)
FROM Products

--------------------------------------------------
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Age INT
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate, Age) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01', 34),
(2, 'Jane Smith', 2, 65000.00, '2019-03-15', 29),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10', 26),
(4, 'James Brown', 1, 60000.00, '2018-07-22', 42),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30', 39),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12', 31),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02', 36),
(8, 'David Moore', 4, 85000.00, '2021-09-01', 30),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18', 40),
(10, 'William Anderson', 2, 64000.00, '2020-04-10', 33),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25', 38),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30', 41),
(13, 'Karen White', 1, 59000.00, '2018-06-10', 32),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15', 27),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20', 29),
(16, 'George Lewis', 4, 80000.00, '2019-11-10', 35),
(17, 'Betty Lee', 1, 55000.00, '2017-04-05', 37),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22', 28),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16', 30),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11', 44),
(21, 'Betty Young', 1, 53000.00, '2020-05-17', 31),
(22, 'Frank King', 2, 67000.00, '2021-02-02', 29),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09', 30),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15', 32),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21', 33),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03', 36),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19', 29),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10', 31),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05', 27),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24', 34),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13', 37),
(32, 'Brian Moore', 4, 85000.00, '2018-11-05', 35),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11', 32),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29', 30),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06', 26),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01', 28),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19', 33),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04', 39),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23', 34),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10', 31);

SELECT MAX(Salary)
FROM Employees
-----------------------------------------
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

SELECT COUNT(*) FROM Customers;

SELECT COUNT(DISTINCT Products.CategoryID)
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
---------------------------------------------------------------
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (SaleID, CustomerID, ProductID, Quantity, Price, SaleDate) VALUES
(1, 101, 7, 2, 100.00, '2024-01-01'),
(2, 102, 3, 1, 250.00, '2024-01-02'),
(3, 101, 7, 3, 100.00, '2024-01-03'),
(4, 103, 5, 4, 150.00, '2024-01-04'),
(5, 101, 7, 1, 100.00, '2024-01-05'),
(6, 104, 2, 2, 200.00, '2024-01-06'),
(7, 102, 4, 1, 300.00, '2024-01-07');




SELECT SUM(Quantity * Price) AS TotalPrice
FROM Sales
WHERE ProductID = 7

SELECT AVG(Age)
FROM Employees

SELECT DepartmentID, COUNT(*)
FROM Employees
GROUP BY DepartmentID

SELECT Products.CategoryID, MIN(Products.Price) AS MinPrice, MAX(Products.Price) AS MaxPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Products.CategoryID;
------------------------------------------------------------
SELECT CustomerID, SUM(Quantity * Price) AS TotalPrice
FROM Sales
GROUP BY CustomerID

SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 5;

SELECT EmployeeID, Name, age, Salary
FROM Employees
WHERE Age > 40
ORDER BY Salary DESC

-----MEDUIM---------------------------------------------

SELECT Products.ProductID, 
       SUM(Sales.Price * Sales.Quantity) AS TotalSales,
       AVG(Sales.Price * Sales.Quantity) AS AverageSales
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.ProductID;

SELECT Employees.DepartmentID, COUNT(*)
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'HR'
GROUP BY Employees.DepartmentID

SELECT DepartmentID, MIN(Salary), MAX(Salary)
FROM Employees
GROUP BY DepartmentID

SELECT DepartmentID, AVG(Salary)
FROM Employees
GROUP BY DepartmentID

SELECT DepartmentID, AVG(Salary), COUNT(*)
FROM Employees
GROUP BY DepartmentID

SELECT CategoryID, AVG(Price)
FROM Products
GROUP BY CategoryID
HAVING AVG(Price) > 400

SELECT SaleDate, SUM(Price)
FROM Sales
GROUP BY SaleDate

------------HARD--------------------------2
SELECT Products.CategoryID, AVG(Sales.Quantity * Sales.Price)
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.CategoryID
HAVING AVG(Sales.Quantity * Sales.Price) > 200;


SELECT DepartmentID, 
       SUM(Salary) AS TotalSalary, 
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 65000;

SELECT Sales.CustomerID, MAX(Sales.Quantity * Sales.Price), MIN(Sales.Quantity * Sales.Price)
FROM Sales
GROUP BY Sales.CustomerID
HAVING MAX(Sales.Quantity * Sales.Price) >= 50 AND MIN(Sales.Quantity * Sales.Price) >= 50


SELECT MONTH(Sales.SaleDate) AS SaleMonth, 
       SUM(Sales.Quantity * Sales.Price) AS TotalSales, 
       COUNT(DISTINCT Sales.ProductID) AS DistinctProductsSold
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY MONTH(Sales.SaleDate)
HAVING COUNT(DISTINCT Sales.ProductID) > 8;
