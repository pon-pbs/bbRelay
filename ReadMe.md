# Welcome To Proof Of Neutrality Relay

The Proof of Neutrality Relay (PoN) is a decentralized, permissionless, and neutral middleware run by validators to participate in the market for block-building and exchange. The PoN relay was built by Blockswap Labs as a solution implementing the Proposer-Builder Separation theory (PBS) put forward by Vitalik Buterin.

[![Relay Documentation](
https://camo.githubusercontent.com/915b7be44ada53c290eb157634330494ebe3e30a/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6c616e672f6764646f3f7374617475732e737667
)](https://docs.pon.network/pon/relay)
[![Relay Documentation](
https://img.shields.io/badge/Documentation-Docusaurus-green)](https://docs.pon.network/)

## Why build the Proof of Neutrality Relay?

Ethereum’s credible neutrality and decentralization of consensus is under threat from centralized relays and censorship caused by MEV. The PoN relay’s decentralized infrastructure is necessary to prevent a world of permissioned communication between block-builders and block proposers.

Validators and MEV will become more closely linked in a Proof-of-Stake (PoS) environment due to the appeal of higher MEV staking rewards and their growing importance as staking participation increases and rewards will inevitably decrease. The PoN relay maximizes validator staking rewards through the selling of blockspace to an open market, allowing for consistent MEV payouts from the PBS Smoothing Pool.

## How does the Proof of Neutrality Relay Work?

In the Ethereum Proof-of-Stake (PoS) system, node operators use three essential pieces of software components: the validator client, the execution client, and the consensus client. The PoN relay is an additional open-source software that seamlessly integrates with the consensus client, allowing for connection to a network of block-builders and the outsourcing of block-building. Additionally, it uses zero-knowledge proofs and encrypted communication to facilitate the builder’s request for a validator, ensuring guaranteed validator payment inclusion in a block while also keeping block content unrevealed.

Block-builders create full blocks aiming for the optimal MEV extraction and equitable distribution of rewards. Once they are done, the blocks are sent to relays. The PoN relay selects the most profitable block received from various builders, submits it to the block proposer, and the consensus client then sends it to the Ethereum network for verification and block inclusion.

Reporters are a novel addition and essential for a decentralized infrastructure to run smoothly. In the PoN relay, reporters monitor the actions of builders and proposers to ensure that there is no malicious behavior or wrongdoing. If a violation occurs, the reporter can submit a report and earn ETH for securing the protocol.

## Setting Up PON Network

PON Consists of Relay, Builder and Reporter, all of which are essential. If you want to run builder or relay please use the following steps-
#### Builder

[![Builder Repository](
https://camo.githubusercontent.com/915b7be44ada53c290eb157634330494ebe3e30a/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6c616e672f6764646f3f7374617475732e737667
)](https://github.com/pon-pbs/bbBuilder)

- Visit [Builder Repository](https://github.com/pon-pbs/bbBuilder)
- Build following the instructions provided

#### Reporter

[![Builder Repository](
https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white
)](https://github.com/pon-pbs/bbBuilder)

- Download The Docker at [Docker Hub](https://hub.docker.com/repository/docker/blockswap/reporter/general)
- Build using ```docker run -dp 3000:3000 blockswap/reporter```

    ```Note- The reporter is under development so aloways use the latest version of reporter```

## Building Relay

### Building From Binaries

Automated builds are available for stable releases and the unstable master branch. Binary
archives are published at https://github.com/pon-pbs/bbRelay.

Use the binaries along with the [![Relay Documentation](
https://img.shields.io/badge/Documentation-Docusaurus-green)](https://docs.pon.network/) to install and run relay from binaries

### Building From Docker

![](https://img.shields.io/badge/Coming-Soon-red)

### Building From Source

To run from source use the main branch of this repository and use the following command-

```shell
go run . relay \
--relay-url <Relay_URL> \
--beacon-uris <Beacon_URIS> \
--redis-uri <Redis_URIS> \
--db <DB_URL> \
--secret-key <Relay_BLS> \
--network <Network> \
--max-db-connections <Max_DB_Connections> \
--max-idle-connections <Max_Idle_Connections> \
--max-idle-timeout <Max_Idle_Timeout> \
--db-driver <DB_Driver> \
--pon-pool <PON_POOL_URL> \
--pon-pool-API-Key <PON_POOL_API_KEY> \
--bulletinBoard-broker <Bulletin_Board_Broker> \
--bulletinBoard-port <Bulletin_Board_Port> \
--bulletinBoard-client <Bulletin_Board_Client> \
--bulletinBoard-password <Bulletin_Board_Password> \
--reporter-url <Reporter_URL> \
--bid-timeout <Bid_Timeout> \
--relay-read-timeout <Relay_Read_Timeout> \
--relay-read-header-timeout <Relay_Read_Header_Timeout>
--relay-write-timeout <Relay_Write_Timeout> \
--relay-idle-timeout <Relay_Idle_Timeout> \
--new-relic-application <New_Relic_Application> \
--new-relic-license <New_Relic_License> \
--new-relic-forwarding <New_Relic_Forwarding>
```
#### Relay Services
![](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![](https://img.shields.io/badge/redis-%23DD0031.svg?&style=for-the-badge&logo=redis&logoColor=white)

If You Want To Run A Postgres Server And Redis Use The Provided Docker Compose File By Following The [Docker Documentation](./docker-compose/Readme.md)
``` If you use your own POSTGRES_DB_USER and POSTGRES_DB_PASSWORD, please update parameter when running relay based on that```

#### Metabase
![](https://img.shields.io/badge/Metabase-509EE3?style=for-the-badge&logo=metabase&logoColor=fff)

PON Relay comes with a metabase docker-compose file. It can be used by following the [Docker Documentation](./docker-compose/Readme.md).
``` For Performance Its Better If You Run The Service In Different Machine Then The Relay```

#### PoN Builder Parameters

| Parameter | Description | Default | Required |
| --- | --- | --- | --- |
| `--relay-url` | Listen Address For The PoN Relay Service Locally| `"localhost:9000"` | No |
| `--beacon-uris` | Beacon Node Endpoint | `""` | Yes |
| `--db` | Database URL | `""` | Yes |
| `--secret-key` | BLS Secret Key Of Relay | `""` | Yes |
| `--network` | Network `(Testnet/ Mainnet)` | `"Testnet"` | No |
| `--max-db-connections` | Maximum Database Connections | `100` | No |
| `--max-idle-connections` | Maximum Database Idle Connections | `100` | No |
| `--max-idle-timeout` | Maximum Database Timeout `(In 1s/ 5h format)`  | `100s` | No |
| `--db-driver` | Database Driver | `postgres` | No |
| `--pon-pool` | Pon Pool Subgraph URL | `""` | Yes |
| `--bulletinBoard-broker` | Bulletin Board MQTT Broker URL | `""` | Yes |
| `--bulletinBoard-port` | Bulletin Board MQTT Port | `""` | Yes |
| `--bulletinBoard-client` | Bulletin Board Client | `""` | Yes |
| `--bulletinBoard-password` | Bulletin Board Password | `""` | Yes |
| `--bid-timeout` | Maximum Time Bid Is Kept With Relay `(In 1s/ 5h format)` | `"15s"` | No |
| `--relay-read-timeout` | Relay Server Read Timeout `(In 1s/ 5h format)` | `"10s"` | No |
| `--relay-read-header-timeout` | Relay Server Read Header Timeout `(In 1s/ 5h format)` | `"10s"` | No |
| `--relay-write-timeout` | Relay Server Write Timeout `(In 1s/ 5h format)` | `"10s"` | No |
| `--relay-idle-timeout` | Relay Idle Timeout `(In 1s/ 5h format)` | `"10s"` | No |
| `--new-relic-application` | New Relic Application `(New Relic Not Used If Application Not Provided)` | `""` | No |
| `--new-relic-license` | New Relic License | `""` | No |
| `--new-relic-forwarding` | New Relic Forwarding | `false` | No |

## Hardware Requirements

![](https://img.shields.io/badge/Coming-Soon-red)

## API Spec
[![API Spec](
https://validator.swagger.io/validator/?url=https%3A%2F%2Fgithub.com%2Fbsn-eng%2FPon-relay%2FDocs%2Fswagger.yaml)](./docs/swagger.yaml)

API Spec Is Generated Using Go-Swagger for Open API Implementation. You can follow the specification by visiting the [API-Spec](./docs/APISpec.md)
If you want to make changes to the swagger file, run the following commands-

```shell
make swagger
make serve-swagger
```

## New Relic

PON Relay comes with support for new relic. If you want to run it, just provide the --new-relic-app and --new-relic-license when running the relay and you are good to go



