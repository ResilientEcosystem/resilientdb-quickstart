#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root. Try using 'sudo ./INSTALL.sh'"
  exit
fi

echo "Updating package lists..."
apt-get update

echo "Installing dependencies..."
apt-get install -y git curl build-essential python3 python3-venv python3-pip npm solc

# Install ResilientDB
echo "Installing ResilientDB..."
git clone https://github.com/apache/incubator-resilientdb.git /opt/incubator-resilientdb
cd /opt/incubator-resilientdb
./INSTALL.sh

# Install PythonSDK
echo "Installing PythonSDK..."
git clone https://github.com/apache/incubator-resilientdb-python-sdk.git /opt/incubator-resilientdb-python-sdk
cd /opt/incubator-resilientdb-python-sdk
./INSTALL.sh

# Install ResDBORM
echo "Installing ResDBORM..."
git clone https://github.com/ResilientEcosystem/ResDB-ORM.git /opt/ResDB-ORM
cd /opt/ResDB-ORM
./INSTALL.sh

# Install Smart-Contracts CLI
echo "Installing Smart-Contracts CLI..."
npm install -g rescontract-cli

# Install Smart-Contracts GraphQL
echo "Installing Smart-Contracts GraphQL..."
git clone https://github.com/ResilientEcosystem/smart-contracts-graphql.git /opt/smart-contracts-graphql
cd /opt/smart-contracts-graphql
./INSTALL.sh

# Install ResVault
echo "Installing ResVault..."
git clone https://github.com/apache/incubator-resilientdb-resvault.git /opt/ResVault
cd /opt/ResVault
npm install
npm run build

# Copy configuration files
echo "Copying configuration files..."
mkdir -p /etc/resilientdb

echo "Installation complete. Please refer to the documentation for usage instructions."
