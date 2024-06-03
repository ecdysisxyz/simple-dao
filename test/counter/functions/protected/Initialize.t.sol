// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Initialize} from "bundle/counter/functions/protected/Initialize.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract InitializeTest is MCTest {
    function setUp() public {
        _use(Initialize.initialize.selector, address(new Initialize()));
    }

    function testFuzz_Success_initialize(uint256 fuzzNumber) public {
        Initialize(target).initialize(fuzzNumber);
        assertEq(Storage.CounterState().number, fuzzNumber);
    }
}
