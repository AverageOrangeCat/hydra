#!/bin/bash

# Short for help.sh

RESOURCES="$HOME/.hydra/resources"
COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES/help.sh" "description"
    exit 0
fi

bash "$RESOURCES/help.sh" "$@"
