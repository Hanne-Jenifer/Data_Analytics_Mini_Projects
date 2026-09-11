select *
from hr.employees;


select employee_id, first_name, last_name, job_id, salary
from hr.employees;


select salary, employee_id, first_name, last_name, job_id
from hr.employees;


-- Where 
-- Helps you to filter out the non aggregated (raw data) values

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary > 10000;

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary < 5000; 

-- Fetch all employees whos salary is greater than 5000 less than 10000
select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary > 5000 and salary < 10000;

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary > 5000 or salary < 10000;

-- BETWEEN

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary between 5000 and 10000;

-- WRONG PRACTICE
select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary between 5000.0000000000001 and 9999;


-- Filtering non-numeric values

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where job_id = 'IT_PROG';

-- Fetch data for employees who work for IT_PROG and AD_VP

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where job_id = 'IT_PROG' or job_id = 'AD_VP';


select employee_id, first_name, last_name, job_id, salary
from hr.employees
where job_id = 'IT_PROG' and job_id = 'AD_VP';


select employee_id, first_name, last_name, job_id, salary
from hr.employees
where job_id in ('IT_PROG', 'AD_VP'); # job_id = 'IT_PROG' or job_id = 'AD_VP'


select employee_id, first_name, last_name, job_id, salary
from hr.employees
where job_id not in ('IT_PROG', 'AD_VP'); 

-- Fetch all employees whos salary is greater than equal to 5000 and less than equal to 15000 and also work for IT_PROG and FI_ACCOUNT

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where salary between 5000 and 15000 and job_id in ('IT_PROG', 'FI_ACCOUNT');

-- Fetch all the employees whos first_name starts with A

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name = 'A';


-- LIKE

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name like 'A%';

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name like '%a';

-- Fetch all employees whos first_name starts with a and last_name starts with B
select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name like 'A%' and last_name like 'B%';


-- Feth all the employees whos first_name starts with A and first_name ends with A
select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name like 'A%' and first_name like '%a';


select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name like 'A%a';

-- NOT LIKE

select employee_id, first_name, last_name, job_id, salary
from hr.employees
where first_name not like 'A%';


-- IS NULL/ IS NOT NULL
select employee_id, first_name, last_name, job_id, salary, commission_pct 
from hr.employees
where commission_pct is not null;

select employee_id, first_name, last_name, job_id, salary, commission_pct 
from hr.employees
where commission_pct is null;


-- SELECT -- Yes
-- FROM -- Yes
-- WHERE -- Yes
-- GROUP BY
-- HAVING
-- ORDER BY -- Yes
-- LIMIT -- Yes
-- OFFSET -- Yes


-- ORDER BY
select employee_id, first_name, salary
from hr.employees
order by salary asc;

select employee_id, first_name, salary
from hr.employees
order by salary desc;


select employee_id, first_name, salary
from hr.employees
order by first_name desc;

select employee_id, first_name, salary
from hr.employees
order by first_name;

select employee_id, first_name, salary
from hr.employees
order by salary desc, first_name desc;

-- LIMIT

select *
from hr.employees
order by first_name asc
limit 3;

-- Fetch top highest earning employees name
select employee_id, first_name, last_name
from hr.employees
order by salary desc
limit 3;

-- OFFSET
select employee_id, first_name, last_name
from hr.employees
order by salary desc
limit 3
offset 2;

select employee_id, first_name, last_name
from hr.employees
order by salary desc
limit 3
offset 3;

-- ALIAS
select employee_id as emp_id, first_name as first_1, salary as sal
from hr.employees;

-- CASE WHEN STATEMENT

select employee_id, first_name, job_id, salary,
case 
	when salary > 10000 then 'Greater than 10k'
    else 'less than 10k' end as sal_bif
from hr.employees;


select employee_id, first_name, job_id, salary,
case 
	when salary > 10000 then 'Greater than 10k'
    when salary between 5000 and 10000 then 'between 5k and 10k'
    else 'less than 5k' end as sal_bif
from hr.employees;



select employee_id, first_name, job_id, salary,
case 
	when salary > 10000 then 'Greater than 10k'
    when salary between 5000 and 10000 then 'between 5k and 10k'
    end as sal_bif
from hr.employees;


select employee_id, first_name, job_id, salary,
case 
	when salary > 5000 then 'Greater than 5k'
    when salary > 10000 then 'Greater than 10k'
    else 'Less than 5k' end as sal_bif
    
, case 
	when salary between 5000 and 10000 then 'B/w 5k and 10k'
    when salary between 10000 and 240000 then 'Greater than 10k'
    when salary between 3500 and 5000 then 'b/w 3.5k and 5k'
    else 'less than 3.5k' end as sal_bif2
from hr.employees;



select employee_id, first_name, job_id, salary,
case 
	when salary > 10000 then 'Greater than 10k'
    when salary between 5000 and 10000 then 'between 5k and 10k'
    end as sal_bif
from hr.employees;


select employee_id, first_name, job_id, salary,
case 
	when job_id in ('AD_PRES') and salary > 10000 then 'Owner'
    when job_id in ('AD_PRES', 'AD_VP') and salary >15000 then 'Co-owners'
    when job_id like '%CLERK%' and salary < 5000 then 'CLERK'
    when salary < 5000 then 'Junior Clerk'
    when salary > 10000 then 'Manager'
    else 'Others' end as role_bif
from hr.employees
where case 
	when job_id in ('AD_PRES') and salary > 10000 then 'Owner'
    when job_id in ('AD_PRES', 'AD_VP') and salary >15000 then 'Co-owners'
    when job_id like '%CLERK%' and salary < 5000 then 'CLERK'
    when salary < 5000 then 'Junior Clerk'
    when salary > 10000 then 'Manager'
    else 'Others' end = 'Co-owners';
    
    
    -- OPERATIONS
-- +/ - / */ / / %

select employee_id
, first_name
, salary
, salary + 10000 as add_salary
, salary - 10000 as sub_salary
, salary * 1.5 as mul_salary
, salary / 4 as div_salary
, salary % 7 as mod_salary
from hr.employees;

-- DISTINCT 
select distinct job_id, salary
from hr.employees;