// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SmartWalletContract {
    
    // every one has their own wallet
    mapping (address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public {
        // no concurrency, must have checks effects interaction. Reentrancy attack.
        // declare state of items
        uint balCache = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balCache);     
    }
}