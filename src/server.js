const express = require('express');
const bodyParser = require('body-parser');
const fetch = require('node-fetch')

const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended:true}));

app.get('/', function (req, res) {
  res.render('index', {book: null, error: null})
});

app.listen(3000, function () {
  console.log('The best web ever is running on port 3000!');
});

app.post('/', function (req, res) {

  let book = req.body.book;
  let url = `http://localhost:4000/api/books/${book}`;
  let isISBN = book.match(/^(97(8|9))?\d{9}(\d|X)$/)

  fetch(url, {
    methos: "get"
  })
    .then(response => {
      if (response.ok) {
        return response.json()
      } else {
        res.render('index', {book: null, error: 'Error: Libro no encontrado!'});
      }
    })
    .then(data => {
      console.log(data)
      if(isISBN){
        let bookInfo = `El libro \"${data.title}\" ha sido escrito por \"${data.author}\".`
        res.render('index', {book: bookInfo, error: null})
      }else{
        let bookInfo = `El libro \"${data[0].title}\" ha sido escrito por \"${data[0].author}\".`
        res.render('index', {book: bookInfo, error: null})
      }
    })
  .catch(error => console.log('error is', error));
});

