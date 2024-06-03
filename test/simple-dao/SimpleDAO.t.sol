// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {stdError} from "forge-std/StdError.sol";

import {Storage} from "bundle/simple-dao/storage/Storage.sol";
import {SimpleDAOFacade} from "bundle/simple-dao/interfaces/SimpleDAOFacade.sol";
import {Propose} from "bundle/simple-dao/functions/Propose.sol";
import {Vote} from "bundle/simple-dao/functions/Vote.sol";
import {Tally} from "bundle/simple-dao/functions/Tally.sol";
import {Execute} from "bundle/simple-dao/functions/Execute.sol";

contract SimpleDAOTest is MCTest {
    SimpleDAOFacade public simpleDAO = SimpleDAOFacade(target);

    function setUp() public {
        _use(Propose.propose.selector, address(new Propose()));
        _use(Vote.vote.selector, address(new Vote()));
        _use(Tally.tally.selector, address(new Tally()));
        _use(Execute.execute.selector, address(new Execute()));
    }

    function test_success_scenario() public {
        uint256 _pid = simpleDAO.propose();
        assertEq(_pid, 0);

        simpleDAO.vote(_pid, true);
        simpleDAO.tally(_pid);
        simpleDAO.execute(_pid);

        assertEq(Storage.SimpleDAOState().number, 1);
    }

}
