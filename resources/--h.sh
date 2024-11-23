#!/bin/bash

# Short for help.sh

RESOURCES_PATH="$HOME/.hydra/resources"
COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES_PATH/help.sh" "description"
    exit 0
fi

bash "$RESOURCES_PATH/help.sh" "$@"
