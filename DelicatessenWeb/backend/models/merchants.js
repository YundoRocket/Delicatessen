const mongoose = require("./mongodb");
const Schema = mongoose.Schema;
const merchantsSchema = new Schema({
  tag: { type: String, required: true },
  description: String,
  address: String,
  city: String,
  zip: String,
  country: String,
  loc: {
    type: { type: String },
    coordinates: [Number]
  },
  img: String,
  email: String
});
module.exports = mongoose.model("merchants", merchantsSchema);
