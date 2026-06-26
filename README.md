# SuraChain 🗳️

**A transparent, on-chain voting protocol** built with Solidity and Foundry.

A censorship-resistant voting system where votes are immutable, verifiable, and tamper-proof—demonstrating how blockchain enables fair governance.

---

## ✨ Features

- **One person, one vote** — address-based voting prevents duplicate votes
- **Time-bound elections** — automatic deadline enforcement with 24-hour windows
- **Custom errors & events** — full transparency and auditability
- **Fully tested** — comprehensive unit tests covering edge cases
- **Gas optimized** — follows security best practices

---

## 🛠️ Tech Stack

- **Solidity** ^0.8.20
- **Foundry** — Forge, Anvil, Cast
- **Linux-compatible environment**

---

## 📋 Contract Overview

### Public State

| Name | Description |
|------|-------------|
| `NAME` | Constant contract identifier |
| `totalVotes` | Total votes cast |
| `hasVoted` | Tracks if an address has voted |
| `candidates` | Maps candidate IDs (1-3) to details |
| `electionOpened` | Voting open flag |
| `electionDeadline` | Voting close timestamp |

### Public Functions

| Function | Parameters | Description |
|----------|-----------|-------------|
| `openElection()` | — | Opens voting, sets 24-hour deadline |
| `vote()` | `uint8 candidateId` | Cast vote for candidate 1, 2, or 3 |

### Validation Rules

✅ Voting allowed only when election is open  
✅ Each address can vote only once  
✅ Only candidate IDs 1–3 are valid  
✅ Voting after deadline automatically closes election  

---

## 🚀 Quick Start

### Prerequisites


# Install Foundry
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Build

```bash
forge build
```

### Run Tests

```bash
forge test -vvv
```

Test coverage includes:
- ✓ Initial state verification
- ✓ Successful voting flow
- ✓ Double voting prevention
- ✓ Invalid candidate rejection
- ✓ Election state validation
- ✓ Event emission verification

### Code Formatting

```bash
forge fmt
```

---

## 📁 Repository Structure

```
sura-chain/
├── src/
│   └── SuraChain.sol              # Main contract
├── test/
│   ├── SuraChain.t.sol            # Core voting tests
│   └── ElectionNotOpen.t.sol      # State validation tests
├── foundry.toml                   # Foundry config
└── README.md                      # This file
```

---

## 📝 Notes

This contract is a **proof-of-concept** demonstrating on-chain voting mechanics with:
- Fixed candidate addresses
- Simple 1-day election window

**Production considerations:**
- Dynamic candidate registration
- Role-based access control (admin management)
- Advanced voting mechanisms (quadratic voting, ranked choice)
- Frontend dApp integration

---

## 🔮 Future Roadmap

- [ ] Dynamic candidate registration
- [ ] Admin role-based access control
- [ ] Quadratic voting support
- [ ] Ranked choice voting
- [ ] Frontend dApp integration
- [ ] Multi-chain deployment

---

## 🤝 Contributing

Feedback and contributions are welcome! Found a bug or have an idea? Open an issue or submit a PR.

---

## 📄 License

This project is open source. Check the LICENSE file for details.

---

**Made with ❤️ for transparent systems** ⭐
