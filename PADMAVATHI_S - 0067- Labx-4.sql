-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
SELECT Name, Salary, Salary + (Salary * 0.10) AS SalaryWithBonus
FROM Employees;

/* Ashish	60000.00	66000.0000
Binay	80000.00	88000.0000
Charlie	55000.00	60500.0000
Dhruv	75000.00	82500.0000
*/
-- b. Subtract tax (15% of Salary) from each employee's salary.
SELECT Name, Salary, Salary - (Salary * 0.15) AS SalaryAfterTax
FROM Employees;
/* Ashish	60000.00	51000.0000
Binay	80000.00	68000.0000
Charlie	55000.00	46750.0000
Dhruv	75000.00	63750.0000
*/

-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
SELECT Name, Salary, Salary * 12 AS YearlySalary
FROM Employees;
/* Ashish	60000.00	720000.00
Binay	80000.00	960000.00
Charlie	55000.00	660000.00
Dhruv	75000.00	900000.00
*/
-- d. Find the remainder when employees' ages are divided by 5.
SELECT Name, Age, Age % 5 AS Remainder
FROM Employees;
/* Ashish	28	3
Binay	45	0
Charlie	32	2
Dhruv	38	3
*/
-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
SELECT * FROM Employees
WHERE Age > 30 AND Salary > 50000;
/* 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						
                        */
                        
-- b. Employees either in 'HR' department OR salary > 70000.
SELECT * FROM Employees
WHERE Department = 'HR' OR Salary > 70000;
/* 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						*/
-- c. Employees who do NOT live in 'New York'.
SELECT * FROM Employees
WHERE NOT Address LIKE '%New York%';
/* 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
						*/
                        
-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
SELECT * FROM Employees
WHERE Salary = 60000;
-- 1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
						
-- b. List employees not in the 'IT' department.
SELECT * FROM Employees
WHERE Department != 'IT';
/* 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						*/
-- c. Retrieve employees younger than 25 with salary > 50000.
SELECT * FROM Employees
WHERE Age < 25 AND Salary > 50000;
-- 																		
-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35;
/* 1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
						*/
-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');
/* 1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						*/
                        
-- c. LIKE → Find employees whose names start with 'A'.
SELECT * FROM Employees
WHERE Name LIKE 'A%';
-- 1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
						
-- d. IS NULL → List employees whose address is not available.
SELECT * FROM Employees
WHERE Address IS NULL;
-- 
						
-- ========================
-- Exercise 5: Set Operators
-- ========================

-- Create sample tables for demonstration
CREATE TABLE Employees2022 (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

CREATE TABLE Employees2023 (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample data
INSERT INTO Employees2022 VALUES
(1001, 'Ashish', 'IT'),
(1002, 'Binay', 'HR'),
(1005, 'Emma', 'IT');

INSERT INTO Employees2023 VALUES
(1001, 'Ashish', 'IT'),
(1002, 'Binay', 'HR'),
(1003, 'Charlie', 'Finance');

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
SELECT Name, Department FROM Employees2022 WHERE Department = 'HR'
UNION
SELECT Name, Department FROM Employees2023 WHERE Department = 'HR';
-- Binay	HR
-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
SELECT e1.Name, e1.Department
FROM Employees2022 e1, Employees2023 e2
WHERE e1.EmployeeID = e2.EmployeeID 
AND e1.Department = 'IT' 
AND e2.Department = 'IT';
-- Ashish	IT
-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
SELECT Name, Department
FROM Employees2023
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Employees2022);
-- Charlie	Finance
-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================