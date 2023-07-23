// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Sender {
    receive() external payable {

    }

    function withdrawTransfer(address payable _to) public {
        // transfer will throw and revert function if fail
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
        // it will return boolean, low level interaction
        bool isSent =_to.send(10);

        require(isSent, "Sending the funds is unsuccessful");
    }
}

contract ReceiverNoAction {
    receive() external payable {}

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}

contract ReceiverAction {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived = msg.value;
    }
}

