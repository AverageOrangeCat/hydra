#!/bin/bash

# Short for help.sh

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE_PATH="$RESOURCES_PATH/maven"
RESOURCE="help"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCE_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$RESOURCE_PATH/$RESOURCE.sh" "$@"
