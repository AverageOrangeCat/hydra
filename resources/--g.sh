#!/bin/bash

# Short for generate.sh

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE="generate"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$RESOURCES_PATH/$RESOURCE.sh" "$@"
