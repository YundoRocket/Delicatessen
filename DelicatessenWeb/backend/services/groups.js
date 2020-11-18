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
module.exports = {
  retrieveAllGroups
};
