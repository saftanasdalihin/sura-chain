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
