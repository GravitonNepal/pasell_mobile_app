const express = require('express');
const path = require('path');
require('./DataBase/Mongodb');

require('dotenv').config();
const Search_Route = require("./Routes/search.route");
const comment_Route = require("./Routes/comment.route");
const app = express();

// Middleware
app.use( express.json() );
app.use( express.urlencoded({ extended: false }) );


// Routes
app.use( require('./Routes/route') );

app.use("/api", Search_Route);
app.use("/api",comment_Route)


// This folder will be Public
app.use( express.static( path.join( __dirname, 'Uploads/Profile') ));
app.use( express.static( path.join( __dirname, 'Uploads/Home' )));
app.use( express.static( path.join( __dirname, 'Uploads/Products' )));
app.use( express.static( path.join( __dirname, 'Uploads/Categories' )));
app.use( express.static( path.join( __dirname, 'Uploads/Images' )));



// Puerto - Listen 
// PORT 7070 
app.listen( process.env.PORT, () => console.log('Listen on port ' + process.env.PORT) );

