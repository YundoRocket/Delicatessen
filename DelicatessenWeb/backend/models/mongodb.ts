export {};
require('dotenv').config()
let mongoose = require('mongoose')
const uri = process.env.MONGO_DB_URI
mongoose.connect(uri, { useNewUrlParser: true })

module.exports = mongoose
