# 🗳 Web3 Voting Smart Contract

A simple and secure blockchain-based voting smart contract written in Solidity. This contract is perfect for learning purposes, small community polls, or as a foundation for Web3 dApp integrations.

## 📌 Overview

This contract allows participants to vote for one of the predefined candidates (**Alice** or **Bob**). Each address can vote only once, and the votes are publicly countable on the blockchain.

Built with Solidity `^0.8.0`, it demonstrates core concepts of smart contracts including:

- Data structures (structs, mappings)
- Access control and validation
- Events for interaction with front-end dApps
- Gas-efficient voting mechanism

---

## 🚀 Features

- 🧾 Two default candidates: `Alice` and `Bob`
- ✅ One vote per address (vote tracking)
- 🔐 Secure and transparent
- 📊 Public access to vote results
- 📡 Emits `votedEvent` on every vote (for dApp frontend sync)

---

## 📄 Contract Details

### 🔧 Constructor

```solidity
constructor() {
    addCandidate("Alice");
    addCandidate("Bob");
}
