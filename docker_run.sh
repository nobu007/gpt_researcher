#!/bin/bash

# get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "CURRENT_DIR=$CURRENT_DIR"
HOME_DIR=$(echo ~)
TOOL_NAME="gpt_researcher"

# clean cache
python3 -m site --user-site

# docker
docker run --gpus all --rm -p 127.0.0.1:8000:8000 --env-file .env --mount type=bind,source=${HOME_DIR}/.cache/huggingface/hub,target=/root/.cache/huggingface/hub --name ${TOOL_NAME} ${TOOL_NAME}
