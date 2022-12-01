/*
We need to be able to see the number of assignments that each day has and 
the total duration of assignments for each day.

Get each day with the total number of assignments and the total duration of the assignments.

Select the day, number of assignments, and the total duration of assignments.
Order the results by the day.
Expected Result:

 day | number_of_assignments | duration 
-----+-----------------------+----------
   1 |                    11 |      590
   2 |                     9 |      585
   3 |                     9 |      425
   4 |                     9 |      380
   5 |                     7 |      405
...
(51 rows)
*/
SELECT assignments.day, SUM(count_of_assignments) AS number_of_assignments
FROM (
  SELECT assignments.day, COUNT(assignments.id) AS count_of_assignments
  FROM assignments
  GROUP BY assignments.id;
) AS nb_assignments;



GROUP BY count_of_assignments
ORDER BY assignments.day ASC;


SELECT day, COUNT(duration), SUM(duration) FROM assignments
GROUP BY day
ORDER BY day;