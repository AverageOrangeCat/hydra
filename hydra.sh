#!/bin/bash

CURRENT_PATH="$(dirname "$0")"

RESOURCES_PATH="$CURRENT_PATH/hydra"

COMMAND="$1"

shift 1

bash "$RESOURCES_PATH/$COMMAND".sh "$@" 2>/dev/null

EXIT_CODE=$?

if [ "$EXIT_CODE" -eq 0 ]; then
    # Successfully passed to next handler
    exit 0
fi

if [ "$EXIT_CODE" -eq 1 ]; then
    # Successfully passed to next handler, but an error was thrown
    exit 1
fi

bash "$RESOURCES_PATH/help.sh"
