--Deliverable 1: Retirement Titles, Part 1 of 3
--SELECT DISTINCT ON (emp_no)
SELECT
		e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO Retirement_Titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, ti.from_date DESC;

--Deliverable 1: Unique Titles, Part 2 of 3
SELECT DISTINCT ON (emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		ti.title
INTO Unique_Titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, ti.from_date DESC;

--Deliverable 1: Retiring Titles, Part 3 of 3
SELECT COUNT (emp_no), title
INTO Retiring_Titles
FROM Unique_Titles
GROUP BY title
ORDER BY COUNT (emp_no) DESC;

--Deliverable 1: Mentorship_Eligibility
SELECT DISTINCT ON (emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibility
FROM employees as e

INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '1999-01-01')
ORDER BY e.emp_no;