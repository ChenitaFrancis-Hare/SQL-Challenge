-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/01Bl2M

CREATE TABLE "titles" (
    "title_id" VARCHAR(50) PRIMARY KEY,
    "title" VARCHAR(50)
);

CREATE TABLE "employees" (
    "emp_no" INTEGER PRIMARY KEY,
    "emp_title_id" VARCHAR(50) NOT NULL,
    "birth_date" DATE,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "sex" VARCHAR(30)   NOT NULL,
    "hire_date" DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER,
    "salary" INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(50) PRIMARY KEY,
    "dept_name" VARCHAR(50) NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER,
    "dept_no" VARCHAR(50),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(50),
    "emp_no" INTEGER,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
