/*
We need to know which teachers actually assisted students during any cohort.

Instruction
Get the name of all teachers that performed an assistance request during a cohort.

Select the instructor's name and the cohort's name.
Don't repeat the instructor's name in the results list.
Order by the instructor's name.
This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here.
Expected Result:
      teacher       | cohort 
--------------------+--------
 Cheyanne Powlowski | JUL02
 Georgiana Fahey    | JUL02
 Helmer Rodriguez   | JUL02
 Jadyn Bosco        | JUL02
...
(8 rows)
*/
SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
  INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
  INNER JOIN students ON students.id = assistance_requests.student_id
  INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;