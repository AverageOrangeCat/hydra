#!/bin/bash

RESOURCES="$HOME/.hydra/resources"
COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Shows this menu"
    exit 0
fi

echo "hydra [ COMMANDS ]"
echo "================================================<[ COMMANDS ]>================================================"

FILLER="................................"

for ENTRY in "$RESOURCES"/*.sh
do
    COMMAND=$(basename "${ENTRY%.*}")
    DESCRIPTION=$(bash "$ENTRY" "description")

    echo "> $COMMAND ${FILLER:${#COMMAND}} $DESCRIPTION"
done
