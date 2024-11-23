#!/bin/bash

# Short for touch.sh

RESOURCES="$HOME/.hydra/resources"
COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCES/touch.sh" "description"
    exit 0
fi

bash "$RESOURCES/touch.sh" "$@"
