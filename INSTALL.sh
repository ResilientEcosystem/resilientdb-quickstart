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
./service/tools/kv/server_tools/start_kv_service.sh
bazel build service/tools/kv/api_tools/kv_service_tools

# Install PythonSDK
echo "Installing PythonSDK..."
git clone https://github.com/apache/incubator-resilientdb-python-sdk.git /opt/incubator-resilientdb-python-sdk
cd /opt/incubator-resilientdb-python-sdk
sh ./INSTALL.sh
python3.10 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
bazel build service/http_server/crow_service_main
bazel-bin/service/http_server/crow_service_main service/tools/config/interface/client.config service/http_server/server_config.config
deactivate

# Install ResDBORM
echo "Installing ResDBORM..."
git clone https://github.com/ResilientEcosystem/ResDB-ORM.git /opt/ResDB-ORM
cd /opt/ResDB-ORM
./INSTALL.sh
pip install resdb-orm

# Install Smart-Contracts CLI
echo "Installing Smart-Contracts CLI..."
npm install -g rescontract-cli

# Install Smart-Contracts GraphQL
echo "Installing Smart-Contracts GraphQL..."
git clone https://github.com/ResilientEcosystem/smart-contracts-graphql.git /opt/smart-contracts-graphql
cd /opt/smart-contracts-graphql
npm install

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
