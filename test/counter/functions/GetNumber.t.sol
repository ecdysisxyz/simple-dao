// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {GetNumber} from "bundle/counter/functions/GetNumber.sol";
import {Storage} from "bundle/counter/storage/Storage.sol";

contract GetNumberTest is MCTest {
    function setUp() public {
        _use(GetNumber.getNumber.selector, address(new GetNumber()));
    }

    function testFuzz_Success_getNumber(uint256 fuzzNumber) public {
        Storage.CounterState().number = fuzzNumber;
        assertEq(GetNumber(target).getNumber(), fuzzNumber);
    }
}
