require("dotenv").config();
const { retrieveAllMerchants } = require("../services/merchants");

exports.merchants = async (req: any, res: any) => {
  let merchants;
  try {
    merchants = await retrieveAllMerchants();
  } catch (error) {
    res.status(404).send();
  }
  if (merchants) {
    res.status(200).json({ merchants });
  }
};
