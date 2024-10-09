#!/bin/bash

# Define an associative array of filenames and their corresponding URLs
declare -A files=(
  ["resilientdb.md"]="https://raw.githubusercontent.com/apache/incubator-resilientdb/master/README.md"
  ["pythonsdk.md"]="https://raw.githubusercontent.com/apache/incubator-resilientdb-python-sdk/master/README.md"
  ["resdborm.md"]="https://raw.githubusercontent.com/ResilientEcosystem/ResDB-ORM/main/README.md"
  ["smart-contracts-cli.md"]="https://raw.githubusercontent.com/ResilientEcosystem/ResContract/main/README.md"
  ["smart-contracts-graphql.md"]="https://raw.githubusercontent.com/ResilientEcosystem/smart-contracts-graphql/main/README.md"
  ["resvault.md"]="https://raw.githubusercontent.com/apache/incubator-resilientdb-resvault/master/README.md"
)

# Create the docs/usage directory if it doesn't exist
mkdir -p docs/usage

# Fetch each file
for file in "${!files[@]}"; do
  url="${files[$file]}"
  output="docs/usage/$file"
  echo "Fetching $url..."
  curl -sSL "$url" -o "$output"
done

echo "All files fetched successfully."
