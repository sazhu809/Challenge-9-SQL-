-- 1. List the employee number, first and last name, sex, and salary of each employee
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM Employees as e
JOIN Salaries as s
ON e.emp_no = s.emp_no;

-- 2. List the first and last name, and the hire date for the employees who were hired in 1986
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date 
FROM Employees as e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY e.hire_date ASC;

-- 3. List the manager of each department along with their dept number, dept name, employee number, first and last name
SELECT dm.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name
FROM Departments as d
JOIN Dept_manager as dm
	ON d.dept_no = dm.dept_no
	JOIN Employees as e
		ON dm.emp_no = e.emp_no;
		
-- 4. List the department number for each employee along with that employee's employee number, first and last name, and department name		
SELECT de.emp_no, d.dept_name, d.dept_no, e.first_name, e.last_name
FROM Employees as e
JOIN Dept_employees as de
	ON e.emp_no = de.emp_no
	JOIN Departments as d
		ON de.dept_no = d.dept_no;

-- 5. List the first and last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT * 
FROM Employees as e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the sales department including their employee number, first and last name 
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM Employees as e
JOIN Dept_employees as de
	ON e.emp_no = de.emp_no
	JOIN Departments as d
		ON de.dept_no = d.dept_no
		WHERE dept_name= 'Sales';
		
-- 7. List each employee in the sales and development department including their employee number, first and last name 
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM Employees as e
JOIN Dept_employees as de
	ON e.emp_no = de.emp_no
	JOIN Departments as d
		ON de.dept_no = d.dept_no
		WHERE d.dept_name= 'Sales' OR d.dept_name = 'Development';

-- 8. List the frequency counts in descending order of all the employee last names
SELECT last_name, COUNT(last_name) AS ls_frequency 	
FROM Employees
GROUP BY last_name
ORDER BY ls_frequency DESC;