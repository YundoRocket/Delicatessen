const mongoose = require("./mongodb");
const Schema = mongoose.Schema;
const categoriesSchema = new Schema({
  name: {
    en: { type: String, required: true },
    de: { type: String, required: true },
    fr: { type: String, required: true }
  },
  image: { type: String, required: true },
  subCategories: [
    {
      name: {
        en: { type: String, required: true },
        de: { type: String, required: true },
        fr: { type: String, required: true }
      },
      image: { type: String, required: true }
    }
  ]
});
module.exports = mongoose.model("categories", categoriesSchema);
