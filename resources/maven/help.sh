#!/bin/bash

RESOURCES_PATH="$HOME/.hydra/resources"
RESOURCE_PATH="$RESOURCES_PATH/maven"
RESOURCE="maven"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Shows this menu"
    exit 0
fi

echo "hydra $RESOURCE [ COMMANDS ]"
echo "================================================<[ COMMANDS ]>================================================"

FILLER="................................"

for ENTRY in "$RESOURCE_PATH"/*.sh
do
    COMMAND=$(basename "${ENTRY%.*}")
    DESCRIPTION=$(bash "$ENTRY" "description")

    echo "> $COMMAND ${FILLER:${#COMMAND}} $DESCRIPTION"
done
