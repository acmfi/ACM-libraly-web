const express = require("express");
const router = express.Router();

router.get("/", (req, res) => { // request, response
  res.render("index.html", {title: "ACM Library"})
})

router.get("/contact", (req, res) => { // request, response
  res.render("contact.html", {title: "Contact"})
})

module.exports = router;
