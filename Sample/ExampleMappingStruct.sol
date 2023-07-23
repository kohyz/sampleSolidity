//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract MappingsStructExample {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        mapping(uint => Transaction) deposit;
        mapping(uint => Transaction) withdraw;
        uint numWithdrawal;
        uint numDeposit;
    }

    mapping(address => Balance) public balanceReceived;

    function getDepositNum(address _from, uint idx) public view returns(Transaction memory) {
        return balanceReceived[_from].deposit[idx];
    }

    function deposit() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;

        balanceReceived[msg.sender].numDeposit++;
        Transaction memory txn = Transaction(msg.value, block.timestamp);

        balanceReceived[msg.sender].deposit[balanceReceived[msg.sender].numDeposit] = txn;
    }

    function withdrawal(address payable _to, uint _amount) public {
        balanceReceived[msg.sender].totalBalance -= _amount;

        balanceReceived[msg.sender].numWithdrawal++;
        Transaction memory txn = Transaction(_amount, block.timestamp);

        balanceReceived[msg.sender].withdraw[balanceReceived[msg.sender].numWithdrawal] = txn;
        _to.transfer(_amount);
    }
}
