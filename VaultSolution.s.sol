// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Vault.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract VaultSolution is Script {

    Vault public VaultInstance = Vault(0xE1f4446985905670833dea8e09aa3b399469aaC1);

    function run() external {
     
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      VaultInstance.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
      vm.stopBroadcast();
    }

}