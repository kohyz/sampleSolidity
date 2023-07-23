// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Consumer {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
}


contract SmartWalletContract2 {
    address payable public owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public guardian;
    address payable nextOwner;
    uint guardiansResetCount;
    mapping(address => mapping(address => bool)) didGuardianVote;
    uint public constant confirmationsFromGuardiansForReset = 3;


    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function setGuardian(address _in, bool _isGuardian) public {
        guardian[_in] = _isGuardian;
    }

    function decideNextOwner(address payable _nextOwner) public {
        require(guardian[msg.sender], "You are not a guardian, cannot set new owner");
        require(didGuardianVote[_nextOwner][msg.sender] == false, "you already vote");
        if (nextOwner != _nextOwner) {
            nextOwner = _nextOwner;
            guardiansResetCount = 0;
        }

        guardiansResetCount++;
        didGuardianVote[_nextOwner][msg.sender] = true;
        if (guardiansResetCount >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _to, uint _amount) public {
        require(owner == msg.sender, "You are owner");
        allowance[_to] = _amount;
        isAllowedToSend[_to] = true;
    }

    function denySending(address _to) public {
        require(owner == msg.sender, "You are owner");
        isAllowedToSend[_to] = false;
    }
    
    function transfer(address payable _to, uint _amount, bytes memory payload) public returns (bytes memory) {
        require(address(this).balance >= _amount, "Not enough amount in the contract");
        if (msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send");
            require(allowance[msg.sender] >= _amount, "You have not enough amount");
            allowance[msg.sender] -= _amount;
        }
        (bool success, bytes memory returnData) = _to.call{value: _amount}(payload);
        require(success, "Transaction failed, aborting");
        return returnData;
    }
}