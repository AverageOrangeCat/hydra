#!/bin/bash

# Short for maven.sh

CURRENT_PATH=$(dirname "$0")

RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "info" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "info"
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    EXIT_CODE=0

    if [ ! -d "$CURRENT_PATH" ]; then
        EXIT_CODE=1
    fi

    if [ ! -f "$CURRENT_PATH/$RESOURCE.sh" ]; then
        EXIT_CODE=1
    fi

    exit $EXIT_CODE
fi

bash "$CURRENT_PATH/$RESOURCE.sh" "$@"
