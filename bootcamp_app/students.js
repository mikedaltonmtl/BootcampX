const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
  SELECT students.id as student_id, students.name as name, cohorts.name as cohort
  FROM students
  INNER JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `;

const cohortName = process.argv[2];
const resLimit = process.argv[3] || 5;
// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, resLimit];

pool
  .query(queryString, values)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.name} has an id of ${row.student_id} and was in the ${row.cohort} cohort`);
    })
  })
  .catch(e => console.error(e.stack));
