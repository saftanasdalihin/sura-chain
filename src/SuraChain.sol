// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Custom error
error AlreadyVoted();
error InvalidCandidate();

contract SuraChain {
    // --- Structs ---
    struct Candidate {
        uint8 candidateId;
        address candidateAddress;
        uint16 votesReceived;
    }

    // --- State Variables ---
    string public constant NAME = "SuraChain";
    uint16 public totalVotes;
    mapping(address => bool) public hasVoted;
    mapping(uint8 => Candidate) public candidates;

    // --- Constructor ---
    constructor() {
        // Initialize candidates
        candidates[1] = Candidate(1, address(0x111), 0);
        candidates[2] = Candidate(2, address(0x222), 0);
        candidates[3] = Candidate(3, address(0x333), 0);
    }

    // --- Events ---
    event VoteCast(address indexed voter, uint8 indexed candidateId);

    // --- Functions ---
    function vote(uint8 candidateId) public {
        if (hasVoted[msg.sender]) {
            revert AlreadyVoted();
        }
        if (candidateId == 0 || candidateId > 3) {
            revert InvalidCandidate();
        }
        hasVoted[msg.sender] = true;
        candidates[candidateId].votesReceived++;
        totalVotes++;
        emit VoteCast(msg.sender, candidateId);
    }
}
