#!/bin/bash

# Short for touch.sh

RESOURCES_PATH="$HOME/.hydra/resources"
COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES_PATH/touch.sh" "description"
    exit 0
fi

bash "$RESOURCES_PATH/touch.sh" "$@"
