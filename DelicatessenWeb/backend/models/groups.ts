export {};
const mongoose = require("./mongodb");
const Schema = mongoose.Schema;
const groupsSchema = new Schema({
  name: {
    en: { type: String, required: true },
    de: { type: String, required: true },
    fr: { type: String, required: true }
  },
  categories: [
    {
      name: {
        en: { type: String, required: true },
        de: { type: String, required: true },
        fr: { type: String, required: true }
      },
      image: { type: String, required: true },
      products: [
        {
          name: {
            en: { type: String, required: true },
            de: { type: String, required: true },
            fr: { type: String, required: true }
          },
          image: { type: String, required: true }
        }
      ]
    }
  ]
});
module.exports = mongoose.model("groups", groupsSchema);
