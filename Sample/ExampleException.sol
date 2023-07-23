//SPDX-License-Identifier: MIT

// test error with uint rollover
pragma solidity 0.7.0;

contract ExampleException {

    mapping(address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value)); // should not reach here, use all gas in the txn
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds, abort"); // use gas until it hits require function
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount); // validate invariants, should not happen
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
