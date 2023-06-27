--3.1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no
LIMIT(5);


--3.2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, 
	employees.last_name, 
	employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01'
LIMIT(5);


--3.3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, 
	departments.dept_name, 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name
FROM employees
	JOIN dept_manager
	ON employees.emp_no=dept_manager.emp_no
		JOIN departments
		ON departments.dept_no=dept_manager.dept_no
	LIMIT(5);


--3.4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name 
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (departments.dept_no = dept_emp.dept_no)
	LIMIT(5);


--3.5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, 
	employees.last_name, 
	employees.sex 
FROM employees
	WHERE 
		first_name = 'Hercules' 
		AND last_name like 'B%'
	LIMIT(5);


--3.6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name 
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (departments.dept_no = dept_emp.dept_no)
		WHERE departments.dept_name='Sales'
	LIMIT(5);


--3.7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name 
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (departments.dept_no = dept_emp.dept_no)
		WHERE departments.dept_name='Sales' OR departments.dept_name='Development'
	LIMIT(5);



--3.8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, 
COUNT(last_name) AS "count_ln"
FROM employees
GROUP BY last_name
ORDER BY "count_ln" DESC
LIMIT(5);

