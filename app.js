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

app.get("/user_question", function(req, res){
res.render("user_question.ejs");
});

app.get("/admin_panel", function(req, res){
res.render("admin_panel.ejs");
});

app.get("/admin_active", function(req, res){
res.render("admin_active.ejs");
});

app.get("/admin_ended", function(req, res){
res.render("admin_ended.ejs");
});

app.get("/admin_raport", function(req, res){
res.render("admin_raport.ejs");
});

app.get("/admin_new_user", function(req, res){
res.render("admin_new_user.ejs");
});

app.get("/admin_users", function(req, res){
res.render("admin_users.ejs");
});

app.get("/cons_panel", function(req, res){
res.render("cons_panel.ejs");
});

app.get("/cons_active", function(req, res){
res.render("cons_active.ejs");
});

app.get("/cons_ended", function(req, res){
res.render("cons_ended.ejs");
});

app.get("/cons_raport", function(req, res){
res.render("cons_raport.ejs");
});
// Set the default views directory to html folder
app.set('views', path.join(__dirname, 'html'));
// Set the folder for css & java scripts
app.use(express.static(path.join(__dirname, 'css')));
app.use(express.static(path.join(__dirname, 'node_modules')));

// Set the view engine to ejs
app.set('view engine', 'ejs');

app.use('/', routes);
