export {};
require("dotenv").config();
const express = require("express");
const app = express();
const morgan = require("morgan");
const cors = require("cors");
const bodyParser = require("body-parser");
// const errorhandler = require('errorhandler')
const helmet = require("helmet");
const router = require("./routes/router");

app.use(bodyParser.json());
app.use(morgan("dev"));
app.use(cors());
app.use(helmet());
app.use("/api", router)

app.listen(3051, () => { console.log(`Listening at http://localhost:3051`)});
