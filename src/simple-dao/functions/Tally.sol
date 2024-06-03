// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Tally {
    function tally(uint256 pid) external {
        Schema.Proposal storage proposal = Storage.SimpleDAOState().proposals[pid];
        if (proposal.approvalCount > proposal.totalVoteCount / 2) proposal.isApproved = true;
    }
}
