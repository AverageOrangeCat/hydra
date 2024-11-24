#!/bin/bash

# Short for maven.sh

CURRENT_PATH=$(dirname "$0")

RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    bash "$CURRENT_PATH/$RESOURCE.sh" "description"
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    TESTING_STATUS="SUCCESSFUL"

    SHORT_SCRIPT_PATH=$(echo "$0" | grep -o "\.hydra.*")
    FILLER="................................................................"
    
    if [ ! -d "$CURRENT_PATH" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ ! -f "$CURRENT_PATH/$RESOURCE.sh" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ $TESTING_STATUS = "SUCCESSFUL" ]; then
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} successful"
    else
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} failed"
    fi

    exit 0
fi

bash "$CURRENT_PATH/$RESOURCE.sh" "$@"
