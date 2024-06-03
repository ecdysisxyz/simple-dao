# Protected Functions directory
- This directory represents "Protected functions of a bundle."
- A protected function is onlyXXX protected function such as DAO approval or multisig approval.
    - Any arbitrary individual shouldn't be able to run these protected functions.
- You can protect your functions from external contracts. In other words, you can permit sensitive function only for your other bundles.
    - We could say those pseudo-internal call as *onlyMyself*.
- protected function is user-defined special functions. See `src/_utils/ProtectionBase.sol`
