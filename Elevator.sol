// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;
   
   // To reach top of the floor (bool top == true)
    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {   //intial stage to be false to get enter inside this function
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}