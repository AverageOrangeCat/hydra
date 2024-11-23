#!/bin/bash

# Short for maven.sh

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$RESOURCES_PATH/$RESOURCE.sh" "$@"
