/*
Get the total number of assistance_requests for a student.

Select the student's name and the total assistance requests.
Since this query needs to work with any specific student name, use 'Elliot Dickinson' 
for the student's name here.

Expected Result:

 total_assistances |       name       
-------------------+------------------
               138 | Elliot Dickinson
(1 row)
*/

SELECT COUNT(assistance_requests.*) AS total_assistances, students.name AS name
FROM assistance_requests
  INNER JOIN students ON assistance_requests.student_id = students.id
  WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;
