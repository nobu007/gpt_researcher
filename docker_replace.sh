#!/bin/bash

# get current directory
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "CURRENT_DIR=$CURRENT_DIR"

cd $CURRENT_DIR
TOOL_NAME="gpt_researcher"
WORKDIR=/usr/src/app

# copy all files to docker
docker cp .env ${TOOL_NAME}:${WORKDIR}/.env
docker cp ${TOOL_NAME}/. ${TOOL_NAME}:${WORKDIR}/${TOOL_NAME}
docker cp scripts/. ${TOOL_NAME}:${WORKDIR}/scripts

# restart docker
# echo "Restarting docker..."
# docker restart scripter
# echo "Restarting docker...done"
