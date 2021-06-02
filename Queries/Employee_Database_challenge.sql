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