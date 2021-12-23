--DELIVERABLE 1
SELECT e.emp_no,
       e.first_name,
       e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
	INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON(emp_no)
       emp_no,
       first_name,
       last_name,
       title

INTO unique_table
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select count(title),title INTO retiring_titles from unique_table group by title order by count(title) DESC;

--DELIVERABLE 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO me_table
FROM employees AS e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;