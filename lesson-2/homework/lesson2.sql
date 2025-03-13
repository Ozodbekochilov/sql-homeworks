



CREATE TABLE Clients(
EmpID INT IDENTITY(1,1) PRIMARY KEY,
[Name] VARCHAR(50),
Salary DECIMAL(10,2),
);

CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary FLOAT
);

INSERT INTO Employee (ID, Name, Salary) VALUES (1, 'Ali', 4500.75);
INSERT INTO Employee (ID, Name, Salary) VALUES (2, 'Kamol', 12000.99);

SELECT * FROM Employee

ALTER TABLE Clients
ADD Department VARCHAR(50) NOT NULL;


SELECT * FROM Clients;

INSERT INTO Clients ([Name],Salary)
VALUES 

('Ozodbek',50000.00),
('Timur',40000.00),
('Xudoyor',95000.00);

UPDATE Clients SET Salary = 52000.00 WHERE EmpID = 1;	

DELETE FROM Clients WHERE EmpID = 2;


TRUNCATE TABLE Clients;

DROP TABLE Clients;

ALTER TABLE Clients
ALTER COLUMN NAME VARCHAR(100);

TRUNCATE TABLE Clients;




--------------MEDUIM LEVEL -------------------


DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY, 
    EmpName VARCHAR(100) NOT NULL,
	Departments VARCHAR(100)
);

INSERT INTO Employees (EmpID, EmpName,Departments)
VALUES 
    (1, 'Ozodbek','Commerce'),
    (2, 'Otabek','State'),
    (3, 'Oybek','Health');

SELECT * FROM Employees;

TRUNCATE TABLE Employees;

ALTER TABLE Employees
DROP COLUMN Departments;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY, 
    DeptName VARCHAR(100) NOT NULL,
    EmpID INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Departments(DeptID, DeptName, EmpID)
VALUES
    (1, 'Department of Commerce', 3),
    (2, 'Department of State', 1),
    (3, 'Department of Health', 2);

SELECT * FROM Departments;

DROP TABLE Departments;
---------------------------------------------------

CREATE TABLE Management(
ManID INT PRIMARY KEY,
ManName VARCHAR(50),
ManSalary VARCHAR(100)
);

INSERT INTO Management(ManID, ManName, ManSalary)
VALUES
(1,'Ozodbek','2000'),
(2,'Otabek','7500'),
(3,'Otabek','500'),
(4,'Otabek','9500'),
(5,'Oybek','8100');

SELECT * FROM Management

SELECT * FROM Management 
WHERE CAST(ManSalary AS INT) > 5000;


DROP TABLE Management


------------------------------------------------------------------------
CREATE TABLE Users (
    Name VARCHAR(100),   
    Surname NVARCHAR(100)
);

SELECT * FROM Users


-------------------------------------------------------------------------



