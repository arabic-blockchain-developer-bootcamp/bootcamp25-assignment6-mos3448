// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Assignment6 {
    // 1. Declare an event called `FundsDeposited` with parameters: `sender` and `amount`
    event fundsdeposited (address sender,uint amount);

    // 2. Declare an event called `FundsWithdrawn` with parameters: `receiver` and `amount`
    event fundswithdraw (address receiver,uint amount);

    // 3. Create a public mapping called `balances` to tracker users balances
mapping(address => uint256) public balances;
    // Modifier to check if sender has enough balance
    modifier hasEnoughBalance(uint256 amount) {
    require(balances[msg.sender] >= amount, "Insufficient balance");
    }

    // Function to deposit Ether
    // This function should:
    // - Be external and payable
    // - Emit the `FundsDeposited` event
  function deposit()external payable {  balances[msg.sender]+=msg.value;
    emit fundsdeposited( msg.sender,msg.value);
    }
        // increment user balance in balances mapping 

        // emit suitable event
}
    // Function to withdraw Ether
    // This function should:
    // - Be external
    // - Take one parameter: `amount`
    // - Use the `hasEnoughBalance` modifier
    // - Emit the `FundsWithdrawn` event
  function withdraw(uint256 amount) external hasEnoughBalance (amount) {
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit fundswithdraw  (msg.sender, amount);
        // decrement user balance from balances mapping 

        // send tokens to the caller

        // emit suitable event

    }

    // Function to check the contract balance
    // This function should:
    // - Be public and view
    // - Return the contract's balance
    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
    