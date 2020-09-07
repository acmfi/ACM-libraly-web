const express = require('express');
const bodyParser = require('body-parser');
const fetch = require('node-fetch')
const request = require('request')

const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:true}));

app.get('/', function (req, res) {
  res.render('index', {isISBN: null, book: null, error: null})
});

app.get('/addBook', function (req, res) {
  res.render('addBook');
});

app.listen(3000, function () {
  console.log('The best web ever is running on port 3000!');
});

app.post('/', function (req, res) {

  let book = req.body.book;
  let url = `http://localhost:4000/api/books/${book}`;
  let isISBN = book.match(/^(97(8|9))?\d{9}(\d|X)$/)

  fetch(url, {
    method: "GET"
  })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        res.render('index', {isISBN: null, book: null, error: 'Error: Libro no encontrado!'});
      }
    })
    .then(data => {
      console.log(data)
      if(isISBN){
        res.render('index', {isISBN: isISBN, book: data, error: null})
      }else{
        res.render('index', {isISBN: isISBN, book: data, error: null})
      }
    })
    .catch(error => console.log('error is', error));
});

app.post('/addBook', function (req, res) {

  let book = req.body.book;
  let url = 'http://localhost:4000/api/books/add_book';

  isbn_number = parseInt(book[0]);
  edition_number = parseInt(book[3]);

  const dataToSend = {
    url: url,
    json: true,
    body: {
      "ISBN": isbn_number,
      "title": book[1],
      "author": book[2],
      "edition": edition_number,
      "publisher": book[4]
    }
  };

  request.post(dataToSend, (err, res, body) => {
    if(err){
      return console.log(err);
    }

    console.log(`Status: ${res.statusCode}`);
    console.log(body);
  });
});

