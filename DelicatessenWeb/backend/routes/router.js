const express = require("express");
const router = express.Router();
const merchants = require("../controllers/merchants");
const groups = require("../controllers/groups");
router.get("/merchants", merchants.merchants);
router.get("/groups", groups.groups);
module.exports = router;
