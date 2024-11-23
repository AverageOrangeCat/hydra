#!/bin/bash

# Short for help.sh

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE="help"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$RESOURCES_PATH/$RESOURCE.sh" "$@"
