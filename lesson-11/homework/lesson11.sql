---EASY------
--TASK-1
SELECT o.OrderID, c.FirstName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) > 2022


--TASK-2
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN('Sales', 'Marketing')


--TASK-3
SELECT EmployeeID, Name, Salary, DepartmentName
FROM (
	SELECT e.EmployeeID, e.Name, e.Salary, d.DepartmentName,
		ROW_NUMBER() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) as RowNum
	FROM Employees e
	JOIN Departments d ON e.DepartmentID = d.DepartmentID
) Subqurie
WHERE RowNum = 1


--TASK-4
SELECT c.FirstName, o.OrderID, o.OrderDate, c.Country
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN '2023-01-01' AND '2023-12-31' AND c.Country = 'USA'


--TASK-5
SELECT c.FirstName AS CustomerName, o.TotalOrders 
FROM Customers c
JOIN (
	SELECT CustomerID, COUNT(*) AS TotalOrders
	FROM Orders 
	GROUP BY CustomerID
) AS o ON c.CustomerID = o.CustomerID


--TASK-6
SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName = 'Gadget Supplies' OR s.SupplierName = 'Clothing Mart'


--TASK-7
SELECT c.FirstName AS CustomerName,  
       o.MostRecentOrderDate, 
       o.OrderID
FROM Customers c
LEFT JOIN (
    SELECT CustomerID, MAX(OrderDate) AS MostRecentOrderDate, OrderID
    FROM Orders
    GROUP BY CustomerID, OrderID
) AS o ON c.CustomerID = o.CustomerID
ORDER BY c.FirstName;



--MEDIUM--------------------------------
--TASK-1
SELECT c.FirstName,	o.OrderID, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > 500


--TASK-2
SELECT p.ProductName, s.SaleDate, s.SaleAmount
FROM Products p 
JOIN Sales s ON p.ProductID = s.ProductID
WHERE (s.SaleDate BETWEEN '2022-01-01' AND '2022-12-31') OR s.SaleAmount > 400


--TASK-3
SELECT p.ProductName, s.SaleTotal
FROM Products p 
JOIN (
	SELECT ProductID, SUM(SaleAmount) AS SaleTotal
	FROM Sales
	GROUP BY ProductID
) AS s ON p.ProductID = s.ProductID


--TASK-4
SELECT e.Name, d.DepartmentName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources' AND e.Salary > '50000'


--TASK-5
SELECT p.ProductName, s.SaleDate, p.StockQuantity
FROM Products p 
JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.SaleDate BETWEEN '2023-01-01' AND '2023-12-31' AND p.StockQuantity > 50 


--TASK-6
SELECT e.Name,	d.DepartmentName,  e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR YEAR(e.HireDate) > 2020


---HARD-------------------------
--TASK-1
SELECT c.FirstName, o.OrderID, c.Address, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND c.Address LIKE '4%'


--TASK-2
SELECT p.ProductName, p.Category, s.SaleAmount
FROM Products p 
JOIN Sales s ON p.ProductID = s.ProductID
WHERE p.Category = 1 OR s.SaleAmount > 350


--TASK-3
SELECT c.CategoryName, p.CategoryCount
FROM Categories c
JOIN (
	SELECT Category, COUNT(*) AS CategoryCount
	FROM Products
	GROUP BY Category
) AS p ON c.CategoryID = p.Category


--TASK-4
SELECT c.FirstName, c.City, o.OrderID, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300


--TASK-5
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN('Human Resources', 'Finance')
	AND (LEN(e.Name) - LEN(REPLACE(e.Name, 'a', '')) +
       LEN(e.Name) - LEN(REPLACE(e.Name, 'e', '')) +
       LEN(e.Name) - LEN(REPLACE(e.Name, 'i', '')) +
       LEN(e.Name) - LEN(REPLACE(e.Name, 'o', '')) +
       LEN(e.Name) - LEN(REPLACE(e.Name, 'u', '')) >= 4)


--TASK-6
SELECT p.ProductName, s.QuantitySold, p.Price
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.QuantitySold > 100 AND p.Price > 500;


--TASK-7
SELECT e.Name, d.DepartmentName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN('Sales', 'Marketing') AND e.Salary > 60000


