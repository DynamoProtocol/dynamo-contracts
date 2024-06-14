// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "../interfaces/IDynamoCore.sol";

/**
    @title Dynamo System Start Time
    @dev Provides a unified `startTime` and `getWeek`, used for emissions.
 */
contract SystemStart {
    uint256 immutable startTime;

    constructor(address dynamoCore) {
        startTime = IDynamoCore(dynamoCore).startTime();
    }

    function getWeek() public view returns (uint256 week) {
        return (block.timestamp - startTime) / 1 weeks;
    }
}
