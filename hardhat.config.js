/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");

const ALCHEMY_API_KEY = "DGKmY4R5E53Wgjpt5OrYp_M4LulGPZR0";
const METAMASK_PRIVATE_KEY = "65ba27511ea6cf01c9572f539bf6643106b75e57a4b52e13eb5ac73754072c6a";
module.exports = {
  solidity: "0.8.17",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts: [METAMASK_PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: "9JEE34BN153CM2WRS29CGUWTX8XWB313GN",
  },
};
