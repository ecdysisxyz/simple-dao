// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Vote} from "bundle/simple-dao/functions/Vote.sol";
import {Storage} from "bundle/simple-dao/storage/Storage.sol";

contract VoteTest is MCTest {
    function setUp() public {
        _use(Vote.vote.selector, address(new Vote()));
    }

    function test_vote_approve_success() public {
        Storage.SimpleDAOState().proposals.push();

        Vote(target).vote(0, true);

        assertEq(Storage.SimpleDAOState().proposals[0].totalVoteCount, 1);
        assertEq(Storage.SimpleDAOState().proposals[0].approvalCount, 1);
    }

    function test_vote_notApprove_success() public {
        Storage.SimpleDAOState().proposals.push();

        Vote(target).vote(0, false);

        assertEq(Storage.SimpleDAOState().proposals[0].totalVoteCount, 1);
        assertEq(Storage.SimpleDAOState().proposals[0].approvalCount, 0);
    }

}
