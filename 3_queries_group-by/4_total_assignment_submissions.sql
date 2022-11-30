/*
Get the total number of assignment submissions for each cohort.

Select the cohort name and total submissions.
Order the results from greatest to least submissions.
Expected Result:
 cohort | total_submissions 
--------+-------------------
 SEP24  |              9328
 JUN04  |              8030
 APR09  |              7935
 NOV19  |              7231
 JUL02  |              5868
...
(11 rows)
*/
SELECT cohorts.name AS cohort, COUNT(assignment_submissions.*) AS total_submissions
FROM students
  INNER JOIN assignment_submissions ON assignment_submissions.student_id = students.id
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;
