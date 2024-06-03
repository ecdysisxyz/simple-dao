// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCScript, MCDevKit} from "@mc/devkit/Flattened.sol";
import {DeployLib} from "./DeployLib.sol";

contract DeployScript is MCScript {
    using DeployLib for MCDevKit;

    function run() public startBroadcastWith("DEPLOYER_PRIV_KEY") {
        mc.deployCounter(1);
    }
}
