require("dotenv").config();
const {
  retrieveAllGroups,
  insertProductInGroups
} = require("../services/groups");

exports.groups = async (req, res) => {
  let groups;
  try {
    groups = await retrieveAllGroups();
  } catch (error) {
    res.status(404).send();
  }
  if (groups) {
    res.status(200).json({ groups });
  }
};

exports.insertProduct = async (req, res) => {
  const { groupsName, categoryName, name, image } = req.body;
  const { apiKey } = req.params;

  let product;
  try {
    if (apiKey !== process.env.API_KEY) throw new Error("Wrong Api key");
    product = await insertProductInGroups(
      groupsName,
      categoryName,
      name,
      image
    );
  } catch (error) {
    res.status(404).send(error.message);
  }
  if (product) res.status(200).json({ product });
};
