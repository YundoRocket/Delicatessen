require("dotenv").config();
const { retrieveAllCategories } = require("../services/categories");

exports.categories = async (req, res) => {
  let categories;
  try {
    categories = await retrieveAllCategories();
  } catch (error) {
    res.status(404).send();
  }
  if (categories) {
    res.status(200).json({ categories });
  }
};
