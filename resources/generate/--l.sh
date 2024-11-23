#!/bin/bash

# Short for license.sh

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE_PATH="$RESOURCES_PATH/generate"
RESOURCE="license"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCE_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$RESOURCE_PATH/$RESOURCE.sh" "$@"
