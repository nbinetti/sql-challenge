-- Details of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no

--employees hired in 1986
SELECT first_name, last_name, hire_date from employees
WHERE hire_date like '%1986'

-- manager of each department
SELECT DISTINCT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name from dept_manager as m
INNER JOIN dept_manager as n
ON m.dept_no = n.dept_no
INNER JOIN departments as d
ON m.dept_no = d.dept_no
INNER JOIN employees as e
ON m.emp_no = e.emp_no
WHERE e.emp_title = 'm0001'
ORDER BY 1

-- department of each employee, sorted by last name just because
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name from dept_emp AS d
INNER JOIN employees AS e
ON d.emp_no = e.emp_no
INNER JOIN departments as dept
ON d.dept_no = dept.dept_no
ORDER BY 2

-- employees with first name Hercules and last name begins with B
SELECT first_name, last_name, sex from employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- Sales department employees: employee number, last/first name, dept name
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name from employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments as dept
ON d.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales'

-- Sales and Development departments employee number, last/first name, dept name
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name from employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments as dept
ON d.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales'
OR dept.dept_name = 'Development'

-- frequency count of employee last names 
SELECT last_name, COUNT(last_name) from employees
GROUP BY last_name 
ORDER BY 2 DESC

