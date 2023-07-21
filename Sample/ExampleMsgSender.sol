// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ExampleMsgSender {

    address public someAddress;

    function updateSomeAddress() public {
        // person that is interacting with the smart contract;
        someAddress = msg.sender;
    }
}
