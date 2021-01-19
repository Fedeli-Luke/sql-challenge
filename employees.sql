-- Create tables to import data into

CREATE TABLE departments (
    dept_no varchar(10) NOT NULL,
    dept_name varchar(30) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no varchar(10) NOT NULL
);

CREATE TABLE dept_manager (
    dept_no varchar(10) NOT NULL,
    emp_no integer NOT NULL
);

CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id varchar (10) NOT NULL,
	birth_date date NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    sex varchar(10) NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no")
);

CREATE TABLE salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);

CREATE TABLE titles (
    title_id varchar(30) NOT NULL,
    title varchar(30) NOT NULL
);


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
Join salaries
On employees.emp_no = salaries.emp_no;


-- 2.List first name, last name, and hire date for employees who were hired in 1986.

Select first_name, last_name, hire_date 
From employees
Where hire_date Between '1986-01-01' And '1987-01-01';


-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name

Select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
From departments
Join dept_manager
On departments.dept_no = dept_manager.dept_no
Join employees
On dept_manager.emp_no = employees.emp_no;


-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.

Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
Join employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;


-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

Select first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
On dept_emp.emp_no = employees.emp_no
Join departments
On dept_emp.dept_no = departments.dept_no
Where departments.dept_name = 'Sales';


-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
From dept_emp
Join employees
On dept_emp.emp_no = employees.emp_no
Join departments
On dept_emp.dept_no = departments.dept_no
Where departments.dept_name = 'Sales'
Or departments.dept_name = 'Development';


-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

Select last_name,
Count(last_name) AS "frequency"
From employees
Group by last_name
Order by
Count(last_name) Desc;




