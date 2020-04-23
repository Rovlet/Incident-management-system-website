const express = require('express');
const path = require('path');
const routes = require('./routes');
// const mysql = require('mysql');

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
app.get("/form", function(req, res){
res.render("form.ejs");
});

app.get("/user_tree", function(req, res){
res.render("user_tree.ejs");
});

app.get("/user_panel", function(req, res){
res.render("user_panel.ejs");
});

app.get("/user_active", function(req, res){
res.render("user_active.ejs");
});

app.get("/user_ended", function(req, res){
res.render("user_ended.ejs");
});

// Set the default views directory to html folder
app.set('views', path.join(__dirname, 'html'));
app.use(express.static(path.join(__dirname, 'css')));
app.use(express.static(path.join(__dirname, 'node_modules')));

// Set the view engine to ejs
app.set('view engine', 'ejs');

app.use('/', routes);
