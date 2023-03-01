-- Drop exisiting tables 
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_employees CASCADE;
DROP TABLE IF EXISTS Dept_manager CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;

CREATE TABLE Departments(
	dept_no  VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT pk_Departments PRIMARY KEY (dept_no)
);

SELECT * FROM Departments;

-- Table for dept_employees
CREATE TABLE Dept_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	CONSTRAINT pk_Dept_Employees PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)

);

SELECT * FROM Dept_employees;

-- table for dept_manager
CREATE TABLE Dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	CONSTRAINT pk_Dept_manager PRIMARY KEY (dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)

);

SELECT * FROM Dept_manager;

--table for employees
CREATE TABLE Employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NUll,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT pk_Employees PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

SELECT * FROM Employees;

--table for salaries
CREATE TABLE Salaries(
	emp_no INT NOT NUll,
	salary INT NOT NUll,
	CONSTRAINT pk_Salaries PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)

);

SELECT * FROM Salaries;

--table for titles
CREATE TABLE Titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	CONSTRAINT pk_Titles PRIMARY KEY (title_id)

);

SELECT * FROM Titles;

