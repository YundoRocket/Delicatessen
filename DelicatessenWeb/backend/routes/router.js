const express = require("express");
const router = express.Router();
const merchants = require("../controllers/merchants");
const categories = require("../controllers/categories");
router.get("/merchants", merchants.merchants);
router.get("/categories", categories.categories);
module.exports = router;
