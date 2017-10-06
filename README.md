# Quorum-RDBMS Reference Implementation

[![BlockApps logo](http://blockapps.net/img/logo_cropped.png)](http://blockapps.net)

Quorum is an Ethereum-based (forked from go-ethereum) distributed ledger protocol with transaction/contract privacy and new consensus mechanisms. More information [here](https://github.com/jpmorganchase/quorum). 

Blockapps team added the following integrations to Quorum (geth1.6 stable):
- BlockApps Cirrus smart-contract indexing engine (postgres) available via postgrest
- Block and Transaction indexing (postrgres) available via STRATO-api 
- End2End integration tested, test scripts part of this repo. 

## Architecture Diagram of the Quorum-STRATO platform
![quorum STRATO architecture](architecture.png?raw=true "Quorum-STRATO Architecture")

### Pre-requisites

**Linux/MacOSX:**

- [Install Docker](https://www.docker.com/community-edition) on your machine
- [Install Docker Compose](https://docs.docker.com/compose/install/) on your machine

**Windows:**

- [Install Docker Toolbox](https://www.docker.com/products/docker-toolbox) ("Docker for Windows" is not currently supported)

### Steps

1. Get docker registry credentials from BlockApps team via email trial@blockapps.net
2. Login to BlockApps public registry using the instructions in the email (after you get the email from BlockApps team)
3. Clone this repository
```bash
> git clone --recursive https://github.com/blockapps/quorum-rdbms-implementation.git
```
4. Run the instance:
 
 ```bash
 > cd quorum-rdbms-implementation
 > env HOST_IP=<HOST_IP> ./quorum-strato-run.sh
 ```
 where:
 - `<HOST_IP>` is the host machine public IP address (**NOT the `localhost`, `127.0.0.1` or `0.0.0.0`**)

### Running Tests
Follow the instructions in the `README` for the [quorum-tests](https://github.com/blockapps/quorum-tests)

### BlockApps STRATO Developer Edition
- Developer Site: https://developers.blockapps.net/
- Developer Support: https://developers.blockapps.net/support/
