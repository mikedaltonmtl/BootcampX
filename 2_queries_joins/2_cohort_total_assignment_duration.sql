/*
Get the total amount of time that all students from a specific cohort have spent on all assignments.
This should work for any cohort but use FEB12 for now.
Select only the total amount of time as a single column.
You can write as many JOIN statements as you need in a single query. Expected Result:
Expected output:
 total_duration 
----------------
         373501
(1 row)
*/
-- SELECT  students.id, students.name, cohorts.id AS coID, cohorts.name AS cohort_name, 
SELECT SUM(assignment_submissions.duration) AS total_duration
FROM students 
  LEFT JOIN cohorts ON students.cohort_id = cohorts.id
  LEFT JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE cohorts.name = 'FEB12';


SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;
