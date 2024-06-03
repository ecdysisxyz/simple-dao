// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract SimpleDAOFacade {
    function propose() external returns(uint256 pid) {}
    function vote(uint256 pid, bool approve) external {}
    function tally(uint256 pid) external {}
    function execute(uint256 pid) external {}
}
