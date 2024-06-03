// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Execute {
    function execute(uint256 pid) external {
        if (Storage.SimpleDAOState().proposals[pid].isApproved) {
            Storage.SimpleDAOState().number++;
        }
    }
}
