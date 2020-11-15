const express = require("express");
const router = express.Router();
const merchants = require("../controllers/merchants");
router.get("/merchants", merchants.merchants);
module.exports = router;
