// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Propose {
    function propose() external returns(uint256 pid) {
        Schema.Proposal[] storage proposals = Storage.SimpleDAOState().proposals;
        pid = proposals.length;
        proposals.push();
    }
}
