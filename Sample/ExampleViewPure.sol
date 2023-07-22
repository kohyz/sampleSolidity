// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ExampleViewPure {

    uint public myStorageVariable;

    // modifying state requires gas, concurrent operation requires mining and doesnt return values
    // reading values is free and dont need mining, view/ pure -> read from local blockchain node
    
    // public/ private
    // external = can be called from other contract/ externally
    // internal = can only be called from contract itself or derived contract, cannot be invoked by txn

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