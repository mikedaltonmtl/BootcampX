/*
We also need to know the average total amount of time being spent on an assistance request 
for each cohort. This is just the average of the total_duration column from the previous query.

Instruction
Calculate the average total duration of assistance requests for each cohort.

Use the previous query as a sub query to determine the duration per cohort.
Return a single row average_total_duration
Expected Result:

 average_total_duration 
------------------------
 555:22:25.909091
(1 row)
*/


SELECT AVG(total_duration) AS average_total_duration
FROM (
  SELECT  cohorts.name AS cohort,
          SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
  FROM students
    INNER JOIN cohorts ON students.cohort_id = cohorts.id
    INNER JOIN assistance_requests ON assistance_requests.student_id = students.id
  GROUP BY cohorts.name
  ORDER BY total_duration)
AS average_total_duration;