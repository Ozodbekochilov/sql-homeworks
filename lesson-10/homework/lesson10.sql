---EASY---------------------------
--TASK-1
SELECT e.Name, e.Salary, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000

--TASK-2
SELECT c.FirstName,c.LastName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;


--TASK-3
SELECT e.Name, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID


--TASK-4
SELECT  s.SupplierName, p.ProductName
FROM Suppliers s 
LEFT JOIN Products p ON s.SupplierID = p.SupplierID


--TASK-5
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID


--TASK-6
SELECT e1.Name, e2.Name
FROM Employees e1
JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID


--TASK-7
SELECT s.Name, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID  
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101'


--TASK-8
SELECT c.FirstName, c.LastName, SUM(o.Quantity)
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING SUM(o.Quantity) > 3


--TASK-9
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources'


---MEDIUM--------------------------------
--TASK-1
SELECT d.DepartmentName, COUNT(e.EmployeeID)
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 10


--TASK-2
SELECT p.ProductName, s.ProductID
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL


--TASK-3
SELECT 
    c.FirstName, 
    c.LastName, 
    COUNT(o.OrderDate) AS OrderTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY  c.FirstName, c.LastName;


--TASK-4
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID


--TASK-5
SELECT e1.Name, e2.Name, e1.ManagerID
FROM Employees e1
JOIN Employees e2 ON e1.ManagerID = e2.ManagerID AND e1.EmployeeID < e2.EmployeeID
WHERE e1.ManagerID IS NOT NULL


--TASK-6
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate BETWEEN '2022-01-01' AND '2022-12-31'


--TASK-7
SELECT e.Name, e.Salary, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'sales' AND e.Salary > 60000


--TASK-8
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID 


--TASK-9
SELECT p.ProductID, p.ProductName 
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL


---HARD---------------------------------------
--TASK-1
SELECT Name, Salary
FROM Employees
WHERE Salary > (
	SELECT AVG(Salary)
	FROM Employees
)


--TASK-2
SELECT o.OrderID, o.OrderDate
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.OrderDate < '2020-01-01' AND p.OrderID IS NULL;


--TASK-3
SELECT p.ProductID, p.ProductName, c.CategoryID
FROM Products p
LEFT JOIN Categories c ON TRY_CAST(p.Category AS INT) = c.CategoryID
WHERE c.CategoryID IS NULL;


--TASK-4
SELECT e1.Name, e2.Name, e1.ManagerID, e2.Salary AS e2Salary
FROM Employees e1
JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID
WHERE e2.Salary > 60000


--TASK-5
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE 'M%'


--TASK-6
SELECT s.SaleID, p.ProductName, s.SaleAmount
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.SaleAmount > 500


--TASK-7
SELECT s.StudentID, s.Name
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Math 101'
);

--TASK-8
SELECT o.OrderID, o.OrderDate, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL


--TASK-9
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON TRY_CAST(p.Category AS INT) = c.CategoryID
WHERE c.CategoryName IN('Electronics','Furniture')

