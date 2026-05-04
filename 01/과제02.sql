/*
학번 : 202517096
이름 : 임정혁
주제 : 집계함수
해당 절 : 3.3.1
*/

-- 1번
SELECT
    MAX(salary) AS Maximum,
    MIN(salary) AS Minimum,
    SUM(salary) AS Sum,
    AVG(salary) AS Average
FROM employees;

-- 2번
SELECT
    job_id,
    MAX(salary) AS Maximum,
    MIN(salary) AS Minimum,
    SUM(salary) AS Sum,
    AVG(salary) AS Average
FROM employees
GROUP BY job_id;

-- 3번
SELECT
    job_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY job_id;

-- 4번
SELECT COUNT(DISTINCT manager_id) AS manager_count
FROM employees
WHERE manager_id IS NOT NULL;

-- 5번
SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
WHERE salary <= 5000
GROUP BY department_id;

-- 6번
SELECT
    job_id,
    MIN(salary) AS min_salary
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

-- 7번
SELECT
    department_id,
    job_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id ASC, job_id ASC;

-- 8번
SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5000;