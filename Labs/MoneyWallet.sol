// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MoneyWallet {
    uint public currentBal;

    // deposit
    function deposit() public payable {
        currentBal += msg.value;
    }

    // see sc balance - in case it does not go to currentBal
    function viewBalance() public view returns(uint) {
        return address(this).balance;
    }

    // withdraw to specific address
    function withdrawToAddr(address payable _inputAddr) public payable {
        if (currentBal > msg.value) {
            _inputAddr.transfer(msg.value);
        }
    }

    // withdraw all to specific address
    function withdrawAllToAddr(address payable _inputAddr) public {
        _inputAddr.transfer(viewBalance());
    }

    // withdraw
    function withdraw() public payable {
        if (currentBal > msg.value) {
            payable(msg.sender).transfer(msg.value);
        }
    }

    // withdrawAll
    function withdrawAll() public payable {
        address payable to = payable(msg.sender);
        to.transfer(viewBalance());
    }
}