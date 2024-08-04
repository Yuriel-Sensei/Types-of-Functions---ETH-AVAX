// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Import the ERC20 contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Define the contract
contract MyToken {

    // Public variables to store token name, abbreviation, and total supply
    string public tokenName = "YURICASH";
    string public tokenAbbrv = "YRCSH";
    uint public totalSupply = 0;

    // Mapping to keep track of each address's balance
    mapping(address => uint) public balances;

    // Function to mint new tokens
    // Increases the total supply and adds the amount to the specified address's balance
    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // Function to burn tokens
    // Decreases the total supply and subtracts the amount from the specified address's balance
    // Reverts if the specified address does not have enough balance
    function burn(address _address, uint _value) public {
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        } else {
            revert("Too much supply inputted");
        }
    }

    // Function to transfer tokens from one address to another
    // Decreases the balance of the sender and increases the balance of the receiver
    // Requires the sender to have sufficient balance
    function transfer(address _from, address _to, uint _value) public {
        require(balances[_from] >= _value, "Insufficient balance");
        balances[_from] -= _value;
        balances[_to] += _value;
        totalSupply -= _value;
    }
}
