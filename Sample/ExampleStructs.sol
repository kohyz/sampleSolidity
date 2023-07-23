// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// child contract, more expensive because another contract initialised
contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract Wallet {
    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}


// cheaper than paymentreceived, structs
contract Wallet2 {

    struct PaymentReceivedStrut {
        address from;
        uint amount;
    }

    PaymentReceivedStrut public payment;

    function payContract() public payable {
        // payment = PaymentReceivedStrut(msg.sender, msg.value);
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}