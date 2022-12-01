/*
Get the cohort with the longest average duration of assistance requests.

The same requirements as the previous query, but only return the single row with the longest average.
Expected Result:

 name  | average_assistance_time 
-------+-------------------------
 MAR12 | 00:15:44.556041
(1 row)
*/
SELECT MAX(avg_assistance_times)
FROM(
  SELECT  cohorts.name,
          AVG(assistance_requests.completed_at - assistance_requests.started_at) AS avg_assistance_times
  FROM assistance_requests
    INNER JOIN students ON assistance_requests.student_id = students.id
    INNER JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name) AS average_assistance_time;