# Installation Guide

Welcome to the installation guide for ResilientDB and its associated projects. This guide will help you set up the entire ResilientDB ecosystem on your machine using a custom-generated `INSTALL.sh` script.

---

## 📋  **Prerequisites**

Before you begin, ensure you have the following installed on your system:
**NOTE:** This project requires Ubuntu 20.04+

- **Git:** Version control system to clone repositories.
- **Docker:** For containerized deployment (optional).
- **cURL or Wget:** For downloading scripts.
- **Bash Shell:** To run shell scripts.

---

## 🔧 **Custom Installation Script Generator**

Select the components you want to install, and a custom `INSTALL.sh` script will be generated for you.

<form id="install-form">
  <label><input type="checkbox" name="app" value="resilientdb"> ResilientDB</label><br>
  <label><input type="checkbox" name="app" value="pythonsdk"> PythonSDK</label><br>
  <label><input type="checkbox" name="app" value="resdborm"> ResDBORM</label><br>
  <label><input type="checkbox" name="app" value="smartcontracts-cli"> Smart-Contracts CLI</label><br>
  <label><input type="checkbox" name="app" value="smartcontracts-graphql"> Smart-Contracts GraphQL</label><br>
  <label><input type="checkbox" name="app" value="resvault"> ResVault</label><br>
  <button type="button" onclick="generateScript()" class="generate-button">Generate INSTALL.sh</button>
</form>

<a id="download-link" class="download-button" style="display:none;">Download your custom INSTALL.sh</a>

<style>
  .generate-button {
    background-color: #348269;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
    margin-top: 10px;
  }
  .download-button {
    display: inline-block;
    margin-top: 20px;
    background-color: #2b56f5;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    font-size: 16px;
    border-radius: 4px;
  }
  .download-button:hover, .generate-button:hover {
    background-color: #1e3d99;
  }
</style>

<script>
  const installCommands = {
    resilientdb: `
# Install ResilientDB
echo "Installing ResilientDB..."
git clone https://github.com/apache/incubator-resilientdb.git /opt/incubator-resilientdb
cd /opt/incubator-resilientdb
./INSTALL.sh
./service/tools/kv/server_tools/start_kv_service.sh
bazel build service/tools/kv/api_tools/kv_service_tools
`,
    pythonsdk: `
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
`,
    resdborm: `
# Install ResDBORM
echo "Installing ResDBORM..."
git clone https://github.com/ResilientEcosystem/ResDB-ORM.git /opt/ResDB-ORM
cd /opt/ResDB-ORM
./INSTALL.sh
pip install resdb-orm
`,
    "smartcontracts-cli": `
# Install Smart-Contracts CLI
echo "Installing Smart-Contracts CLI..."
npm install -g rescontract-cli
`,
    "smartcontracts-graphql": `
# Install Smart-Contracts GraphQL
echo "Installing Smart-Contracts GraphQL..."
git clone https://github.com/ResilientEcosystem/smart-contracts-graphql.git /opt/smart-contracts-graphql
cd /opt/smart-contracts-graphql
npm install
`,
    resvault: `
# Install ResVault
echo "Installing ResVault..."
git clone https://github.com/apache/incubator-resilientdb-resvault.git /opt/ResVault
cd /opt/ResVault
npm install
npm run build
`
  };

  function generateScript() {
    const selectedApps = Array.from(document.querySelectorAll('input[name="app"]:checked')).map(cb => cb.value);
    if (selectedApps.length === 0) {
      alert("Please select at least one application to install.");
      return;
    }

    let scriptContent = "#!/bin/bash\n\n# Check for root privileges\nif [ \"$EUID\" -ne 0 ]; then\n  echo \"Please run as root. Try using 'sudo ./INSTALL.sh'\"\n  exit\nfi\n\n";
    scriptContent += "echo \"Updating package lists...\"\napt-get update\n";
    scriptContent += "echo \"Installing dependencies...\"\napt-get install -y git curl build-essential python3 python3-venv python3-pip npm solc\n\n";

    selectedApps.forEach(app => {
      scriptContent += installCommands[app];
    });

    scriptContent += "\necho \"Installation complete. Please refer to the documentation for usage instructions.\"\n";

    const blob = new Blob([scriptContent], { type: "text/plain" });
    const link = document.getElementById("download-link");
    link.href = URL.createObjectURL(blob);
    link.download = "INSTALL.sh";
    link.style.display = "block";
    link.textContent = "Download your custom INSTALL.sh";
  }
</script>

---

## **🚀 Using Each Project After Installation**

Once you've installed the selected projects, check out the Usage Tab for more information:

- [ResilientDB](https://resilientecosystem.github.io/resilientdb-quickstart/usage/resilientdb/)
- [Python SDK](https://resilientecosystem.github.io/resilientdb-quickstart/usage/pythonsdk/)
- [ResDB-ORM](https://resilientecosystem.github.io/resilientdb-quickstart/usage/resdborm/)
- [Smart-Contracts-CLI](https://resilientecosystem.github.io/resilientdb-quickstart/usage/smart-contracts-cli/)
- [Smart-Contracts-GraphQL](https://resilientecosystem.github.io/resilientdb-quickstart/usage/smart-contracts-graphql/)
- [ResVault](https://resilientecosystem.github.io/resilientdb-quickstart/usage/resvault/)
