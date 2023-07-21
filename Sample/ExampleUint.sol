// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract ExampleUint {

    uint256 public myUint; // 0 - (2^256)-1
    uint8 public myUint8 = 2**4; // 0 to 255
    int8 public myint8; // -128 to 127
    int public myInt = -10; // -2^255 to 2^255 - 1

    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementInt() public {
        myInt++;
    }

    function decrementInt() public {
        myInt--;
    }

    // avoid fixed points
    // use arbitary decimal points
    // eg. 
    // uint numTokens = 10000;
    // uint decimalPt = 2;
    // means that it is 100 tokens
}