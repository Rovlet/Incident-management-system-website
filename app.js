const express = require('express');
const path = require('path');
const routes = require('./routes');
const mysql = require('mysql');
// const bodyParser = require('body-parser');

// const connection = mysql.createConnection({
// 	host: 'localhost',
// 	user: 'root',
// 	// password: 'password',
// 	database: 'Strona',
// 	multipleStatements: true
// });

// connection.connect(err => {
// 	if (err) throw err;
// 	console.log('Polaczone');
// });

const app = express();
app.listen(3000, () => {
	console.log('Server is running at localhost:3000');
});

app.get("/", function(req, res){
res.render("index.ejs");
});

app.get("/login", function(req, res){
res.render("login.ejs");
});
app.get("/notification", function(req, res){
res.render("notification.ejs");
});

// Set the default views directory to html folder
app.set('views', path.join(__dirname, 'html'));
// Set the folder for css & java scripts
app.use(express.static(path.join(__dirname, 'css')));
app.use(express.static(path.join(__dirname, 'node_modules')));

// Set the view engine to ejs
app.set('view engine', 'ejs');

app.use('/', routes);
