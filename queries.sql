-- ======================================
-- HR ANALYTICS QUERIES (MySQL 8.0)
-- ======================================

-- 1. View all employees
SELECT *
FROM employees;

-- 2. Count employees per department
SELECT
    dept_id,
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id, department;

-- 3. Average salary per department
SELECT
    dept_id,
    department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id, department;

-- 4. Employees earning above their department average
-- (Correlated Subquery)
SELECT
    emp_name,
    department,
    salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);

-- 5. Same logic using Window Function
SELECT
    emp_name,
    department,
    salary
FROM (
    SELECT *,
           AVG(salary) OVER (PARTITION BY dept_id) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;

-- 6. Department-wise maximum salary
SELECT
    dept_id,
    department,
    MAX(salary) AS max_salary
FROM employees
GROUP BY dept_id, department;

-- 7. Hiring trend by month (MySQL date truncation)
SELECT
    DATE_FORMAT(hire_date, '%Y-%m-01') AS month_start,
    COUNT(*) AS hires
FROM employees
GROUP BY month_start
ORDER BY month_start;

-- 8. Day of week employees were hired
SELECT
    emp_name,
    hire_date,
    DAYOFWEEK(hire_date) AS day_number
FROM employees;
