/*
A student's end date will be NULL when they are currently enrolled in Bootcamp.
Get all graduates without a linked Github account.
Get their name, email, and phone.
*/
SELECT name, email, phone
FROM students
WHERE end_date IS NOT NULL
AND github IS NULL;