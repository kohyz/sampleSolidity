// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract ExampleString {

    // byte does not have length or index-access
    // avoid strings, its expensive
    string public myString = "hello world"; // utf 8 data
    bytes public myBytes = "hello world"; // length raw data

    function setMyString (string memory _myString) public {
        myString = _myString;
    }

    function compareTwoString(string memory str1) public view returns(bool) {
        // no inbuilt library function to compare
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(str1)); 
    }
}