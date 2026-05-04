-- 1번
select first_name, department_id, department_name
from employees e join departments d using(department_id)
where department_id <= 100;
-- 직종 상사가

-- 2번
select location_id, street_address
from departments d natural join locations l;

-- 3번
select last_name, d.department_id, d.department_name
from departments d, locations l, employees e
where d.location_id = l.location_id and e.department_id = d.department_id and city = 'Toronto';

-- 4번
select employee_id, first_name, job_id, job_title
from jobs j natural join employees e;

-- 5번
select d.department_id, d.department_name, last_name
from departments d join employees e on d.manager_id = e.employee_id;

-- 6번
select job_title, count(e.job_id)
from employees e join jobs using(job_id)
group by job_title;

-- 7번
select first_name, last_name, count(*)
from job_history j join employees using(employee_id)
group by first_name, last_name;

-- 8번
select distinct department_name
from employees e join departments using(department_id)
where salary >= 4000;

-- Outer Join 연습

-- 1번
select d.department_name, e.first_name
from departments d left outer join employees e using(department_id);

-- 2번
select  e.first_name, j.job_title
from employees e left outer join jobs j using(job_id);

-- 3번
select l.city, d.department_name
from locations l left outer join departments d using(location_id);

-- 4번
select  e.first_name, d.department_name
from departments d left outer join employees e using(manager_id)
where d.location_id = 1700
order by d.department_name desc;