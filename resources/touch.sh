#!/bin/bash

RESOURCES="$HOME/.hydra/resources"
RESOURCE="$RESOURCES/touch"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Manage basic templates"
    exit 0
fi

shift 1

bash "$RESOURCE/$COMMAND".sh "$@" 2>/dev/null

EXIT_CODE=$?

if [ "$EXIT_CODE" -eq 0 ]; then
    # Successfully passed to next handler
    exit 0
fi

if [ "$EXIT_CODE" -eq 1 ]; then
    # Successfully passed to next handler, but an error was thrown
    exit 1
fi

bash "$RESOURCE/help.sh"
