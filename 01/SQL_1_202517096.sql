/*
학번 : 202517096
이름 : 임정혁
주제 : SELECT
해당 절 : 3.3.1
*/
use hr2;

-- 29페이지 연습문제
-- 1. DEPARTMENTS 테이블의 모든 내용을 출력하라.
select * from departments;

/*
2. 각 사원(employee)의 성(last name), job code, 고용일(hire date), 사원
번호(employee number)를 출력하라. 사원번호가 가장 앞에 나와야 한
다. HIRE_DATE는 STARTDATE로 출력하라.
*/
select employee_id, last_name, job_id, hire_date "STARTDATE" from employees;

/*
3. 사원들에게 배정된 job code를 출력하라. 중복된 값은 한번만 출력한다
*/
select distinct job_id from employees;

/*
4. 가능한 모든 job code를 출력하라. 사원들에게 배정되지 않은 job code도 출력되어야 한다.
*/
select job_id from employees;

/*
5.사원의 사원번호, 성, 급여를 출력하라. 각 컬럼의 이름은 Emp_id, Employee, Salary이다. Employee은 이름이 아닌 성만 출력된다
*/
SELECT
    employee_id AS Emp_id, last_name AS Employee, salary AS Salary FROM employees;

-- 42페이지 연습문제

-- 1번
SELECT last_name, salary from employees where salary>= 120000;

-- 2번
SELECT last_name, first_name, employees.department_id from employees where employee_id = 176;

-- 3번
SELECT last_name, salary from employees where salary <= 5000;

-- 4. 급여를 $12000 이상 받고 있는 사원의 성과 이름, 급여, 부서번호를 출력
SELECT last_name, first_name, salary, department_id
FROM employees
WHERE salary >= 12000;


-- 5. 급여를 $5000 이상, $12000 이하로 받고 있는 사원의 사원번호, 성, 급여를 출력
--    급여가 많은 사람부터 출력
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 12000
ORDER BY salary DESC;


-- 6. 성이 Matos이거나 Taylor인 사원의 성과 시작날짜, Job code를 출력
--    고용일이 빠른 사람이 먼저 출력
SELECT last_name, hire_date, job_id
FROM employees
WHERE last_name IN ('Matos', 'Taylor')
ORDER BY hire_date ASC;


-- 7. 부서번호 20과 50사이인 사원의 성, 부서번호를 출력
--    성이 알파벳 역순으로 출력
SELECT last_name, department_id
FROM employees
WHERE department_id BETWEEN 20 AND 50
ORDER BY last_name DESC;


-- 8. 50번 부서에서 일하는 사원들이 근무하는 job id를 중복 제거하여 출력
SELECT DISTINCT job_id
FROM employees
WHERE department_id = 50;
