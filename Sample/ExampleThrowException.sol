// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract WillThrow {

    error NotAllowed(string);

    function aFunction() public pure {
        // require(false, "error message");
        // assert(false);
        revert NotAllowed("You are not allowed");
    }
}

contract ErrorHandling {

    event ErrorLogging (string reason);
    event ErrorCode (uint errorCode);
    event ErrorBytes (bytes lowLevelData);

    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            // add code if works
        } catch Error (string memory reason) { // require error
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) { //asert has no reason, only errorCode
            emit ErrorCode(errorCode);
        } catch (bytes memory lowLevelData) { // all others
            // 0x367dccf7 signature of the error, the rest are the encoded string in ascii
            // 0x367dccf700000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000013596f7520617265206e6f7420616c6c6f77656400000000000000000000000000
            emit ErrorBytes(lowLevelData);
        }
    }
}