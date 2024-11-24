#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCES_PATH="$CURRENT_PATH/{{RESOURCE_NAME}}"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "{{RESOURCE_DESCRIPTION}}"
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    TESTING_STATUS="SUCCESSFUL"

    SHORT_SCRIPT_PATH=$(echo "$0" | grep -o "\.hydra.*")
    FILLER="................................................................"
    
    if [ ! -d "$CURRENT_PATH" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ ! -d "$RESOURCES_PATH" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ $TESTING_STATUS = "SUCCESSFUL" ]; then
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} successful"
    else
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} failed"
    fi

    if [ -d "$RESOURCES_PATH" ]; then
        bash "$RESOURCES_PATH/test.sh"
    fi

    exit 0
fi

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
