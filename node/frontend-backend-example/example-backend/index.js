var express = require('express')
const cors = require('cors');
var app = express()

var PORT = 3001

var corsOptions = {
    origin: '*',
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
}

app.use(cors(corsOptions))

app.get('/', function (req, res) {
    res.send("This is an API, not a frontend. Please visit /randomNumbers")
})

app.get('/randomNumbers', function (req, res) {


    var randNums = []

    for (let i = 0; i < 10; i++) {

        var randomBetweenZeroAndOne = Math.random()

        var randomBetweenOneAndTen = Math.floor(randomBetweenZeroAndOne * 10)

        randNums.push(randomBetweenOneAndTen)
    }

    res.send("Hello, your lucky numbers are: " + randNums)
})


app.listen(3001, function () {
    console.log(`App listening on port ${PORT}!`);
});
