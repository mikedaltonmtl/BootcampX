/*
We need to know which teachers actually assisted students during any cohort,
and how many assistances they did for that cohort.
Perform the same query as before, but include the number of assistances as well.
Expected Result:
      teacher       | cohort | total_assistances 
--------------------+--------+-------------------
 Cheyanne Powlowski | JUL02  |               336
 Georgiana Fahey    | JUL02  |               158
 Helmer Rodriguez   | JUL02  |               157
 Jadyn Bosco        | JUL02  |               177
...
(8 rows)
*/
SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(teachers.name) AS total_assistances
FROM assistance_requests
  INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
  INNER JOIN students ON students.id = assistance_requests.student_id
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;