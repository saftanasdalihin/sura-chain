// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SuraChain.sol";

contract SuraChainTest is Test {
    SuraChain public suraChain;

    address voter1 = address(0x1);
    address voter2 = address(0x2);

    function setUp() public {
        suraChain = new SuraChain();
    }

    // --- Test Initial State ---
    function testInitialState() public view {
        assertEq(suraChain.NAME(), "SuraChain");
        assertEq(suraChain.totalVotes(), 0);
    }

    // --- Test Voting: Success ---
    function testVoteSuccess() public {
        vm.prank(voter1);
        suraChain.vote(1);

        assertEq(suraChain.totalVotes(), 1);
        assertEq(suraChain.hasVoted(voter1), true);
        (, , uint16 votes) = suraChain.candidates(1);
        assertEq(votes, 1);
    }

    // --- Test Voting: Already Voted ---
    function testVoteAlreadyVoted() public {
        vm.prank(voter1);
        suraChain.vote(1);

        vm.expectRevert(AlreadyVoted.selector);
        vm.prank(voter1);
        suraChain.vote(2);
    }

    // --- Test Voting: Invalid Candidate ---
    function testVoteInvalidCandidate() public {
        vm.prank(voter2);
        vm.expectRevert(InvalidCandidate.selector);
        suraChain.vote(0); // Invalid candidate ID
    }

    // --- Test Event: Ensure VoteCast is emitted ---
    function testVoteEvent() public {
        vm.expectEmit(true, true, false, false);
        emit SuraChain.VoteCast(voter1, 1);

        vm.prank(voter1);
        suraChain.vote(1);
    }
}