// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ContractOne {
    mapping(address => uint) public addressBalances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        addressBalances[msg.sender] += msg.value;
    }
}

contract ContractTwo {
    receive() external payable {}

    function depositOnContractOne(address _contractOne) public {
        // ContractOne one = ContractOne(_contractOne);
        // one.deposit{value:10, gas: 100000}();

        // low level function, need to check return value
        // bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);

    }
}