# Blockchain_CTA

# CertificateRegistry Smart Contract (CTA Activity - 4)

A Solidity-based decentralized certificate issuance and verification smart contract deployed on a local Ethereum blockchain (**Ganache**) using **Remix IDE** and **MetaMask**.

## Overview
`CertificateRegistry` enables an authorized issuer to record tamper-proof academic or course completion certificates on-chain and allows anyone to instantly verify a certificate's authenticity by its unique ID.

## Key Features
* **Authorized Issuer Control (`issuer`):** Captures the deployer's wallet address (`msg.sender`) in the `constructor` and restricts certificate issuance strictly to that address using `require`.
* **Structured On-Chain Storage (`struct` & `mapping`):** Maps each unique certificate ID (`string`) to a `Certificate` record storing `studentName`, `courseName`, `issuedDate` (`block.timestamp`), and `isValid`.
* **Duplicate Prevention (`require`):** Rejects empty IDs or duplicate certificate IDs to protect record integrity.
* **Event Logging (`CertificateIssued`):** Emits an indexed event logging `certId`, `studentName`, `courseName`, and `issuedDate` upon issuance.
* **Gas-Free Verification (`verifyCertificate`):** A `view` function that retrieves full certificate details and validity status without consuming gas.

## Tech Stack & Environment
* **Language:** Solidity (`^0.8.20`, compiled with EVM target `paris`)
* **IDE:** Remix IDE
* **Local Blockchain:** Ganache (`http://127.0.0.1:7545`, Chain ID: `1337`)
* **Wallet Provider:** MetaMask (Injected Provider)

## Deployment & Execution Flow
1. Connected **Remix IDE** to a local **Ganache** Ethereum node via **MetaMask** (`Browser Extension`).
2. Compiled `CertificateRegistry.sol` targeting the `paris` EVM version and deployed the contract (`0x026...d99d9`).
3. Issued a certificate (`"cert101"`, `"varsha"`, `"blockchain"`) via `issueCertificate()` (`block:6`).
4. Verified the on-chain record using `verifyCertificate("cert101")`, confirming `isValid: true`.

## Repository Contents
* `CertificateRegistry.sol` — Solidity smart contract source code
* Screenshots of Remix IDE execution logs and Ganache mined blocks
