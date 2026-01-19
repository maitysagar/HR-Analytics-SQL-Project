-- Create database
CREATE DATABASE hr_analytics;
USE hr_analytics;

-- Create employees table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'A', 10, 'HR', 5000, '2022-01-10'),
(2, 'B', 10, 'HR', 7000, '2021-03-15'),
(3, 'C', 20, 'IT', 9000, '2020-07-20'),
(4, 'D', 20, 'IT', 6000, '2023-02-01'),
(5, 'E', 30, 'Sales', 8000, '2021-11-12');
