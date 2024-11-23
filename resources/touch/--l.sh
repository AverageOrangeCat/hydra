#!/bin/bash

# Short for license.sh

RESOURCES="$HOME/.hydra/resources"
RESOURCE="$RESOURCES/touch"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$RESOURCE/license.sh" "description"
    exit 0
fi

bash "$RESOURCE/license.sh" "$@"
