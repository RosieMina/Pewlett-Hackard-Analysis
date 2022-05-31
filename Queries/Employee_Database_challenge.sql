-- Retrieve columns from Employees tables 
select emp_no, first_name, last_name 
from employees;
-- Retrieve columns from Titles table
select title, from_date, to_date
from title;

-- Join tables 
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01'AND '1955-12-31'
ORDER BY e.emp_no;

Select * from retirement_titles;

-- Retrieve columns from retirement table
-- Create a Unique titles table using INTO clause
SELECT DISTINCT ON(rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT * FROM unique_titles;

-- Create retiring_titles
SELECT COUNT(ut.title) count_title, ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count_title DESC;

SELECT * FROM retiring_titles;

-- Create mentonship_eligibility
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS DE
ON (e.emp_no = de.emp_no)
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

SELECT * FROM mentorship_eligibility;
 

 -- Increased eligibility years by 5 years
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date, t.title
INTO new_mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS DE
ON (e.emp_no = de.emp_no)
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1960-01-01' AND '1965-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

select * from new_mentor_eligibility;
-- count of new mentors
SELECT COUNT(nme.title) count_title, nme.title
INTO mentor_count
FROM new_mentor_eligibility AS nme
GROUP BY nme.title
ORDER BY count_title ASC;

select * from mentor_count;