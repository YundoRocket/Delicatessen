const Groups = require("../models/groups");
import {INSERT_PRODUCT_GROUPS} from "../interfaces/app_interface"
const retrieveAllGroups = async () => {
  try {
    const groupsData = await Groups.find();
    return groupsData;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
const insertProductInGroups = async (groupsName: string, categoryName: string,  name: any, image: string) :Promise<any> => {
  const data = {
    name,
    image
  };
  console.log(data);

  try {
    //retrieve group and category
    const categorieAlreadyExist = await Groups.findOne({
      "name.en": groupsName,
      "categories.name.en": categoryName
    });
    //retrieve product
    const productAlreadyExist = await Groups.findOne({
      "categories.name.en": categoryName,
      "categories.products.name.en": name.en
    });
    //check if groups and category already exist
    if (!categorieAlreadyExist)
      throw new Error(
        "Error this group or category do not exist contact admin to create it for you"
      );
    //check if product already exist
    if (productAlreadyExist)
      throw new Error("Error this product already exist");

    //insert the data and save to DB
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
