const express = require("express");
const app = express(); // La constante app es el servidor
const path = require("path")

// Settings
app.set("port", 3000)
app.set("views", path.join(__dirname, "views"))
app.set("view engine", "ejs")
app.engine("html", require("ejs").renderFile); // Esto es para que los html los renderice ejs

// Middlewares


// Routes
app.use(require("./routes/index.js"));

// Static Files


// Server listening
app.listen(app.get("port"), () => {
  console.log("Server port: ", app.get("port"));
});
