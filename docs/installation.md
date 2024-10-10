
# Installation Guide

Welcome to the installation guide for ResilientDB and its associated projects. This guide will help you set up the entire ResilientDB ecosystem on your machine using the `INSTALL.sh` script.

---

## 📋  **Prerequisites**

Before you begin, ensure you have the following installed on your system:
**NOTE:** This project requires Ubuntu 20.04+

- **Git:** Version control system to clone repositories.
- **Docker:** For containerized deployment (optional).
- **cURL or Wget:** For downloading scripts.
- **Bash Shell:** To run shell scripts.

---

## 🔧  **Running the `INSTALL.sh` Script**

The `INSTALL.sh` script automates the installation of all ResilientDB projects. Follow the steps below to get started.

### **Step 1: Clone the ResilientDB Quickstart Repository**

```bash
git clone https://github.com/ResilientEcosystem/resilientdb-quickstart.git
cd resilientdb-quickstart
```

### **Step 2: Make the Script Executable**

```bash
chmod +x INSTALL.sh
```

### **Step 3:  Run the INSTALL.sh script**

```bash
./INSTALL.sh
```
_Note: You may need to run the script with_ _sudo_ _privileges if prompted._

## What does the INSTALL.sh script do?

The script will:

1. **Install ResilientDB Core:**

	•  Clones the ResilientDB repository.

	•  Compiles the source code.

	•  Sets up necessary environment variables.

2. **Install PythonSDK:**

	•  Clones the PythonSDK repository.

	•  Installs required Python packages.

	•  Sets up the SDK for use in your projects.

3. **Install ResDBORM:**

	•  Clones the ResDBORM repository.

	•  Installs dependencies.

	•  Configures the ORM for database interactions.

4. **Install Smart-Contracts CLI:**

	•  Clones the Smart-Contracts CLI repository.

	•  Installs Node.js packages.

	•  Sets up the CLI tool globally.

5. **Install Smart-Contracts GraphQL Server:**

	•  Clones the GraphQL server repository.

	•  Installs dependencies.

	•  Starts the server.

6. **Install ResVault:**

	•  Clones the ResVault repository.

	•  Configures secure key storage.

## **🚀 Using Each Project After Installation**

Check out the Usage Tab for more information:

- [ResilientDB](https://resilientecosystem.github.io/resilientdb-quickstart/usage/resilientdb/)
- [Python SDK](https://resilientecosystem.github.io/resilientdb-quickstart/usage/pythonsdk/)
- [ResDB-ORM](https://resilientecosystem.github.io/resilientdb-quickstart/usage/resdborm/)
- [Smart-Contracts-CLI](https://resilientecosystem.github.io/resilientdb-quickstart/usage/smart-contracts-cli/)
- [Smart-Contracts-GraphQL](https://resilientecosystem.github.io/resilientdb-quickstart/usage/smart-contracts-graphql/)
- [ResVault](https://resilientecosystem.github.io/resilientdb-quickstart/usage/resvault/)



