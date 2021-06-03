-- Drop table (if necessary)
DROP TABLE emp_challenge;

-- Retrieve employee number and name from Employees table and put into table.
SELECT emp_no, first_name, last_name
INTO emp_challenge
FROM employees
-- Filter through employees born between 1952 and 1955.
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- Check status
SELECT * FROM emp_challenge;

-- Retrieve title and dates from Title table and put into table.
SELECT emp_no, title, from_date, to_date
INTO title_challenge
FROM titles;
-- Check status
SELECT * FROM title_challenge;

-- Join two tables by primary key into new table
SELECT e.emp_no, e.first_name, e.last_name,
       ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM emp_challenge AS e
INNER JOIN title_challenge AS ti 
ON e.emp_no = ti.emp_no
-- Order by employee number
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
-- Create new table
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
-- Check status
SELECT * FROM unique_titles;

-- Count number of employees per title and add to new table
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
-- Sort by count number in descending order
ORDER BY COUNT(emp_no) DESC;
-- Check status
SELECT * FROM retiring_titles;

-- Drop table if necessary
DROP TABLE IF EXISTS mentor;

-- Join Employees, Department Employees, and Titles tables into one Mentor Table.
-- Retrieve employee number, names, birth dates, hire dates, and titles.
-- Use DISTINCT ON to only choose one employee number per employee.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	   de.from_date, de.to_date, ti.title
INTO mentor
-- Use aliases
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN titles AS ti
ON e.emp_no = ti.emp_no;
-- Check status
SELECT * FROM mentor;