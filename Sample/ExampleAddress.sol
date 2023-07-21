// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ExampleAddress {

    // 1 eth = 10^18 wei
    // wei smallest denomination of eth

    // used to transfer eth from smart contract from and to address

    address public someAddress; // 20bytes or 40 hex characters

    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    function getAddressBalance() public view returns(uint) {
        return someAddress.balance;
    }
}
