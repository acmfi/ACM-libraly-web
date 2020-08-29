const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');
const fetch = require('node-fetch')

const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:true}));

app.get('/', function (req, res) {
  res.render('index', {book: null, error: null})
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

app.post('/', function (req, res) {

  let book = req.body.book;
  let url = `http://localhost:4000/api/books/${book}`;
  let isISBN = book.match(/^(97(8|9))?\d{9}(\d|X)$/)

  fetch(url, {
    method: "get"
  })
    .then((res) => res.json())
    .then((data) => {
      // TODO: Cambiar BOOM para que devuelva un 404 cuando no se encuentre el libro!
      // Y así poder hacer "res.responseCode != 200" (responseCode o algo asi es :/)
      if(data.length == 0)
        res.render('index', {book: null, error: 'Error: Libro no encontrado!'})
      else{
        if(isISBN){
          let bookInfo = `El libro \"${data.title}\" ha sido escrito por \"${data.author}\".`
          res.render('index', {book: bookInfo, error: null})
        }else{
          let bookInfo = `El libro \"${data[0].title}\" ha sido escrito por \"${data[0].author}\".`
          res.render('index', {book: bookInfo, error: null})
        }
      }
    })
    .catch((err) => console.log(err));
});

