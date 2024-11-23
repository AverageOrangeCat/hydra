#!/bin/bash

# Short for maven.sh

RESOURCES_PATH="$HOME/.hydra/resources"
COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES_PATH/maven.sh" "description"
    exit 0
fi

bash "$RESOURCES_PATH/maven.sh" "$@"
