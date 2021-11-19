const MyOnlyFun = artifacts.require("MyOnlyFun");

contract("MyOnlyFun", (accounts) => {
 let myOnlyFun;
 let tokensExpected = [];
 let lastCreatedToken;

 before(async () => {
     myOnlyFun = await MyOnlyFun.deployed();
 });


 describe("create and deploy OnlyFunERC20 token", async () => {

    // Test the initial state of the contracts
    it("Tokens should be empty array at init", async () => {
        // create a token
        //await myOnlyFun.createAndDeployOnlyFunERC20("MyOnlyFun", "MFY", 18, 1000000, {from: accounts[0]});
        let tokens = await myOnlyFun.getTokens();
        assert.equal(tokens.length, 0, "Initial tokens array is not correct");
    });

    // Test to create a token
    it("Should create a OnlyFunERC20 token", async () => {
        // create a token
        lastCreatedToken = await myOnlyFun.createAndDeployOnlyFunERC20("MyOnlyFun", "MFY", 18, 1000000, {from: accounts[0]});
        let tokens = await myOnlyFun.getTokens();
        assert.equal(tokens.length, 1, "Tokens array is not correct");
    });

    // Test tokens address
    it("Created token should have the same address as the stored one", async () => {
        let tokens = await myOnlyFun.getTokens();
        createdToken = JSON.parse(JSON.stringify(lastCreatedToken));
        assert.equal(tokens[0], createdToken.receipt.rawLogs[0].address, "Tokens address is not correct");
    });

    // Test token owner
    it("Created token should have the same owner as the stored one", async () => {
        let ownerAddress = await myOnlyFun.getTokenOwner(createdToken.receipt.rawLogs[0].address);
        
        assert.equal(ownerAddress, accounts[0], "Owner of the created OnlyFunERC20 should be us");
    });


 });
 
});