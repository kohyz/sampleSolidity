// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SampleFallBack {

    uint public lastValueSent;
    string public lastFunctionCalled;

    uint public myUint;

    function setMyUint(uint _myNewUint) public {
        myUint = _myNewUint;
    }

    // input data, first 4 bytes 8 hex characters, fucntion character - eg sha3(setMyUint(uint256))
    // 0xe492fd840000000000000000000000000000000000000000000000000000000000000001

    receive() external payable {
        lastValueSent = msg.value; // value in wei
        lastFunctionCalled = "receive";
    }

    // catch all
    fallback() external payable {
        lastValueSent = msg.value; // send event is better
        lastFunctionCalled = "fallback";
    }

}