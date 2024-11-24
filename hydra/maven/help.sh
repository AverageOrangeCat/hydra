#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Shows this menu"
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    TESTING_STATUS="SUCCESSFUL"

    SHORT_SCRIPT_PATH=$(echo "$0" | grep -o "\.hydra.*")
    FILLER="................................................................"
    
    if [ ! -d "$CURRENT_PATH" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ $TESTING_STATUS = "SUCCESSFUL" ]; then
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} successful"
    else
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} failed"
    fi

    exit 0
fi

echo "$RESOURCE [ COMMANDS ]"
echo "================================================<[ COMMANDS ]>================================================"

FILLER="................................"

for ENTRY in "$CURRENT_PATH"/*.sh
do
    COMMAND=$(basename "${ENTRY%.*}")
    DESCRIPTION=$(bash "$ENTRY" "description")

    echo "> $COMMAND ${FILLER:${#COMMAND}} $DESCRIPTION"
done
