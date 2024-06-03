// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Vote {
    function vote(uint256 pid, bool approve) external {
        Schema.Proposal storage proposal = Storage.SimpleDAOState().proposals[pid];
        proposal.totalVoteCount++;
        if (approve) proposal.approvalCount++;
    }
}
