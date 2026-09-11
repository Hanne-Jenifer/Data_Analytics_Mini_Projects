# 💼 HR Database SQL Analysis

This project analyzes a structured **HR relational database** using SQL to investigate employee
distribution, departmental salaries, job roles, geographic coverage, and organizational structure
through practical business-oriented queries.

---

## 🎯 Project Focus

The analysis answers eight key HR and organizational questions:

- Which employees work in the **United States of America**?
- How many employees are located in each region?
- Which department has the highest total salary?
- Which departments have no employees?
- What are the top three departments by employee count?
- How do departments rank by total salary?
- Which job roles have a maximum salary above **15,000**?
- Which country has the highest number of employees?

---

## 🗄️ Dataset

The project uses an HR database named `HR` containing the following relational tables:

| Table | Purpose |
|---|---|
| `regions` | Regional information |
| `countries` | Country information |
| `locations` | Location information |
| `departments` | Department information |
| `jobs` | Job roles and salary ranges |
| `employees` | Employee and salary information |
| `job_history` | Employee job-history records |

The `employees` table includes information such as employee ID, name, hire date, job ID,
salary, commission percentage, manager ID, and department ID.

The database also contains an `emp_details_view` combining employee, department, job,
location, country, and region information.

---

## 🔎 Analysis

### 🌎 1. Employees Working in the United States

Employee records are connected through the organizational and geographic hierarchy to
identify employees working in the **United States of America**.

### 👥 2. Employees by Region

Employees are grouped by region to determine the distribution of the workforce across
different geographic areas.

### 💰 3. Department with the Highest Total Salary

Department-level salaries are aggregated using `SUM()` and ranked in descending order to
identify the department with the highest total salary.

### 🏢 4. Departments with No Employees

A `LEFT JOIN` is used to identify departments without corresponding employee records.

### 📊 5. Top 3 Departments by Employee Count

Employees are grouped by department and ordered by employee count to identify the
three largest departments.

### 🏆 6. Department Salary Ranking

Departments are ranked by total salary using the SQL `RANK()` window function.

### 💼 7. Job Roles with Maximum Salary Above 15,000

The `jobs` table is filtered to identify roles where the defined maximum salary exceeds
**15,000**.

### 🌍 8. Country with the Highest Employee Count

Employees are connected through the geographic hierarchy and grouped by country to
identify the country with the highest employee count.

---

## 🧠 SQL Concepts

The project demonstrates practical use of:

- `SELECT`, `WHERE`, and `ORDER BY`
- `JOIN` and `LEFT JOIN`
- `GROUP BY` and aggregate functions
- `COUNT()` and `SUM()`
- `LIMIT`
- `RANK()` window functions
- Filtering with `IN`, `BETWEEN`, `LIKE`, and `NOT IN`
- `IS NULL` and `IS NOT NULL`
- `CASE WHEN`
- `DISTINCT`
- Aliases and calculated expressions

---

## 📝 Results

The available project materials contain the **HR database structure and SQL queries**, but do not
include the executed query outputs. Therefore, specific numerical findings are not stated in this
README rather than being inferred or fabricated.

The queries provide analysis of **workforce distribution, salary concentration, department
structure, job salary ranges, and geographic employee distribution**.

---

## 🛠️ Tools & Technologies

| Tool / Technology | Purpose |
|---|---|
| **SQL** | Data querying and analysis |
| **HR Relational Database** | Source data |
| **SQL Joins** | Relational data analysis |
| **Aggregate Functions** | Employee and salary calculations |
| **Window Functions** | Department salary ranking |
| **Filtering & Conditional Logic** | Business rule-based analysis |

---

## 🔄 Workflow

**HR Database → Relational Queries → Aggregation & Filtering → Ranking → Business Analysis**

---

## 📌 Project Outcome

This project demonstrates how SQL can be used to navigate a relational HR database and answer
practical questions involving **employees, departments, salaries, job roles, and geographic
distribution**.

---

## 👤 Author

**Hanne Jenifer R**
