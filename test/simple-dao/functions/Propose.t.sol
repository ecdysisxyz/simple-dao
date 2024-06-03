// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Propose} from "bundle/simple-dao/functions/Propose.sol";
import {Storage, Schema} from "bundle/simple-dao/storage/Storage.sol";

contract ProposeTest is MCTest {
    function setUp() public {
        _use(Propose.propose.selector, address(new Propose()));
    }

    function test_propose_success() public {
        assertEq(Storage.SimpleDAOState().proposals.length, 0);

        Propose(target).propose();

        assertEq(Storage.SimpleDAOState().proposals.length, 1);

        Schema.Proposal memory proposal = Storage.SimpleDAOState().proposals[0];
        assertEq(proposal.totalVoteCount, 0);
        assertEq(proposal.approvalCount, 0);
        assertEq(proposal.isApproved, false);

        assertEq(Storage.SimpleDAOState().number, 0);
    }

    function test_propose_multiple() public {
        for (uint i; i < 5; ++i) {
            uint256 _pid = Propose(target).propose();
            assertEq(_pid, i);
            assertEq(Storage.SimpleDAOState().proposals.length, i + 1);
        }
    }
}
