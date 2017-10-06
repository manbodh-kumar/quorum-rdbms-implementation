# Quorum-RDBMS Reference Implementation

[![BlockApps logo](http://blockapps.net/img/logo_cropped.png)](http://blockapps.net)

*TODO:* Turn these bullet points into marketing text, link back to strato-getting-started
- brief description of quorum, with link to one of their marketing pages
- description of the included blockapps value added services
1. cirrus smart contract indexing engine (postgres) available via postgrest
2. block and transaction indexing (postrgres) available via STRATO-api 
- Supports the latest Quorum relase
- E2E tested 

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
> git clone --recursive https://github.com/blockapps/quorum-getting-started.git
```
4. Run the instance:
 
 ```bash
 > cd quorum-strato-getting-started
 > env HOST_IP=<HOST_IP> ./quorum-strato-run.sh
 ```
 where:
 - `<HOST_IP>` is the host machine public IP address (**NOT the `localhost`, `127.0.0.1` or `0.0.0.0`**)

### Running Tests
Follow the instructions in the `README` for the [quorum-tests](https://github.com/blockapps/quorum-tests)
