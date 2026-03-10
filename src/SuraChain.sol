// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Custom error
error AlreadyVoted();
error InvalidCandidate();

contract SuraChain {
    // --- Structs ---
    struct Candidate {
        uint8 id;
        address candidateAddress;
        uint16 votesReceived;
    }

    // --- State Variables ---
    string public constant NAME = "SuraChain";
    uint16 public totalVotes;
    mapping(address => bool) public hasVoted;
    mapping(uint8 => Candidate) public candidates;

}
