// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {

    Privacy public privacyInstance = Privacy(0x4BE397D02f837E645C3AC0C6100F1BD8e31E6CE0);

    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      bytes32 key = 0xf80c6b2cc331f1fae81d4ee9f3e592589d787f8b99d4d18cdb14309d0824acca;
      console.log("Before lock", privacyInstance.locked());
      privacyInstance.unlock(bytes16(key));
      console.log("After lock", privacyInstance.locked());
      vm.stopBroadcast();
    }

}