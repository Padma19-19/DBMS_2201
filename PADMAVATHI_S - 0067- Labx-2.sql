show databases;
/*OUTPUT: 
unidb
sys
petdb
performance_schema
mysql
librarydb
information_schema
dbms
db_lab
*/

create database Techsol;
-- 12:31:10	create database Techsol	1 row(s) affected	0.000 sec


use  Techsol;
-- 12:31:20	use  Techsol	0 row(s) affected	0.000 sec


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);
-- 12:31:40	CREATE TABLE Employees (     EmployeeID INT PRIMARY KEY AUTO_INCREMENT,     FirstName VARCHAR(50),     LastName VARCHAR(50),     Salary DECIMAL(10, 2),     BirthDate DATE,     HireDate DATE )	0 row(s) affected	0.016 sec



INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');
-- 12:31:59	INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES ('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'), ('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'), ('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'), ('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.016 sec


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- 12:32:22	CREATE TABLE Orders (     OrderID INT PRIMARY KEY AUTO_INCREMENT,     OrderDate DATE,     TotalAmount DECIMAL(10, 2),     EmployeeID INT,     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) )	0 row(s) affected	0.141 sec


INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
-- 12:32:40	INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES ('2024-07-15', 250.00, 1), ('2024-08-10', 175.50, 2), ('2024-09-01', 300.00, 3), ('2024-09-10', 450.75, 1), ('2024-08-25', 123.40, 4)	5 row(s) affected Records: 5  Duplicates: 0  Warnings: 0	0.016 sec

desc table Orders;
-- OUTPUT: '1', 'SIMPLE', 'Orders', NULL, 'ALL', NULL, NULL, NULL, NULL, '5', '100.00', NULL

SELECT EmployeeID, FirstName, LastName, ABS(Salary) AS AbsoluteSalary FROM Employees;
/*OUTPUT: 
'1', 'John', 'Doe', '55000.30'
'2', 'Jane', 'Smith', '65000.50'
'3', 'Alice', 'Johnson', '72000.10'
'4', 'Bob', 'Brown', '48000.90'
*/

SELECT OrderID, CEIL(TotalAmount) AS CeilAmount FROM Orders;
/*OUTPUT:
1	250
2	176
3	300
4	451
5	124
*/

SELECT COUNT(*) AS TotalEmployees FROM Employees;
-- OUTPUT: 4

SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;
-- OUTPUT: 240001.80

SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;
-- OUTPUT: 259.930000

SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;
-- OUTPUT: 72000.10	48000.90