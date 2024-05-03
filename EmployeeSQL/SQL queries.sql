SELECT employee_number, last_name, first_name, sex, salary 
FROM Employee;

SELECT first_name, last_name, hire_date FROM Employee 
WHERE YEAR(hire_date) = 1986;

SELECT d.department_number, d.department_name, dm.employee_number 
AS manager_employee_number, e.last_name 
AS manager_last_name, e.first_name 
AS manager_first_name 
FROM departments d 
JOIN dept_manager dm 
ON d.department_number = dm.department_number 
JOIN employees e 
ON dm.employee_number = e.employee_number;

SELECT de.employee_number, e.last_name, e.first_name, d.department_number, d.department_name 
FROM dept_employee de 
JOIN employees e 
ON de.employee_number = e.employee_number 
JOIN departments d 
ON de.department_number = d.department_number;

SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

SELECT e.employee_number, e.last_name, e.first_name 
FROM employees e 
JOIN dept_employee de 
ON e.employee_number = de.employee_number 
JOIN departments d 
ON de.department_number = d.department_number 
WHERE d.department_name = 'Sales';

SELECT e.employee_number, e.last_name, e.first_name, d.department_name 
FROM employees e 
JOIN dept_employee de 
ON e.employee_number = de.employee_number 
JOIN department d 
ON de.department_number = d.department_number 
WHERE d.department_name IN ('Sales', 'Development');

SELECT last_name, 
COUNT(*) AS frequency 
FROM employees
GROUP BY last_name 
ORDER BY frequency DESC;


