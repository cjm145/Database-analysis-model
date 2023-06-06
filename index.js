const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const mustacheExpress = require('mustache-express');

// Initialise objects and declare constants
const app = express();
const port = 3001;

// Create the connection to the database
var dbcon = mysql.createConnection({
    host: 'localhost',
    user: 'user',
    password: 'profession',
    database: 'prof_data'
})

function webpageRenderer(template, res) {
    return function (error, results, fields) {
        if (error)
            throw error;

        res.render(template, { data: results });
    }
}

// Connect to the database
dbcon.connect((err) => {
    if (err) {
        throw err;
    }
    console.log("Connected to database");
});

app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', './webpage');
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', function (req, res) {
    dbcon.query("SELECT * FROM data_set;", webpageRenderer('person', res));
})

app.get('/firstdata', function (req, res) {
    dbcon.query("SELECT c.country, g.gender, COUNT(*) as total FROM person p LEFT JOIN country c ON p.country = c.country_id LEFT JOIN gender g ON p.gender = g.gender_id GROUP BY c.country, g.gender ORDER BY total DESC LIMIT 10;", webpageRenderer('firstdata', res));
})

app.get('/second_data', function (req, res) {
    dbcon.query("SELECT dm.MannerOfDeath, COUNT(dm.MannerOfDeath) as frequency FROM person per INNER JOIN death_manner dm ON per.death_manner = dm.manner_id WHERE dm.MannerOfDeath IS NOT NULL AND dm.MannerOfDeath != '' GROUP BY dm.MannerOfDeath ORDER BY frequency DESC LIMIT 5;", webpageRenderer('second_data', res));
})

app.get('/third_data', function (req, res) {
    dbcon.query("SELECT o.occupation_type, g.gender, MIN(a.death_year - a.birth_year) AS lowest_age_of_death FROM data_set ds LEFT JOIN occupation o ON ds.occupation = o.occupation_type LEFT JOIN gender g ON ds.gender = g.gender LEFT JOIN age a ON ds.birth_year = a.birth_year AND ds.death_year = a.death_year GROUP BY o.occupation_type, g.gender;", webpageRenderer('third_data', res));
})

app.listen(port, function () {
    console.log('The app is listening at http://localhost:' + port + '.');
})