const Groups = require("../models/groups");

const retrieveAllGroups = async () => {
  try {
    const groupsData = await Groups.find();
    return groupsData;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
const insertProductInGroups = async (groupsName, categoryName, name, image) => {
  const data = {
    name,
    image
  };
  console.log(data);

  try {
    //check if groups and category exist
    const categorieAlreadyExist = await Groups.findOne({
      "name.en": groupsName,
      "categories.name.en": categoryName
    });
    console.log("is existing?");
    console.log(categorieAlreadyExist);
    const productAlreadyExist = await Groups.findOne({
      "categories.name.en": categoryName,
      "categories.products.name.en": name.en
    });
    if (!categorieAlreadyExist)
      throw new Error(
        "Error this group or category do not exist contact admin to create it for you"
      );
    if (productAlreadyExist)
      throw new Error("Error this product already exist");
    //insert the data
    categorieAlreadyExist.categories[0].products.push(data);
    categorieAlreadyExist.save();
    return categorieAlreadyExist;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
module.exports = {
  retrieveAllGroups,
  insertProductInGroups
};
