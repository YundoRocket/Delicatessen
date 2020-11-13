const Merchants = require("../models/merchants");

const retrieveAllMerchants = async () => {
  try {
    const merchantData = await Merchants.find();
    return merchantData;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

module.exports = {
  retrieveAllMerchants
};
