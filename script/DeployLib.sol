// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCDevKit} from "@mc/devkit/Flattened.sol";
// Bundle interface
import {SimpleDAOFacade} from "bundle/simple-dao/interfaces/SimpleDAOFacade.sol";
// Functions
import {Propose} from "bundle/simple-dao/functions/Propose.sol";
import {Vote} from "bundle/simple-dao/functions/Vote.sol";
import {Tally} from "bundle/simple-dao/functions/Tally.sol";
import {Execute} from "bundle/simple-dao/functions/Execute.sol";

library DeployLib {
    function bundleName() internal returns(string memory) {
        return "SimpleDAO";
    }

    function deploySimpleDAO(MCDevKit storage mc) internal returns(MCDevKit storage) {
        mc.init(bundleName());
        mc.use("Propose", Propose.propose.selector, address(new Propose()));
        mc.use("Vote", Vote.vote.selector, address(new Vote()));
        mc.use("Tally", Tally.tally.selector, address(new Tally()));
        mc.use("Execute", Execute.execute.selector, address(new Execute()));
        mc.useFacade(address(new SimpleDAOFacade()));
        mc.deploy();
        return mc;
    }
}
