// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./ICounter.sol";

contract CounterFacade is ICounter {
    function initialize(uint256 initialNumber) external {}
    function getNumber() external view returns(uint256) {}
    function increment() external {}
    function setNumber(uint256 newNumber) external {}
}
