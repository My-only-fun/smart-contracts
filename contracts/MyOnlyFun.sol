// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./token/OnlyFunERC20.sol";

contract MyOnlyFun {

    // structures for token and ownership
    address[] tokens;

    // mapping of token to owner
    // mapping (address (OnlyFunERC20 token) => address (owner)) owners;
    mapping(address => address) owners;
    
    // Create and deploy token
    function createAndDeployOnlyFunERC20(
        string calldata name,
        string calldata symbol,
        uint256 initialSupply
    ) external returns (OnlyFunERC20 creditsAddress) {
        uint256 defaultDecimals = 1000000000000000000;

        OnlyFunERC20 newToken = new OnlyFunERC20(
            name,
            symbol,
            initialSupply //* defaultDecimals
        );
        // add token address to list of tokens
        tokens.push(address(newToken));

        // transfer all tokens to owner
        newToken.transfer(msg.sender, initialSupply * defaultDecimals);

        // add owner to mapping
        owners[address(newToken)] = msg.sender;
        return newToken;
    }

    // get tokens
    function getTokens() external view returns (address[] memory) {
        return tokens;
    }

    // get token owner
    function getTokenOwner(address token) external view returns (address) {
        return owners[token];
    }

    // get smart contract address
    function getContractAddress() external view returns (address) {
        return address(this);
    }

}