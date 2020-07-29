const fetch = require("node-fetch");



// Lo primero es hacer una pequeña prueba para ver que el server esta despierto y coleando :D

fetch('http://localhost:4000/api/books/test')
  .then((response) => {
    return response.json()
  })
  .then((data) => {
    console.log(data)
    console.log("ISBN = " + data["ISBN"])
  })
  .catch((err) => {
    console.log(err)
  })
