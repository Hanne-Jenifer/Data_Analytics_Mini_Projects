# 1) Employees working in 'United States of America'

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name = 'United States of America';

# 2) Number of employees in each region

SELECT r.region_name, COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
GROUP BY r.region_name;

# 3) Department with the highest total salary

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_salary DESC
LIMIT 1;

# 4) Departments with no employees

SELECT d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

#5) Top 3 departments by employee count

SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY emp_count DESC
LIMIT 3;

# 6) Rank departments based on total salary

SELECT d.department_name,
       SUM(e.salary) AS total_salary,
       RANK() OVER (ORDER BY SUM(e.salary) DESC) AS dept_rank
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

# 7) Job roles where maximum salary exceeds 15,000

SELECT job_title, max_salary
FROM jobs
WHERE max_salary > 15000;

# 8) Country with the highest number of employees

SELECT c.country_name, COUNT(e.employee_id) AS emp_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
GROUP BY c.country_name
ORDER BY emp_count DESC
LIMIT 1;
