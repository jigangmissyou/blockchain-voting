// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address => bool) private voters;  // 改为 private，推荐通过 getter 访问
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    event votedEvent(uint indexed candidateId);

    constructor() {
        addCandidate("Alice");
        addCandidate("Bob");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted."); 
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        emit votedEvent(_candidateId);
    }

    function getVoteCount(uint _candidateId) public view returns (uint) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");
        return candidates[_candidateId].voteCount;
    }

    // ✅ 新增：安全返回是否投票，避免直接读取 mapping 报错
    function hasVoted(address _addr) public view returns (bool) {
        return voters[_addr];
    }
}
