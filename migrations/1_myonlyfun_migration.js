const MyOnlyFun = artifacts.require("MyOnlyFun");

module.exports = function (deployer) {
  deployer.deploy(MyOnlyFun);
};
