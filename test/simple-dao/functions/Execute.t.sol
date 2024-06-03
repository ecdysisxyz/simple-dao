// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Execute} from "bundle/simple-dao/functions/Execute.sol";
import {Storage, Schema} from "bundle/simple-dao/storage/Storage.sol";

contract ExecuteTest is MCTest {
    function setUp() public {
        _use(Execute.execute.selector, address(new Execute()));
    }

    function test_execute_success() public {
        Storage.SimpleDAOState().proposals.push(Schema.Proposal({
            totalVoteCount: 0,
            approvalCount: 0,
            isApproved: true
        }));

        Execute(target).execute(0);

        assertEq(Storage.SimpleDAOState().number, 1);
    }

    function test_execute_fail() public {
        Storage.SimpleDAOState().proposals.push(Schema.Proposal({
            totalVoteCount: 0,
            approvalCount: 0,
            isApproved: false
        }));

        Execute(target).execute(0);

        assertEq(Storage.SimpleDAOState().number, 0);
    }

}
