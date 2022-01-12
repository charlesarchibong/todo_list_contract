// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TodoList {
    constructor() {
        taskCount = 0;
    }

    struct Task {
        string taskName;
        bool isComplete;
    }

    uint public taskCount;

    mapping(uint => Task) public tasks;

    event TaskCreateEvent(string task, uint taskNumber);

    function create(string memory _taskName) public {
        tasks[taskCount++] = Task(_taskName, false);
        emit TaskCreateEvent(_taskName, taskCount-1);
    }
}
