--Verify tables contain values
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

-- Data Analysis starts here
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
SELECT
	depemp.dept_no, deps.dept_name, emp.emp_no, emp.first_name, emp.last_name
FROM
	employees AS emp
INNER JOIN dept_emp AS depemp
	ON emp.emp_no = depemp.emp_no
INNER JOIN departments AS deps
	ON depemp.dept_no = deps.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name, last_name, sex
FROM
	employees
WHERE
	first_name = 'Hercules' AND LEFT(last_name,1) = 'B';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	emp.emp_no, emp.first_name, emp.last_name, deps.dept_name
FROM
	employees as emp
INNER JOIN dept_emp AS depemp
	ON emp.emp_no = depemp.emp_no
INNER JOIN departments as deps
	ON depemp.dept_no = deps.dept_no
WHERE
	deps.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	emp.emp_no, emp.first_name, emp.last_name, deps.dept_name
FROM
	employees as emp
INNER JOIN dept_emp AS depemp
	ON emp.emp_no = depemp.emp_no
INNER JOIN departments as deps
	ON depemp.dept_no = deps.dept_no
WHERE
	deps.dept_name = 'Sales' OR deps.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	last_name, count(1) AS "Frequency"
FROM
	employees	
GROUP BY
	last_name
ORDER BY
	"Frequency" DESC;