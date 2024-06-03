// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {stdError} from "forge-std/StdError.sol";

import {Storage} from "bundle/counter/storage/Storage.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";
import {Initialize} from "bundle/counter/functions/protected/Initialize.sol";
import {GetNumber} from "bundle/counter/functions/GetNumber.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";

contract CounterTest is MCTest {
    ICounter public counter = ICounter(target);

    function setUp() public {
        _use(Initialize.initialize.selector, address(new Initialize()));
        _use(GetNumber.getNumber.selector, address(new GetNumber()));
        _use(Increment.increment.selector, address(new Increment()));
        _use(SetNumber.setNumber.selector, address(new SetNumber()));
    }

    function test_Success(uint256 fuzzInitialNumber, uint256 fuzzNumber) public {
        counter.initialize(fuzzInitialNumber);
        assertEq(Storage.CounterState().number, fuzzInitialNumber);
        assertEq(counter.getNumber(), fuzzInitialNumber);

        counter.setNumber(fuzzNumber);
        assertEq(Storage.CounterState().number, fuzzNumber);
        assertEq(counter.getNumber(), fuzzNumber);

        vm.assume(fuzzNumber != type(uint256).max);
        counter.increment();
        assertEq(Storage.CounterState().number, fuzzNumber + 1);
    }

    function test_increment_Revert_Overflow() public {
        Storage.CounterState().number = type(uint256).max;
        vm.expectRevert(stdError.arithmeticError);
        counter.increment();

    }

}
