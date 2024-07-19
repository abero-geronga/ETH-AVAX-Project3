// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Fauna is ERC20 {
    address public owner;

    // Constructor that initializes the token with a name, symbol, and initial supply
    constructor(uint256 initialSupply) ERC20("Fauna", "FNA") {
        _mint(msg.sender, initialSupply);// Mint the initial supply to the deployer
        owner = msg.sender;
    }

     // Modifier to restrict certain functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Not the Owner");
        _;
    }

    // Function that allows the owner to mint new tokens
    function mint(address to, uint256 value) external onlyOwner {
        _mint(to, value);
    }

    function burn(address from, uint256 value) external {
        _burn(from, value);
    }

    function transfer(address receiver, uint256 amount) public override returns (bool) {
    require(receiver != address(0), "Receiver address cannot be the zero address");
    _transfer(msg.sender, receiver, amount);
    return true;
    }

}
