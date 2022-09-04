// SPDX-License-Identifier: GPL-3.0
pragma solidity^ 0.8.7;

contract coin{
    address public minter;
    mapping(address=>uint) public balances;

    event sent(address from,address to,uint amount);
    // Constructor code is only run when the contract
    // is created
    constructor(){
        minter= msg.sender;
    }

    function mint (address reciever,uint amount) public{
        require (msg.sender==minter);
        balances[reciever]+=amount;
    }
    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    function send(address reciever, uint amount)public {
        if (amount>balances[msg.sender])
        revert InsufficientBalance({
            requested: amount,
           available: balances[msg.sender]}
        );
        balances[msg.sender]-= amount;
        balances[reciever]+= amount;
        emit sent(msg.sender,reciever,amount);
            
        }
}

