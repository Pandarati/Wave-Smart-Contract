// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint256 highestWaveCount;
    bool newUser = false;

    struct User {
        //Declaring different 
        // structure elements
        address wallet;
        uint56 waveCount;
    }

    mapping (address => User) map;
    address[] public user_result;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        for (uint i=0; i < user_result.length; i++) {
            if (msg.sender == user_result[i]) {
                newUser = true;
            }
        }

        //Adds Waves for specific user
        if (newUser){
            user_result.push(msg.sender);
            map[msg.sender] = User(msg.sender, 1);        
        }
        else {
            map[msg.sender].waveCount += 1;
        }

    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}