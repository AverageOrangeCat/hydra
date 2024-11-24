#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCE="{{RESOURCE_NAME}}"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Shows this menu"
    exit 0
fi

if [ "$COMMAND" = "run-tests" ]; then
    EXIT_CODE=0

    if [ ! -d "$CURRENT_PATH" ]; then
        EXIT_CODE=1
    fi

    exit $EXIT_CODE
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
