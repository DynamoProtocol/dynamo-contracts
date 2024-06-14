// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "../interfaces/IDynamoCore.sol";

/**
    @title Dynamo Ownable
    @notice Contracts inheriting `DynamoOwnable` have the same owner as `DynamoCore`.
            The ownership cannot be independently modified or renounced.
 */
contract DynamoOwnable {
    IDynamoCore public immutable DYNAMO_CORE;

    constructor(address _dynamoCore) {
        DYNAMO_CORE = IDynamoCore(_dynamoCore);
    }

    modifier onlyOwner() {
        require(msg.sender == DYNAMO_CORE.owner(), "Only owner");
        _;
    }

    function owner() public view returns (address) {
        return DYNAMO_CORE.owner();
    }

    function guardian() public view returns (address) {
        return DYNAMO_CORE.guardian();
    }
}
