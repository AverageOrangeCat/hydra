#!/bin/bash

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE_PATH="$RESOURCES_PATH/generate"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Manage basic templates"
    exit 0
fi

shift 1

bash "$RESOURCE_PATH/$COMMAND".sh "$@" 2>/dev/null

EXIT_CODE=$?

if [ "$EXIT_CODE" -eq 0 ]; then
    # Successfully passed to next handler
    exit 0
fi

if [ "$EXIT_CODE" -eq 1 ]; then
    # Successfully passed to next handler, but an error was thrown
    exit 1
fi

bash "$RESOURCE_PATH/help.sh"
