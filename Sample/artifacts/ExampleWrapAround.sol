// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract ExampleWrapAround {

    // older solidity versions allow int wraparound, 0 -> int max value it can support
    uint256 public myUint; // 0 - (2^256)-1
    uint8 public myUint8 = 2**4;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementInt() public {
        myUint8++;
    }

    function decrementMyUint() public {
        unchecked{
            // to force wraparound in newer version
            myUint--;
        }
    }
}