// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract BlockChainMessenger {

// it can store string on bc, readable for all but writable only for person who deployed smart contract 

    uint public changeCounter;
    address public owner;
    string public message;

    constructor () {
         owner = msg.sender;
    }

    function setMessage (string memory _input) public {
        if (msg.sender == owner) {
            message = _input;
            changeCounter++;
        }
    }
}