# Changelog

## Apache ResilientDB v1.10.0-incubating - 2024-07-30T17:53:27Z

### Apache ResilientDB v1.10.0-incubation ([2024-7-11](https://github.com/apache/incubator-resilientdb/releases/tag/v1.10.0-rc03))

Add the prototype of PoE. ([Junchao Chen](https://github.com/cjcchen))

* Implement the base version of the [Proof-of-Execution (PoE) Consensus Protocol [EDBT 2011]](https://openproceedings.org/2021/conf/edbt/p111.pdf).

Add ResView Data Collection and APIs ([Saipranav-Kotamreddy](https://github.com/Saipranav-Kotamreddy))

* Consensus data such as PBFT messages and states is now collected and stored
* Added APIs to query consensus data and progress of replicas
* Added APIs to trigger faultiness and test view change

## NexRes v1.9.0 - 2023-11-30T05:43:44Z

Support Multi-version Key-Value Interface. ([Junchao Chen](https://github.com/cjcchen))

* Get and Set need to provide a version number to fetch the correct version of the data (if exists) or write to the correct version of data (if not overwritten already), respectively.
* Provide interfaces to obtain historical data with a specific version or a range of versions.

## NexRes v1.8.0 - 2023-08-22T07:59:00Z

The view-change recovery protocol was extensively expanded to support the following Byzantine failures through primary/leader replacement and replica recovery. ([Dakai Kang](https://github.com/DakaiKang))

* Byzantine primary becomes non-responsive, stopping proposing any new Pre-Prepare messages.
* Byzantine primary equivocates, proposing two different client requests to two subsets of replicas.
* Byzantine replicas try to keep some non-faulty replicas in the dark.
* Byzantine new primary becomes non-responsive, refusing to broadcast New-View messages.

## NexRes v1.7.0 - 2023-08-05T16:28:32Z

For each replica local recovery from durable storage upon system restart was added.

## NexRes v1.6.0 - 2023-05-31T18:52:38Z

Refactoring and enhancement of the codebase to highlight the entire software stack of ResilientDB consisting of the following layers

- SDK Layer (C++, Python, Go, Solidity)
- Interface Layer (key-value, smart contract, UTXO)
- ResilientDB Database Connectivity (RDBC) API
- Platform Layer (consensus, chain, network, notary)
- Transaction Layer (execution runtime and in-memory chain state)
- Storage Layer (chain and chain state durability)


## NexRes v1.5.0 - 2023-04-05T00:37:02Z

A complete refactoring of the code base such that (1) the core engine code is now moved to the platform folder, including the formwork architectures and protocols implementations; (2) the API/interface-related code is moved to the service folder, including UTXO, smart contract, and key-value interface;  (3) the python SDK code is moved to a different repository [here](https://github.com/resilientdb/sdk).

## ResilientDB Legacy with SGX Acceleration (v3.1) - 2023-03-14T18:15:16Z

Creating a persistent release using Zenodo on the legacy codebase of ResilientDB (pre-NexRes).

## NexRes v1.4.1 - 2023-03-13T23:59:08Z

Creating a persistent release using Zenodo.

## NexRes v1.4.0 - 2023-02-28T09:21:27Z

### Major Changes

Support of UTXO model and wallet integration: [Detailed Documentation](https://blog.resilientdb.com/2023/02/12/GettingStartedOnUtxo.html)

## NexRes v1.3.1 - 2023-02-27T03:03:42Z

Bugfix

Fix build fail from kv_server
Fix build fail from Ubuntu 22

## NexRes v1.3.0 - 2023-02-23T06:18:33Z

### Major Changes
Added Python SDK that supports UTXO-like transactions such as asset creation, transfer, and multi-party validations.
Added REST CROW endpoints to interface with the on-chain KV service.
Extended KV service range queries.

## NexRes v1.2.0 - 2023-01-30T03:33:43Z

### Major Changes
Support smart contract compiled from [Solidity](https://solidity.readthedocs.io/en/v0.5.0/index.html).
Use [eEVM](https://github.com/microsoft/eEVM) as a back-end service to execute the contract functions. 

## NexRes v1.1.0 - 2023-01-04T00:11:12Z

### Major Changes

Added Geo-Scale Byzantine Fault-tolerant consensus protocol, referred to as **GeoBFT**. It is designed for excellent scalability by using a topological-aware grouping of replicas in local clusters, giving rise to parallelization of consensus at the local level and by minimizing communication between clusters. 

**ResilientDB**: Global Scale Resilient Blockchain Fabric, **VLDB 2020**

## NexRes v1.0.1 - 2022-10-13T16:03:25Z

NexRes v1.0.1 ([2022-10-13](https://github.com/resilientdb/resilientdb/tree/nexres-v1.0.1))

## Changes

Add node manager backend for resilientdb.com to launch Nexres locally.

## NexRes v1.0.0 - 2022-09-30T20:47:19Z

### NexRes v1.0.0 ([2022-09-30](https://github.com/resilientdb/resilientdb/tree/nexres-v1.0))

## Changes

Release the next generation of RelisientDB referred to as Nexres.
Nexres supports PBFT as the default core protocol and provides a KV-Server as a service.
Nexres also supports LevelDB and RocksDB as the durable storage layer.
Add SDK endpoints.

## NexRes v1.0.0-alpha - 2022-09-23T01:16:51Z

### NexRes v1.0.0-alpha ([2022-09-22](https://github.com/resilientdb/resilientdb/releases/tag/nexres-alpha))

An alpha version of Nexres v1.0.0-alpha

**Implemented:**
* Release the next generation of RelisientDB referred to as Nexres.
* Nexres supports PBFT as the default core protocol and provides a KV-Server as a service.
* Nexres also supports LevelDB and RocksDB as the durable storage layer

## ResilientDB v3.0 - 2021-09-30T19:10:02Z

### GeoBFT Protocol (v3.0)

### Major Changes
- GeoBFT Protocol Added
- Work Queue structure changed

### Minor Changes
- Refactoring
- Scripts
- Statistics


## ResilientDB v2.1  - 2021-04-14T02:01:19Z

## Nanomsg Next Generation and Client Improvements (v2.1)
* Updated transport layer to new nanomsg library called [NNG](https://nng.nanomsg.org/).
* Client Memory problem solved.
* Minor fixes for docker script.

## ResilientDB v2.0 - 2020-02-29T20:36:47Z

Smart Contracts, DB Support and GUI Display (v2.0)

## ResilientDB (v1.1) - 2019-12-06T06:50:18Z

ResilientDB (v1.1)

## ResilientDB v1.0  - 2019-11-24T17:26:34Z

ResilientDB Architecture (v1.0)

