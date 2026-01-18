// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/MyToken.sol";

contract DeployMyTokenScript is Script {
    function run() external {
        vm.startBroadcast();

        MyToken token = new MyToken(1_000_000);

        console.log("MyToken deployed at:", address(token));

        vm.stopBroadcast();
    }
}

