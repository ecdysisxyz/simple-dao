// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage} from "../storage/Storage.sol";

contract Increment {
    function increment() external {
        Storage.CounterState().number++;
    }
}
