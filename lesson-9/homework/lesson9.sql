----EASY--------------
--TASK-1
SELECT p.ProductName, s.SupplierName 
FROM Products AS p
CROSS JOIN Suppliers AS s; 

--TASK-2
SELECT d.DepartmentID, e.Name
FROM Employees AS e
CROSS JOIN Departments AS d

--TASK-3
SELECT s.SupplierName, p.ProductName
FROM Products AS p
CROSS JOIN Suppliers AS s

--TASK-4
SELECT c.FirstName, o.ProductID
FROM Orders AS o
JOIN Customers AS c ON o.CustomerID = o.CustomerID

--TASK-5
SELECT s.Name, c.CourseName
FROM Courses AS c
CROSS JOIN Students AS s

--TASK-6
SELECT p.ProductID, p.ProductName, o.OrderID
FROM Products AS p
JOIN Orders AS o ON p.ProductID = o.ProductID


--TASK-7
SELECT d.departmentID, e.Name
FROM Employees AS  e
JOIN Departments AS d ON e.departmentID = d.departmentID


--TASK-8
SELECT e.CourseID, s.Name
FROM Students AS s
JOIN Enrollments AS e ON s.StudentID = e.StudentID


--TASK-9
SELECT o.*
FROM Payments AS p
JOIN Orders AS o ON p.OrderID = o.OrderID 


--TASK-10
SELECT o.OrderID, p.ProductName, p.Price
FROM Products AS p
JOIN Orders AS o ON p.ProductID = o.ProductID
WHERE p.Price > 100


-----------------MEDIUM------------------------------------------------
--TASK-1
SELECT e.Name, d.DepartmentName
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID IS DISTINCT FROM d.DepartmentID


--TASK-2
SELECT p.ProductName, p.Price
FROM Products AS p
JOIN Orders AS o ON p.ProductID = o.ProductID
WHERE o.TotalAmount < p.Price


--TASK-3
SELECT c.FirstName, s.SaleAmount
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.SaleAmount >= 500


--TASK-4
SELECT s.Name, c.CourseName
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID 
JOIN Students s ON e.StudentID = s.StudentID


--TASK-5
SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE 'Tech%'


--TASK-6
SELECT  o.OrderID, o.TotalAmount, p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.TotalAmount > p.Amount


--TASK-7
SELECT e1.[Name] AS EmpName, e1.ManagerID, e1.Salary AS EmpSalary, e2.Salary AS ManagerSalary
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID
WHERE e1.Salary > e2.Salary

SELECT *
FROM Employees

SELECT e1.[Name] AS EmpName, e1.ManagerID, e1.Salary AS EmpSalary, e2.Salary AS ManagerSalary
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID
WHERE e1.Salary > e2.Salary + 1000

--TASK-8
SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName = 'Electronics' OR c.CategoryName = 'Furniture'


--TASK-9
SELECT c.CustomerID, s.SaleID, c.FirstName, c.Country, s.SaleAmount
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA'


--TASK-10
SELECT o.OrderID, c.CustomerID, c.FirstName, c.Country, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100


---HARD----------------------------------------------
--TASK-1
SELECT e1.Name AS Employee1, e2.Name AS Employee2, e1.DepartmentID AS Department1, e2.DepartmentID AS Department2
FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;


--TASK-2
SELECT p.PaymentID, p.Amount, (o.Quantity * pro.Price) AS PriceTotal
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pro ON o.ProductID = pro.ProductID
WHERE p.Amount <> (o.Quantity * pro.Price)


--TASK-3
SELECT s.StudentID,s.Name, e.StudentID, e.EnrollmentID
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID 
WHERE e.EnrollmentID IS NULL


--TASK-4
SELECT e1.Name, e1.Salary, m2.Name, m2.Salary
FROM Employees e1
JOIN Employees m2 ON e1.ManagerID = m2.EmployeeID
WHERE e1.Salary >= m2.Salary 


--TASK-5
SELECT c.CustomerID, o.OrderID, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE p.PaymentID IS NULL

