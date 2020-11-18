require("dotenv").config();
const { retrieveAllGroups } = require("../services/groups");

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
