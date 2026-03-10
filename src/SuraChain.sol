// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Custom error
error AlreadyVoted();
error InvalidCandidate();

contract SuraChain {
    // --- State Variables ---
    string public constant NAME = "SuraChain";
    uint16 public totalVotes;
    mapping(address => bool) public isCandidate;
    mapping(address => bool) public hasVoted;
    mapping(address => uint16) public votesReceived;


}
