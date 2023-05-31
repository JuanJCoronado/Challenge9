--Verify tables contain values
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

-- Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	emp.emp_no, emp.first_name, emp.last_name, emp.sex, sal.salary
FROM
	employees AS emp
JOIN salaries AS sal
	ON emp.emp_no = sal.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	first_name, last_name, hire_date
FROM
	employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	depmgr.dept_no, deps.dept_name, emp.emp_no, emp.first_name, emp.last_name
FROM
	employees AS emp
INNER JOIN dept_manager AS depmgr
	ON emp.emp_no = depmgr.emp_no
INNER JOIN departments AS deps
	ON depmgr.dept_no = deps.dept_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--List each employee in the Sales department, including their employee number, last name, and first name.
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).