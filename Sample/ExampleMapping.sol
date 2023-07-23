// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ExampleMapping {

    // it is like an array
    // cannot create getter to view value stored
    mapping (uint => bool) public myMapping;

    // use for whitelist addresses
    mapping (address => bool) public myAddressMapping;

    // mapping of mapping
    mapping (uint => mapping(uint => bool)) uintUintBoolMapping;

    // find array index to set to true
    function setValue (uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1, uint _key2, bool _value) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}