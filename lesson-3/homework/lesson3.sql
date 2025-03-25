USE AdventureWorks2022
-----EASY-----------

--SQL Serverga import qilish mumkin bo‘lgan to‘rtta asosiy faylari-------------
-- 1. CSV (Comma-Separated Values) – Matnli fayl formati bo‘lib, maydonlar vergul bilan ajratilgan bo‘ladi.
-- 2. XLSX (Excel) – Microsoft Excel fayllari orqali ma’lumotlarni import qilish mumkin.
-- 3. XML (Extensible Markup Language) – Tuzilgan ma’lumotlarni SQL Serverga yuklash uchun ishlatiladi.
-- 4. JSON (JavaScript Object Notation) – Zamonaviy ilovalardan ma’lumot import qilish uchun ishlatiladi.


CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50) UNIQUE,
	Price DECIMAL(10,2)
)

INSERT INTO Products(ProductID,ProductName, Price)
VALUES
(1, 'PEPSI', '100000'),
(2, 'OSH', '50000'),
(3, 'COLA', '10000')
------------------------------------------------------------------------------------------------------
---NULL VA NOT NULLNI FARQI

CREATE TABLE Talabalar (
    ID INT PRIMARY KEY,
    Ism VARCHAR(50) NOT NULL,  -- NOT NULL: Ism bo‘sh bo‘lishi mumkin emas
    Telefon VARCHAR(15) NULL   -- NULL: Telefon raqami kiritilmasa ham bo‘ladi
);

INSERT INTO Talabalar (ID, Ism, Telefon)
VALUES
(1, 'Ali', NULL); -- Telefon kiritilmasa ham bo‘ladi

INSERT INTO Talabalar (ID, Ism, Telefon) 
VALUES
(2, NULL, '998901234567'); -- Xatolik: Ism NULL bo‘lishi mumkin emas

-----------------------------------------------------------------------------------------------------------------

