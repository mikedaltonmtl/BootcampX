const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
/*
pool.query(`
SELECT id, name, cohort_id
FROM students
LIMIT 5;
`)
.then(res => {
  console.log(res.rows);
})
.catch(err => console.error('query error', err.stack));
*/

const cohortName = process.argv[2];
const resLimit = process.argv[3];

pool.query(`
SELECT students.id, students.name, cohorts.name as cohort
FROM students
  INNER JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${cohortName}%'
LIMIT ${resLimit};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
  })
});
