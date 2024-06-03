// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Schema} from "./Schema.sol";

library Storage {
    function SimpleDAOState() internal pure returns(Schema.$SimpleDAOState storage ref) {
        assembly { ref.slot := 0x74d4bb8be4706cf27fee86a2a1b66fece73fab313c033f84b2823de0fc4d8700 }
    }
}
