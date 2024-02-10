#!/bin/bash

# get current directory
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "CURRENT_DIR=$CURRENT_DIR"

# .env ファイルを読み込む
export $(egrep -v '^#' ../.env | xargs)

# copy .env and yka_langchain.py to docker build context
TOOL_NAME="gpt_researcher"
# cp -p "${CURRENT_DIR}/../.env" "${CURRENT_DIR}/.env"
cp -p "${CURRENT_DIR}/../../common/yka_langchain.py" "${CURRENT_DIR}/"
# cp -p "${CURRENT_DIR}/../../common/yka_langchain.py" "${CURRENT_DIR}/${TOOL_NAME}/utils/"
echo $MOMENTO_AUTH_TOKEN

docker build --progress plain -t ${TOOL_NAME} --build-arg MOMENTO_AUTH_TOKEN=$MOMENTO_AUTH_TOKEN .
