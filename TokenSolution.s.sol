// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Token.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TokenSolution is Script {   

    Token public tokenInstance = Token(0x9DECdb35Bde9e7CFFD460325ED579Ac5B2154467);

    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      tokenInstance.transfer(address(0), 21);
      console.log("My Balance:", tokenInstance.balanceOf(vm.envAddress("MY_ADDRESS")));

      vm.stopBroadcast();
    }

}