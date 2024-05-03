SET datestyle = 'iso,mdy';
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_employee;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE employees (
    employee_number INT PRIMARY KEY,
	employee_title_id VARCHAR (255),
	birth_date Date,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);

CREATE TABLE departments (
    department_number VARCHAR (255) PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE dept_Employee (
    employee_number INT PRIMARY KEY,
    department_number VARCHAR(255),
	FOREIGN KEY (department_number) REFERENCES departments(department_number)
);



CREATE TABLE Dept_Manager (
    employee_number INT PRIMARY KEY,
    department_number VARCHAR(255),
    FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);

CREATE TABLE Salaries (
    employee_number INT PRIMARY KEY,
    salary INT,
    FOREIGN KEY (employee_number) REFERENCES employees(employee_number) 
);

CREATE TABLE Titles (
    titles_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255)
);

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



