-------EASY---------------------
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
	firstName VARCHAR(100),
	lastName VARCHAR(100),
    DepartmentID INT,
	age INT,
	Salary DECIMAL(10, 2),
    email VARCHAR(100) NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);



INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance');

INSERT INTO Employees (EmployeeID, firstName, lastName, DepartmentID, Salary, email, age) 
VALUES
(1, 'John', 'Doe', 1, 55000.00, 'johndoe@example.com', 20),
(2, 'Jane', 'Smith', 2, 65000.00, NULL, 50),
(3, 'Mary', 'Johnson', 3, 45000.00, 'maryjohnson@example.com', 55),
(4, 'James', 'Brown', 1, 60000.00, 'jamesbrown@example.com', 29),
(5, 'Patricia', 'Davis', 4, 70000.00, NULL, 30),
(6, 'Michael', 'Miller', 2, 75000.00, 'michaelmiller@example.com', 85),
(7, 'Linda', 'Wilson', 3, 48000.00, NULL, 70),
(8, 'David', 'Moore', 4, 85000.00, 'davidmoore@example.com', 39),
(9, 'Elizabeth', 'Taylor', 1, 60000.00, 'elizabethtaylor@example.com', 35),
(10, 'William', 'Anderson', 2, 64000.00, 'williamanderson@example.com', 76),
(11, 'Susan', 'Thomas', 3, 47000.00,  NULL, 10),
(12, 'Joseph', 'Jackson', 4, 78000.00, 'josephjackson@example.com', 58),
(13, 'Karen', 'White', 1, 59000.00,  'karenwhite@example.com', 30),
(14, 'Steven', 'Harris', 2, 71000.00,  'stevenharris@example.com', 33),
(15, 'Nancy', 'Clark', 3, 45000.00, NULL, 42);


----------------------------------------------------------------------
SELECT TOP 5 *
FROM Employees

SELECT firstName, lastName, ISNULL(email, 'noemail@example.com') AS email
FROM Employees;

SELECT * 
FROM Employees

SELECT * 
FROM Departments

SELECT Employees.firstName, Employees.lastName,  Employees.Salary, Departments.DepartmentName
FROM Employees 
JOIN Departments  ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary >= 5000
  AND Departments.DepartmentName = 'HR';

----------------------------------------------------------------------------------------

-- 1. Categories jadvalini yaratish
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,     
    CategoryName VARCHAR(100) NOT NULL 
);

-- 2. Products jadvalini yaratish
CREATE TABLE Products (
    product_id INT PRIMARY KEY,               -- Mahsulotning unikal identifikatori
    ProductName VARCHAR(50) NOT NULL,          -- Mahsulotning nomi
    email VARCHAR(100) UNIQUE,                 -- Mahsulot uchun elektron pochta, takrorlanmas bo'lishi kerak
    Price DECIMAL(10, 2),                      -- Mahsulot narxi, DECIMAL turida aniq qiymat
	stock DECIMAL(10, 2),
    CategoryID INT,                            -- Mahsulotning kategoriya identifikatori
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)  -- FOREIGN KEY
);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Furniture');

 
INSERT INTO Products (product_id, ProductName, email, Price, CategoryID,stock) 
VALUES
(1, 'Apple', 'example@gmail.com', 110,1,42),
(2, 'Banana', 'example@gmail1.com', 50,2,52),
(3, 'Apple', 'example@gmail2.com', 800,2,30),
(4, 'Orange', 'example@gmail3.com', 30,1,89),
(5, 'Banana', 'example@gmail4.com', 60,3,52),
(6, 'Grapes', 'example@gmail5.com', 200,2,45);

SELECT DISTINCT Products.ProductName, Categories.CategoryName
FROM Products
JOIN Categories  ON Products.CategoryID = Categories.CategoryID;


SELECT DISTINCT ProductName
FROM Products

SELECT *  
FROM Products  
WHERE CAST(Price AS DECIMAL(10,2)) > 100;

SELECT *  
FROM Products  
WHERE ProductName LIKE 'A%';

SELECT *  
FROM Products  
ORDER BY CAST(Price AS INT) ASC;

SELECT * 
FROM Products
WHERE Price BETWEEN 50 AND 100;

SELECT * 
FROM Products
ORDER BY ProductName DESC;

-------MEDIUM-----------------------------------------
SELECT TOP 10 * 
FROM Products
ORDER BY Price DESC;

SELECT EmployeeID, COALESCE(FirstName, LastName) AS First_NonNull_Name
FROM Employees;

SELECT DISTINCT Categories.CategoryName, Products.Price
FROM Products
JOIN Categories  ON Products.CategoryID = Categories.CategoryID;

SELECT DISTINCT CategoryID, Price
FROM Products;

SELECT Employees.age, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID=Departments.DepartmentID
WHERE age >= 30-40 AND DepartmentName = 'Marketing'

SELECT * 
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT * 
FROM Products 
WHERE Price <= 1000 AND Stock > 50
ORDER BY Stock;

SELECT *
FROM Products  
WHERE ProductName LIKE 'e%';

SELECT * 
FROM Departments
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

SELECT * 
FROM Employees
WHERE Salary > ANY (SELECT AVG(Salary) FROM Employees);





CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100),
    PostalCode VARCHAR(20)
);


INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode)
VALUES
(1, 'John Doe', 'New York', '10001'),
(2, 'Jane Smith', 'Boston', '20002'),
(3, 'Alice Johnson', 'Boston', '10003'),
(4, 'Bob Brown', 'New York', '30001'),
(5, 'Charlie Lee', 'Chicago', '40002');


SELECT * 
FROM Customers
ORDER BY City ASC, PostalCode DESC;

--------HARD-----------------------------------------------------
CREATE TABLE Items (
    ItemID INT PRIMARY KEY,        -- Mahsulotni noyob identifikatori
    ItemName VARCHAR(100),         -- Mahsulot nomi
    Price DECIMAL(10, 2)           -- Mahsulot narxi
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),  -- Savdo identifikatori, avtomatik o'sish
    ItemID INT,                            -- Mahsulot identifikatori
    Quantity INT,                          -- Sotilgan miqdor
    UnitPrice DECIMAL(10, 2),              -- Mahsulot narxi
    SaleDate DATE,                         -- Savdo sanasi
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)  -- Mahsulot jadvali bilan bog'lanish
);

INSERT INTO Items (ItemID, ItemName, Price)
VALUES
(1, 'Apple', 1.5),
(2, 'Banana', 0.5),
(3, 'Grapes', 2.0),
(4, 'Orange', 1.0),
(5, 'Mango', 3.0);

INSERT INTO Sales (ItemID, Quantity, UnitPrice, SaleDate)
VALUES
(1, 100, 1.5, '2025-04-01'),
(2, 200, 0.5, '2025-04-02'),
(3, 150, 2.0, '2025-04-03'),
(4, 120, 1.0, '2025-04-04'),
(5, 80, 3.0, '2025-04-05');
+


SELECT TOP 10 Items.ItemName, SUM(Sales.Quantity * Sales.UnitPrice) AS SalesAmount
FROM Sales
JOIN Items ON Sales.ItemID = Items.ItemID
GROUP BY Items.ItemName
ORDER BY SalesAmount DESC;
