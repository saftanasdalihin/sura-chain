// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {SuraChain, ElectionNotOpen} from "../src/SuraChain.sol";

contract ElectionNotOpenedTest is Test {
    SuraChain public suraChain;

    address voter1 = address(0x1);

    function setUp() public {
        suraChain = new SuraChain();
        // Note: We do NOT open the election here to test the revert case.
    }

    // --- Test Voting: Election Not Opened ---
    function testVoteElectionNotOpened() public {
        vm.prank(voter1);
        vm.expectRevert(ElectionNotOpen.selector);
        suraChain.vote(1);
    }
}
