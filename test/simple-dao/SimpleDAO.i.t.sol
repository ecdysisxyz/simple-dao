// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest, MCDevKit} from "@mc/devkit/Flattened.sol";
import {DeployLib} from "../../script/DeployLib.sol";

import {Storage} from "bundle/simple-dao/storage/Storage.sol";
import {SimpleDAOFacade} from "bundle/simple-dao/interfaces/SimpleDAOFacade.sol";

contract SimpleDAOIntegrationTest is MCTest {
    using DeployLib for MCDevKit;
    SimpleDAOFacade public simpleDAO;

    function setUp() public {
        simpleDAO = SimpleDAOFacade(mc.deploySimpleDAO().toProxyAddress());
    }

    function test_success_scenario() public {
        uint256 _pid = simpleDAO.propose();
        assertEq(_pid, 0);

        simpleDAO.vote(_pid, true);
        simpleDAO.tally(_pid);
        simpleDAO.execute(_pid);

        assertEq(
            vm.load(address(simpleDAO), 0x74d4bb8be4706cf27fee86a2a1b66fece73fab313c033f84b2823de0fc4d8700),
            bytes32(uint256(1))
        );
    }

}
