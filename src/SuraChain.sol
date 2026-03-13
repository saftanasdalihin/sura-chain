// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Custom error
error AlreadyVoted();
error InvalidCandidate();
error ElectionNotOpen();

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
    uint256 public electionDeadline;
    bool public electionOpened;

    // --- Constructor ---
    constructor() {
        // Initialize candidates
        candidates[1] = Candidate({
            candidateId: 1,
            candidateAddress: address(0x111),
            votesReceived: 0
        });
        candidates[2] = Candidate({
            candidateId: 2,
            candidateAddress: address(0x222),
            votesReceived: 0
        });
        candidates[3] = Candidate({
            candidateId: 3,
            candidateAddress: address(0x333),
            votesReceived: 0
        });
    }

    // --- Events ---
    event VoteCast(address indexed voter, uint8 indexed candidateId);
    event ElectionStarted(uint256 timestamp);

    // --- Functions ---

    function openElection() public {
        electionOpened = true;
        electionDeadline = block.timestamp + 1 days; // Election lasts for 1 day
        emit ElectionStarted(block.timestamp);
    }

    function vote(uint8 candidateId) public {
        if (!electionOpened) revert ElectionNotOpen();
        if (block.timestamp > electionDeadline) {
            electionOpened = false; // Close election after deadline
            revert ElectionNotOpen();
        }
        if (hasVoted[msg.sender]) revert AlreadyVoted();
        if (candidateId == 0 || candidateId > 3) revert InvalidCandidate();

        hasVoted[msg.sender] = true;
        candidates[candidateId].votesReceived++;
        totalVotes++;
        emit VoteCast(msg.sender, candidateId);
    }
}
