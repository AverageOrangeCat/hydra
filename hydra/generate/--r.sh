#!/bin/bash

# Short for resource.sh

CURRENT_PATH="$(dirname "$0")"

RESOURCE="resource"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "description"
    exit 0
fi

bash "$CURRENT_PATH/$RESOURCE.sh" "$@"
