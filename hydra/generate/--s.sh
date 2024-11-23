#!/bin/bash

# Short for short.sh

CURRENT_PATH="$(dirname "$0")"

RESOURCE="short"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$CURRENT_PATH/$RESOURCE.sh" "$@"
