const express = require("express");
const router = express.Router();
//import controllers
const merchants = require("../controllers/merchants");
const groups = require("../controllers/groups");

//routes
router.get("/merchants", merchants.merchants);
router.get("/groups", groups.groups);
router.post("/insert-product", groups.insertProduct);

module.exports = router;
