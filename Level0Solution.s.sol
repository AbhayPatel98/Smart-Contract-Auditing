// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {

    Level0 public level0 = Level0(0xaC68DD38f5b422E9614d08D6e657970482a01b6d);

    function run() external {
     string memory password  = level0.password();
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      level0.authenticate(password);
      vm.stopBroadcast();
    }

}