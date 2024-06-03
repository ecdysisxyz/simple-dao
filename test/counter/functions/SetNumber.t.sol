// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract SetNumberTest is MCTest {
    function setUp() public {
        _use(SetNumber.setNumber.selector, address(new SetNumber()));
    }

    function testFuzz_Success_setNumber(uint256 fuzzNumber) public {
        SetNumber(target).setNumber(fuzzNumber);
        assertEq(Storage.CounterState().number, fuzzNumber);
    }
}
