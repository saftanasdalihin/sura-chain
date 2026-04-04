# SuraChain

A simple election smart contract built with Solidity and tested using Foundry. This project demonstrates a basic voting flow where eligible voters can cast a single vote for one of three predefined candidates while the election is open.

## Project Overview

- Contract: `src/SuraChain.sol`
- Test suite: `test/SuraChain.t.sol` and `test/ElectionNotOpen.t.sol`
- Build system: Foundry

## Features

- Election can be opened with a 24-hour deadline
- One vote per address
- Three hard-coded candidates
- Custom errors for invalid operations
- Events emitted for vote casting and election start

## Contract Behavior

`SuraChain` exposes the following public state and actions:

- `NAME`: Constant name of the contract
- `totalVotes`: Total number of votes cast
- `hasVoted`: Tracks whether an address has already voted
- `candidates`: Maps candidate IDs to candidate details
- `electionOpened`: Flag to indicate if voting is open
- `electionDeadline`: Timestamp when voting closes

### Actions

- `openElection()`: Opens the election and sets the deadline to 24 hours from the current block timestamp
- `vote(uint8 candidateId)`: Allows a voter to cast a vote for candidate IDs `1`, `2`, or `3`

### Validation Rules

- Voting is allowed only when the election is open
- Voting after the deadline closes the election and reverts
- Each address may vote only once
- Candidate IDs outside `1`–`3` are rejected

## Running the Project

### Requirements

- Foundry installed: https://book.getfoundry.sh/
- Linux-compatible environment

### Build

```bash
forge build
```

### Run Tests

```bash
forge test
```

The test suite covers:

- initial state verification
- successful voting flow
- prevention of double voting
- invalid candidate handling
- voting while election is not open
- event emission checks

### Formatting

```bash
forge fmt
```

## Repository Layout

- `src/SuraChain.sol` — main contract implementation
- `test/SuraChain.t.sol` — core voting behavior tests
- `test/ElectionNotOpen.t.sol` — election state validation tests
- `foundry.toml` — Foundry project configuration

## Notes

The contract uses fixed candidate addresses and a simple 1-day election window for demonstration purposes. In a production environment, candidate registration, role-based access control, and configurable election parameters should be added.

