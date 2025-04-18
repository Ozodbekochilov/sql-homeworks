CREATE TABLE InputTbl (
  col1 VARCHAR(10),
  col2 VARCHAR(10)
);

INSERT INTO InputTbl (col1, col2) VALUES
('a', 'b'), ('a', 'b'), ('b', 'a'),
('c', 'd'), ('c', 'd'),
('m', 'n'), ('n', 'm');

SELECT DISTINCT col1, col2
FROM InputTbl

SELECT col1, col2
FROM InputTbl
GROUP BY col1, col2;
-------------------------------------------------------------------
CREATE TABLE TestMultipleZero (
  A INT NULL,
  B INT NULL,
  C INT NULL,
  D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D) VALUES
(0,0,0,1),
(0,0,1,0),
(0,1,0,0),
(1,0,0,0),
(0,0,0,0),
(1,1,1,0);

SELECT *
FROM TestMultipleZero
WHERE NOT(A=0 AND B=0 AND C=0 AND D=0)
---------------------------------------------------------------------

CREATE TABLE section1 (
  id INT,
  name VARCHAR(20)
);

INSERT INTO section1 VALUES
(1, 'Been'),
(2, 'Roma'),
(3, 'Steven'),
(4, 'Paulo'),
(5, 'Genryh'),
(6, 'Bruno'),
(7, 'Fred'),
(8, 'Andro');

SELECT *
FROM section1
WHERE id % 2 = 1;
-------------------------------------------------------

SELECT TOP 1 id, name
FROM section1
WHERE id % 2 = 1
ORDER BY id ASC;

SELECT TOP 1 id, name
FROM section1
WHERE id % 2 = 1
ORDER BY id DESC;

---------------------------------------------------
SELECT * FROM section1
WHERE name LIKE 'B%';
------------------------------------------
CREATE TABLE ProductCodes (
  Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

SELECT *
FROM ProductCodes
WHERE code LIKE '%[_]%';
