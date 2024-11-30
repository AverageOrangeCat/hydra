#!/bin/bash

CURRENT_PATH=$(dirname "$0")

COMMAND="$1"

if [ "$COMMAND" = "info" ]; then
    echo "Runs testing scripts"
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    EXIT_CODE=0

    if [ ! -d "$CURRENT_PATH" ]; then
        EXIT_CODE=1
    fi

    exit $EXIT_CODE
fi

if [ "$COMMAND" != "hide-test-title" ]; then
    echo "================================================<[ TESTS ]>================================================"
fi

EXIT_CODE=0

FILLER="................................................................"

for ENTRY in "$CURRENT_PATH"/*.sh
do
    SHORT_ENTRY=$(echo "$ENTRY" | grep -o "\.hydra.*")

    if bash "$ENTRY" "run-tests"; then
        echo "[ INFO ] $SHORT_ENTRY ${FILLER:${#SHORT_ENTRY}} successful"
    else
        echo "[ INFO ] $SHORT_ENTRY ${FILLER:${#SHORT_ENTRY}} failed"
        EXIT_CODE=1
    fi
done

exit $EXIT_CODE
