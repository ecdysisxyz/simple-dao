// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage} from "../storage/Storage.sol";

contract GetNumber {
    function getNumber() external view returns(uint256) {
        return Storage.CounterState().number;
    }
}
