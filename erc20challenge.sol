// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract Mtoken is ERC20 {
    address owner;
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        owner=msg.sender;
        
    }

    function burn(uint256 amount) external{
        _burn(msg.sender,amount);
    }

    function mint() external {
    require(msg.sender==owner, "only owner can mint tokens");
    _mint(msg.sender, 10 * 10 ** decimals());
  }

}
