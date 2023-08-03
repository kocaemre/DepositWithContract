// SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract DepositWithFunc {
    address public owner;
    mapping(address => uint) public balances;
    int public x = 0;

    constructor() {
        owner = msg.sender;
    }

    // Payable fallback function to receive Ether when sent directly to the contract
    receive() external payable {
        x++;
        balances[msg.sender] += msg.value;
    }

    // Function to get the balance of the caller
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Function to get the global balance of the contract
    function getGlobalBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Function to add balance to the contract (can be called by anyone and accept Ether)
    function addBalance() public payable {
        x++;
    }

    // Function to transfer Ether from the contract to another address (only owner can call)
    function transferTo(address payable to, uint amount) public payable returns (bool) {
        require(to == msg.sender, "You are not the owner!");
        require(balances[msg.sender] > 0, "You have no money");
        require(balances[msg.sender] >= amount, "You don't have enough balance to transfer");

        if (balances[msg.sender] >= amount) {
            to.transfer(amount);
            balances[msg.sender] -= amount;
            return true;
        } else {
            return false;
        }
    }
}
