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
  email: String,
  phone: Number,
  timesheet: {
    monday: String,
    tuesday: String,
    wednesday: String,
    thursday: String,
    friday: String,
    saturday: String,
    sunday: String
  }
});
module.exports = mongoose.model("merchants", merchantsSchema);
