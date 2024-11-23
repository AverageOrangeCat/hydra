#!/bin/bash

# Short for help.sh

RESOURCES="$HOME/.hydra/resources"
RESOURCE="$RESOURCES/touch"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCE/help.sh" "description"
    exit 0
fi

bash "$RESOURCE/help.sh" "$@"
