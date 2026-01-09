<!--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
---

# DEPRECATION NOTICE

This repository is deprecated.
Active development now continues in the [ResilientDB Monorepo](https://github.com/apache/incubator-resilientdb).

The ResVault can be found at [ecosystem/tools/resvault](https://github.com/apache/incubator-resilientdb/tree/master/ecosystem/tools/resvault).

---

<div align="center">
  <br />
  <p>
    <a href="https://resilientdb.com"><img src="https://i.imgur.com/s4089K7.png" width="300" alt="resvault" /></a>
  </p>
  <br />
  <p>
    <a href="https://github.com/ResilientApp/ResVault/releases/"><img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date/ResilientApp/ResVault">
    </a>
    <a href="https://github.com/ResilientApp/ResVault/actions"><img alt="GitHub Workflow Status (with event)" src="https://img.shields.io/github/actions/workflow/status/ResilientApp/ResVault/release.yml">
    </a>
    <a href="https://github.com/ResilientApp/ResVault/commits/main"><img alt="GitHub commit activity (branch)" src="https://img.shields.io/github/commit-activity/ResilientApp/ResVault">
    </a>
    <a href="https://github.com/ResilientApp/ResVault/blob/main/LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/ResilientApp/ResVault">
    </a>
    <a href="https://github.com/ResilientApp/ResVault/releases/"><img alt="GitHub all releases" src="https://img.shields.io/github/downloads/ResilientApp/ResVault/total">
    </a>
    <a href="https://github.com/ResilientApp/ResVault/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues/ResilientApp/ResVault">
    </a>
  </p>
</div>

## About

ResVault is a Chrome extension that serves as a comprehensive wallet for [ResilientDB](https://resilientdb.com). ResilientDB is a High Throughput Yielding Permissioned Blockchain Fabric founded by [ExpoLab](https://expolab.org/) at [UC Davis](https://www.ucdavis.edu/) in 2018. ResilientDB advocates a system-centric design by adopting a multi-threaded architecture that encompasses deep pipelines. Further, ResilientDB separates the ordering of client transactions from their execution, which allows it to process messages out-of-order.

## Features

### Core Wallet Functionality
- **Create Account** - Generate new wallet accounts with secure key management
- **Delete Account** - Remove accounts with proper cleanup
- **Login/Logout** - Secure authentication system
- **Submit Transactions** - Send transactions to ResilientDB network
- **Transaction Logging** - Complete transaction history and audit trail
- **User Profiles** - Manage multiple user identities
- **Multi-account Support** - Handle multiple wallet accounts simultaneously

### Smart Contract Integration (v1.2.0)
- **Contract Deployment** - Deploy Solidity smart contracts directly from the wallet
- **Address Ownership** - Contracts are deployed using your wallet address for proper ownership
- **GraphQL Integration** - Seamless communication with ResilientDB smart contract service
- **Solidity Compilation** - Automatic compilation of Solidity contracts before deployment
- **Enhanced Error Handling** - Improved debugging and error reporting for contract operations
- **Network Flexibility** - Connect to mainnet or your local ResilientDB server

### Security & Performance
- **Secure Key Management** - Ed25519 key pairs with proper encryption
- **Transaction Validation** - Built-in validation for all operations
- **Network Connectivity** - Support for custom ResilientDB network endpoints
- **Real-time Updates** - Live transaction status and balance updates

**Pending Features**:
- [ ] Password improvement
- [ ] Transaction details view
- [ ] View all transactions
- [ ] Contract execution and interaction
- [ ] Contract interaction history
- [ ] Gas estimation and optimization

## Installation
### Via GitHub release
Open [chrome://extensions/](chrome://extensions/) in Google Chrome, toggle Developer mode on:
- Click on Load unpacked
- Select the build folder that you downloaded from the GitHub releases.

### Via Chrome Web Store
**🎉 Now Available on Chrome Web Store!**

[![Chrome Web Store](https://img.shields.io/badge/Chrome%20Web%20Store-Available-green)](https://chromewebstore.google.com/detail/resvault/ejlihnefafcgfajaomeeogdhdhhajamf)

**[Install ResVault from Chrome Web Store](https://chromewebstore.google.com/detail/resvault/ejlihnefafcgfajaomeeogdhdhhajamf)**


## Build
**Check Python Version**

Ensure you’re running Python 3.10 by checking the active Python version inside your virtual environment:
```bash
python --version
```
If it says Python 3.10, great! Please proceed to step 2. If it shows an earlier version (e.g., Python 3.8 or older), you may need to:
**Add the Python 3.10 PPA (Personal Package Archive)**
Open a terminal and add the deadsnakes PPA, which contains newer Python versions:
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
```

Update the package lists:
```bash
sudo apt update
```
Install python 3.10
```bash
sudo apt install python3.10
```
In case you have multiple Python versions installed, Update the python3 symlink to point to Python 3.10 :
```bash
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2
```
The 1 and 2 at the end represent the priority for each version, where a higher number gets higher priority (Python 3.10 in this case).
After running these commands, you can switch between the versions with:
```bash
sudo update-alternatives --config python3
```

**Setup ResilientDB**


You will need to clone the ResilientDB repo to get started:

```bash
git clone https://github.com/resilientdb/resilientdb.git
```

Then navigate inside the ResilientDB directory(if you are in a docker image, first go to home/ubuntu):
```bash
cd resilientdb
```    

Install dependencies:
```bash
sh INSTALL.sh
```    

Run ResilientDB KV Service (this may take a few minutes for the first time):
 ```bash
./service/tools/kv/server_tools/start_kv_service.sh
```

**Setup Crow HTTP server, SDK, and GraphQL server**

You will need to clone the ResilientDB GraphQL repo to get started:
    
```bash
git clone https://github.com/ResilientApp/ResilientDB-GraphQL.git
```
    
Then navigate inside the ResilientDBGraphQL directory:
    
```bash
cd ResilientDB-GraphQL
```
    
Install the Crow dependencies:
    
```bash
sudo apt update && sudo apt install build-essential && sudo apt install python3.10-dev && sudo apt install apt-transport-https curl gnupg
``` 
    
Build Crow HTTP server (this may take a few minutes for the first time):
    
```bash
 bazel build service/http_server:crow_service_main
```
    
- Start the Crow HTTP server:
    
 ```bash
bazel-bin/service/http_server/crow_service_main service/tools/config/interface/client.config service/http_server/server_config.config
```
    
Create virtual environment for the Python SDK:
    
```bash
python3 -m venv venv –without-pip
```
    
Activate the virtual environment:
    
```bash
source venv/bin/activate
```

Install pip in the virtual environment for the Python dependencies:
    
```bash
curl https://bootstrap.pypa.io/get-pip.py | python
```
    
Install the Python dependencies:
    
```bash
pip install -r requirements.txt
```
    
Start the GraphQL server. (The GraphQL is implemented based on our Python SDK. For more information about the Python SDK, please refer to our SDK [blog](https://blog.resilientdb.com/2023/02/01/UsingPythonSDK.html))
    
```bash
python3 app.py
```

**Build chrome extension from source code**

This step is to be done outside the docker image/Ubuntu VM, in your own local system. Because here we will build the chrome extension for ResVault, and Google Chrome can identify the build from the local system, not the VM/Docker. You can generate the wallet build using the ResVault source code. To do this:

Download NodeJS from [here](https://nodejs.org/en/download) and ensure that it’s added to PATH.
Verify installation:
```bash
node -v
npm -v
```
    
Clone the ResVault repo to get started:
    
```java
git clone https://github.com/ResilientApp/ResVault.git
```
    
Then navigate inside the ResVault directory (you should currently be in the resilientdb folder):
    
```bash
cd ResVault
```
    
Install the dependencies.
    
```bash
npm install
```
    
Build the wallet.
    
```bash
npm run build
```
    
You will see the following message if build was successful:
    
  ```
      The build folder is ready to be deployed.
      You may serve it with a static server:
    
      serve -s build
    
      Find out more about deployment here:
    
      https://cra.link/deployment
  ```
    
The build will now be available in `build` directory inside the ResVault directory.


**Add build to chrome**


Once you have generated the build:

- Open chrome and navigate to `chrome://extensions/`
    
- Make sure developer mode is enabled using the toggle button.
    
- Finally, load the extension by clicking on load unpacked button and then select the `build` folder that was created in the previous step.

- Now you can open the wallet from the extension button and start using it!



**Add Release to Chrome**


Alternatively, you can use the release from the ResVault repo instead of generating your own build. To do this:

- Download the latest build.zip from [here](https://github.com/ResilientApp/ResVault/releases).
    
- Extract the contents in a new directory.
    
- Open chrome and navigate to `chrome://extensions/`
    
- Make sure developer mode is enabled using the toggle button.
    
- Finally, load the extension by clicking on load unpacked button and then select the directory where you extracted the contents previously.
    
- Now you can open the wallet from the extension button and start using it!


## Smart Contract Usage

### Deploying Contracts
1. Navigate to the **Contract** tab in ResVault
2. Enter your ResilientDB server URL:
   - **Mainnet**: Use the production ResilientDB endpoint
   - **Local Development**: Use your local server (e.g., `http://localhost:8400`)
   - **Custom Server**: Use any ResilientDB instance (e.g., `http://your-server:8400`)
3. Paste your Solidity contract code
4. Provide constructor arguments if needed
5. Click **Deploy** - the contract will be deployed using your wallet address

## Example Usage
#### Demo Video
Coming Soon

## Links

- [Website](https://resilientdb.com)
- [Chrome Web Store](https://chromewebstore.google.com/detail/resvault/ejlihnefafcgfajaomeeogdhdhhajamf) - Install ResVault
- [GitHub Repository](https://github.com/ResilientApp/ResVault) - Source Code

## Contributing

Before creating an issue, please ensure that it hasn't already been reported/suggested.

The issue tracker is only for bug reports and enhancement suggestions. If you have a question, please reach out to [apratim@expolab.org](apratim@expolab.org) instead of opening an issue – you will get redirected there anyway.

If you wish to contribute to the ResVault codebase or documentation, feel free to fork the repository and submit a pull request.

## Help 

If you don't understand something in the documentation, you are experiencing problems, or you just need a gentle
nudge in the right direction, please don't hesitate to reach out to [apratim@expolab.org](apratim@expolab.org).
