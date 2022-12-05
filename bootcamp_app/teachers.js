const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
  SELECT teachers.name AS teacher, cohorts.name AS cohort
  FROM assistance_requests
    INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
    INNER JOIN students ON students.id = assistance_requests.student_id
    INNER JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name = $1
  GROUP BY teachers.name, cohorts.name
  ORDER BY teachers.name;
  `;

const cohortName = process.argv[2] || 'JUL02';
const values = [cohortName];

pool
  .query(queryString, values)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    })
  })
  .catch(e => console.error(e.stack));
