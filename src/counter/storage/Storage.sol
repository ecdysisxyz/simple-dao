// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Schema} from "./Schema.sol";

library Storage {
    function CounterState() internal pure returns(Schema.$CounterState storage ref) {
        assembly { ref.slot := 0x9d2213992402928855512c8ba65338877a8da4519b1df3203c2a2647166a8d00 }
    }
}
