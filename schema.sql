-- Creating tables for PH=EmployeesDB
Create Table departments (
	dept_no Varchar(4) NOT NULL,
	dept_name Varchar(40) NOT NULL,
	Primary Key (dept_no),
	UNique (dept_name)
);

Create Table employees (
	emp_no INT NOT NULL,
	birth_date Date NOT NULL,
	first_name varchar(40) NOT NULL,
	last_name varchar(40) NOT NULL,
	gender varchar(10) NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
);

Create Table dept_manager (
	dept_no Varchar(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
		PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE title (
	emp_no int NOT NULL,
	title VARCHAR NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM departments;