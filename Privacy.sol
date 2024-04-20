// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {

    //8 bit = 1 byte
    bool public locked = true; //slot 0 (1 bit)
    uint256 public ID = block.timestamp; //slot 1 (32 bytes)
    uint8 private flattening = 10; //slot 2 (1 bit)
    uint8 private denomination = 255; //slot 2 (1 bit)
    uint16 private awkwardness = uint16(block.timestamp); //slot 2 (2 bit)
    bytes32[3] private data; // slot 3-5 (32 bytes * 3)  --> Password stored in slot 3-5

    constructor(bytes32[3] memory _data) {
        data = _data;
    }

    function unlock(bytes16 _key) public {
   //0xf80c6b2cc331f1fae81d4ee9f3e592589d787f8b99d4d18cdb14309d0824acca  ---> password 
        // @audit-info password stored in slot 3-5
        //@audit-issue Never store sensitive data on the blockchain 
        require(_key == bytes16(data[2]));
        locked = false;
    }

    /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
    */
}