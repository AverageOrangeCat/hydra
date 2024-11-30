#!/bin/bash

# Short for maven.sh

CURRENT_PATH=$(dirname "$0")

RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "description"
    exit 0
fi

if [ "$COMMAND" = "parameters" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "parameters"
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
