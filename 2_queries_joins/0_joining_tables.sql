/*
Select all rollover students (start_date will differ from their cohort's start_date).
Get the student's name, student's start_date, cohort's name, and cohort's start_date.
Alias the column names to be more descriptive.
Order by the start date of the cohort.
*/
SELECT  students.name AS name, students.start_date AS student_start_date, 
        cohorts.name AS cohort_name, cohorts.start_date AS cohort_start_date
FROM students LEFT JOIN cohorts ON cohorts.id = students.cohort_id
WHERE students.start_date <> cohorts.start_date
ORDER BY cohort_start_date;