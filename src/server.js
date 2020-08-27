const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');

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

  request(url, function(err, response, body){
    if(err){
      res.render('index', {book: null, error: 'Error: Libro no encontrado!'})
    }else{
      let bookList = JSON.parse(body)
      if(bookList.length <= 0 || bookList[0].ISBN == undefined){
        res.render('index', {book: null, error: 'Error: Libro no encontrado!'})
      }else{
        let bookInfo = `El libro \"${bookList[0].title}\" ha sido escrito por \"${bookList[0].author}\".`
        res.render('index', {book: bookInfo, error: null})
      }
    }
  });
});

