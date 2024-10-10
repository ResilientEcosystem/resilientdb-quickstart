
# API Reference

Welcome to the **Smart Contracts GraphQL API Reference**. This document provides detailed information about the available API calls, their parameters, and usage examples to help you interact with smart contracts in the ResilientDB ecosystem.

---

## **Overview**

The Smart Contracts GraphQL API allows you to perform the following operations:

- **Create a new account**
- **Compile a smart contract**
- **Deploy a smart contract**
- **Execute a function on a deployed smart contract**

**Endpoint URL:** `http://localhost:4000/graphql`

---

## **Table of Contents**

- [Mutations](#mutations)
  - [createAccount](#createaccount)
  - [compileContract](#compilecontract)
  - [deployContract](#deploycontract)
  - [executeContract](#executecontract)
- [Sample Usage](#sample-usage)
- [Support](#support)

---

## **Mutations**

### **createAccount**

Creates a new blockchain account.

- **Type:** Mutation
- **Arguments:**
	* `config` (String!): Path to the configuration file.
- **Returns:** The address of the newly created account.

**Definition:**

```graphql
mutation createAccount($config: String!) {
  createAccount(config: $config): String
}
```
**Example:**
```graphql
mutation {
  createAccount(config: "../path/to/service.config")
}
```
**Sample Response**
```json
{
  "data": {
    "createAccount": "0x3b706424119e09dcaad4acf21b10af3b33cde350"
  }
}
```
---
### **compileContract**

Compiles a smart contract from a source file.

•  **Type:** Mutation

•  **Arguments:**
* `sourcePath` (String!): Path to the smart contract source file (e.g., .sol file).
* `outputPath` (String!): Path to save the compiled contract output.

•  **Returns:** A success message or an error message.

**Definition:**

```graphql
mutation compileContract($sourcePath: String!, $outputPath: String!) {
  compileContract(sourcePath: $sourcePath, outputPath: $outputPath): String
}
```
**Example:**
```graphql
mutation {
  compileContract(
    sourcePath: "/path/to/Token.sol",
    outputPath: "TokenCompiled.json"
  )
}
```
**Sample Response**
```json
{
  "data": {
    "compileContract": "Compiled successfully to TokenCompiled.json"
  }
}
```

---
### **deployContract**

Deploys a compiled smart contract to the blockchain.

•  **Type:** Mutation

•  **Arguments:**

* `config` (String!): Path to the configuration file.

*  `contract` (String!): Path to the compiled contract JSON file.

*  `name` (String!): Full name of the contract (e.g., Token.sol:Token).

*  `arguments` (String): Constructor arguments for the contract (comma-separated).

*  `owner` (String!): Address of the owner deploying the contract.

•  **Returns:** Details of the deployed contract.

**Definition:**

```graphql
mutation deployContract(
  $config: String!,
  $contract: String!,
  $name: String!,
  $arguments: String,
  $owner: String!
) {
  deployContract(
    config: $config,
    contract: $contract,
    name: $name,
    arguments: $arguments,
    owner: $owner
  ): String
}
```
**Example:**
```graphql
mutation {
  deployContract(
    config: "../path/to/service.config",
    contract: "TokenCompiled.json",
    name: "Token.sol:Token",
    arguments: "1000",
    owner: "0x3b706424119e09dcaad4acf21b10af3b33cde350"
  )
}
```
**Sample Response**
```json
{
  "data": {
    "deployContract": "owner_address: \"0x3b706424119e09dcaad4acf21b10af3b33cde350\"\ncontract_address: \"0xc975ab41e0c2042a0229925a2f4f544747fd66cd\"\ncontract_name: \"Token.sol:Token\""
  }
}
```
---
### **executeContract**

Executes a function on a deployed smart contract.

•  **Type:** Mutation

•  **Arguments:**

*  `config` (String!): Path to the configuration file.

*  `sender` (String!): Address of the sender invoking the function.

*  `contract` (String!): Address of the deployed contract.

*  `functionName` (String!): Name of the function to execute (including parameter types, e.g., transfer(address,uint256)).

*  `arguments` (String): Arguments for the function (comma-separated).

•  **Returns:** Result of the function execution.


**Definition:**

```graphql
mutation executeContract(
  $config: String!,
  $sender: String!,
  $contract: String!,
  $functionName: String!,
  $arguments: String
) {
  executeContract(
    config: $config,
    sender: $sender,
    contract: $contract,
    functionName: $functionName,
    arguments: $arguments
  ): String
}
```
**Example:**
```graphql
mutation {
  executeContract(
    config: "../path/to/service.config",
    sender: "0x3b706424119e09dcaad4acf21b10af3b33cde350",
    contract: "0xc975ab41e0c2042a0229925a2f4f544747fd66cd",
    functionName: "transfer(address,uint256)",
    arguments: "0x4847155cbb6f2219ba9b7df50be11a1c7f23f829,100"
  )
}
```
**Sample Response**
```json
{
  "data": {
    "executeContract": "Function executed successfully."
  }
}
```
