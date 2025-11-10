-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.

INSERT INTO Patients (patient_name, age, gender) VALUES
('John Smith', 45, 'Male'),
('Emma Johnson', 32, 'Female'),
('Liam Brown', 28, 'Male'),
('Olivia Davis', 40, 'Female'),
('Noah Wilson', 36, 'Male');

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES
(1, '2024-03-10', 101, 'Flu', 150.00),
(2, '2024-03-12', 102, 'Migraine', 250.00),
(3, '2024-03-13', 103, 'Flu', 180.00),
(4, '2024-03-14', 101, 'Diabetes Checkup', 300.00),
(5, '2024-03-15', 104, 'Back Pain', 220.00),
(1, '2024-04-01', 105, 'High Blood Pressure', 400.00),
(2, '2024-04-05', 102, 'Migraine', 270.00),
(3, '2024-04-07', 103, 'Flu', 160.00),
(4, '2024-04-08', 101, 'Diabetes Checkup', 350.00);

-- Verify inserted data
SELECT * FROM Patients;
SELECT * FROM Visits;

-- ======================================================================
-- Step 4: GROUP BY, HAVING, ORDER BY, and INDEXING Tasks
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.
SELECT 
    diagnosis, 
    AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis;

-- ======================================================================

-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.
SELECT 
    diagnosis, 
    AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;

-- ======================================================================

-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.
SELECT 
    diagnosis, 
    AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_cost DESC;

-- ======================================================================

-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.
CREATE INDEX idx_patient_id ON Visits(patient_id);

-- Verify index creation
SHOW INDEX FROM Visits;

-- Retrieve all visits for a particular patient (example: patient_id = 1)
SELECT * FROM Visits WHERE patient_id = 1;

-- ======================================================================
-- END OF EXPERIMENT
-- ======================================================================