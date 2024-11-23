#!/bin/bash

# Short for generate.sh

CURRENT_PATH="$(dirname "$0")"

RESOURCE="generate"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$CURRENT_PATH/$RESOURCE.sh" "$@"
