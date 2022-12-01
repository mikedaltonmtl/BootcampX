/*
We need to know the average amount of time that students are waiting for an assistance request.
This is the duration between an assistance request being created, and it being started.
Return just a single column here.
Expected Result:
 average_wait_time 
-------------------
 00:08:46.258793
(1 row)
*/

SELECT AVG(started_at - created_at)
FROM assistance_requests;