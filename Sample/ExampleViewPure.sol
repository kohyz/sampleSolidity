// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ExampleViewPure {

    uint public myStorageVariable;

    // modifying state requires gas, concurrent operation requires mining and doesnt return values
    // reading values is free anmd dont need mining, view/ pure
    
    

    // view = access state variables
    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    // pure = not accessing state variables, exist on its own arguments and other pure
    function getAddition(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function setMyStorageVariable(uint _newVar) public {
        myStorageVariable = _newVar;

        // bad to return this, returns "uint256: 234"
        // return _newVar;
    }
}