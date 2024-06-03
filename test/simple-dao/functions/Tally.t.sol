// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Tally} from "bundle/simple-dao/functions/Tally.sol";
import {Storage, Schema} from "bundle/simple-dao/storage/Storage.sol";

contract TallyTest is MCTest {
    function setUp() public {
        _use(Tally.tally.selector, address(new Tally()));
    }

    function test_tally_success(uint256 totalVoteCount, uint256 approvalCount) public {
        vm.assume(totalVoteCount / 2 < approvalCount);
        Storage.SimpleDAOState().proposals.push(Schema.Proposal({
            totalVoteCount: totalVoteCount,
            approvalCount: approvalCount,
            isApproved: false
        }));

        Tally(target).tally(0);

        assertTrue(Storage.SimpleDAOState().proposals[0].isApproved);
    }

    function test_tally_fail(uint256 totalVoteCount, uint256 approvalCount) public {
        vm.assume(totalVoteCount / 2 >= approvalCount);
        Storage.SimpleDAOState().proposals.push(Schema.Proposal({
            totalVoteCount: totalVoteCount,
            approvalCount: approvalCount,
            isApproved: false
        }));

        Tally(target).tally(0);

        assertFalse(Storage.SimpleDAOState().proposals[0].isApproved);
    }

}
