// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCDevKit} from "@mc/devkit/Flattened.sol";
// Bundle interface
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";
// Functions
import {Initialize} from "bundle/counter/functions/protected/Initialize.sol";
import {GetNumber} from "bundle/counter/functions/GetNumber.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";

library DeployLib {
    function bundleName() internal returns(string memory) {
        return "Counter";
    }

    function deployCounter(MCDevKit storage mc, uint256 initialNumber) internal returns(MCDevKit storage) {
        mc.init(bundleName());
        mc.use("Initialize", Initialize.initialize.selector, address(new Initialize()));
        mc.use("GetNumber", GetNumber.getNumber.selector, address(new GetNumber()));
        mc.use("Increment", Increment.increment.selector, address(new Increment()));
        mc.use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()));
        mc.useFacade(address(new CounterFacade()));
        mc.deploy(abi.encodeCall(Initialize.initialize, initialNumber));
        return mc;
    }
}
