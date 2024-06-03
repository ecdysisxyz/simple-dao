// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract IncrementTest is MCTest {
    function setUp() public {
        _use(Increment.increment.selector, address(new Increment()));
    }

    function testFuzz_Success_increment(uint256 fuzzNumber) public {
        vm.assume(fuzzNumber != type(uint256).max);
        Storage.CounterState().number = fuzzNumber;
        Increment(target).increment();
        assertEq(Storage.CounterState().number, fuzzNumber + 1);
    }
}
