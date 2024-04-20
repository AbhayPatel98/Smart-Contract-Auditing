// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Guess the password from the state variable to unlock the contract

contract Vault {
    bool public locked;
    bytes32 private password;

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
        }
    }
}