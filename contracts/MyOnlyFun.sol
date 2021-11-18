// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./token/OnlyFunERC20.sol";

contract MyOnlyFun {

    // structures for token and ownership
    address[] tokens;

    // mapping of token to owner
    mapping(address => address) owners;
    
    // Create and deploy token
    function createAndDeployOnlyFunERC20(
        string calldata name,
        string calldata symbol,
        uint8 decimals,
        uint256 initialSupply
    ) external returns (OnlyFunERC20 creditsAddress) {

        OnlyFunERC20 newToken = new OnlyFunERC20(
            name,
            symbol,
            decimals,
            initialSupply
        );

        tokens.push(address(newToken));
        return newToken;
    }

    // get tokens
    function getTokens() external view returns (address[] memory) {
        return tokens;
    }

}