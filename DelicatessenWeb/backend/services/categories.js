const Categories = require("../models/categories");

const retrieveAllCategories = async () => {
  try {
    const categoriesData = await Categories.find();
    return categoriesData;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
module.exports = {
  retrieveAllCategories
};
