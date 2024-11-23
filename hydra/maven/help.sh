#!/bin/bash

CURRENT_PATH="$(dirname "$0")"

RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Shows this menu"
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
