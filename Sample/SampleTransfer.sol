// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SampleTransfer {
    string public myString = "hello";

    // contract itself can have a balance
    uint public amountLeft = address(this).balance;

    // need to mark payable function to receive $
    // once input, will put $ in the smart contract
    function updateString (string memory _myString) public payable {
        if (msg.value == 1 ether) {
            myString = _myString;
        } else {
            // transfer back to receiver
            // fallback can only use 2300 gas stipend if use .transfer or .send
            payable(msg.sender).transfer(msg.value);
        }
    }
}