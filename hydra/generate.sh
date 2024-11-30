#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCES_PATH="$CURRENT_PATH/generate"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Generate hydra specific templates"
    exit 0
fi

if [ "$COMMAND" = "parameters" ]; then
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    EXIT_CODE=0

    if [ ! -d "$CURRENT_PATH" ]; then
        EXIT_CODE=1
    fi

    if [ ! -d "$RESOURCES_PATH" ]; then
        EXIT_CODE=1
    fi

    if ! bash "$RESOURCES_PATH/test.sh" "hide-test-title" 2>/dev/null; then
        exit 1
    fi

    exit $EXIT_CODE
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
