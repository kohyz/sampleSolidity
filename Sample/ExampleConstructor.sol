// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ExampleConstructor {

    address public myAddress;

    constructor (address _someAddress) {
        // can only be called once, cannot be overloaded. Automatic
        myAddress = _someAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }
}