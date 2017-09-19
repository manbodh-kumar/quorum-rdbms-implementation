#!/usr/bin/env bash

# Optional arguments:
# `--stop` - stop STRATO containers
# `--wipe` - stop STRATO containers and wipe out volumes
# `--stable` - run stable STRATO version (latest is by default)

set -e

registry="registry-aws.blockapps.net:5000"

function wipe {
    echo "Stopping Quorum-STRATO containers and wiping out volumes"
    docker-compose kill 2> /dev/null
    docker-compose down -v 2> /dev/null
}

function stop {
    echo "Stopping STRATO containers"
    docker-compose kill 2> /dev/null
    docker-compose down 2> /dev/null
}

mode=${STRATO_GS_MODE:="0"}
stable=false

while [ ${#} -gt 0 ]; do
  case "${1}" in
  --stop|-stop)
    stop
    exit 0
    ;;
  --wipe|-wipe)
    wipe
    exit 0
    ;;
  --stable|-stable)
    echo "Deploying the stable version"
    stable=true
    ;;
  -m)
    echo "Mode is set to $2"
    mode="$2"
    shift
    ;;
  esac

  shift 1
done

echo "
    ____  __           __   ___
   / __ )/ /___  _____/ /__/   |  ____  ____  _____
  / __  / / __ \/ ___/ //_/ /| | / __ \/ __ \/ ___/
 / /_/ / / /_/ / /__/ ,< / ___ |/ /_/ / /_/ (__  )
/_____/_/\____/\___/_/|_/_/  |_/ .___/ .___/____/
                              /_/   /_/
"

if ! docker ps &> /dev/null
then
    echo 'Error: docker is required to be installed and configured for non-root users: https://www.docker.com/'
    exit 1
fi

if ! docker-compose -v &> /dev/null
then
    echo 'Error: docker-compose is required: https://docs.docker.com/compose/install/'
    exit 2
fi

    export NODE_NAME=${DOMAIN_NAME:-localhost}
    export BLOC_URL=http://${DOMAIN_NAME:-localhost}/v2.1
    export BLOC_DOC_URL=http://${DOMAIN_NAME:-localhost}/docs/?url=/bloc/v2.1/swagger.json
    export STRATO_URL=http://${DOMAIN_NAME:-localhost}/eth/v1.2
    export STRATO_DOC_URL=http://${DOMAIN_NAME:-localhost}/docs/?url=/eth/v1.2/swagger.json
    export CIRRUS_URL=http://${DOMAIN_NAME:-localhost}:${cirrusPort}
    export cirrusPort=3333
    export cirrusurl=http://cirrus:${cirrusPort}

    export STRATO_PORT=8801
    export stratourl=quorum-strato:${STRATO_PORT}
    #export stratoHost=nginx
    export stateDiffTopic=statediff-cirrus
    export ssl=false
    export STRATO_GS_MODE=${mode}
    docker-compose up -d
