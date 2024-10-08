# fetch_readmes.sh
#!/bin/bash

declare -A repos=(
  ["resilientdb"]="https://raw.githubusercontent.com/apache/incubator-resilientdb/refs/heads/master/README.md"
  ["pythonsdk"]="https://raw.githubusercontent.com/apache/incubator-resilientdb-python-sdk/refs/heads/master/README.md"
  ["resdborm"]="https://raw.githubusercontent.com/ResilientEcosystem/ResDB-ORM/refs/heads/main/README.md"
  ["smart-contracts-cli"]="https://raw.githubusercontent.com/ResilientEcosystem/ResContract/refs/heads/main/README.md"
  ["smart-contracts-graphql"]="https://raw.githubusercontent.com/ResilientEcosystem/smart-contracts-graphql/refs/heads/main/README.md"
  ["resvault"]="https://raw.githubusercontent.com/apache/incubator-resilientdb-resvault/refs/heads/master/README.md"
)

mkdir -p docs/usage

for repo in "${!repos[@]}"; do
  echo "Fetching ${repo} README..."
  curl -s "${repos[$repo]}" -o "docs/usage/${repo}.md"
done
