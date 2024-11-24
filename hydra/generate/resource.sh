#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCES_PATH="$CURRENT_PATH/resource"
TEMPLATES_PATH="$RESOURCES_PATH/templates"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Generate resource template"
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

    if [ ! -d "$TEMPLATES_PATH" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ ! -f "$TEMPLATES_PATH/resource.sh" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ ! -f "$TEMPLATES_PATH/help.sh" ]; then
        TESTING_STATUS="FAILED"
    fi

    if [ $TESTING_STATUS = "SUCCESSFUL" ]; then
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} successful"
    else
        echo "[ INFO ] $SHORT_SCRIPT_PATH ${FILLER:${#SHORT_SCRIPT_PATH}} failed"
    fi

    exit 0
fi

RESOURCE_NAME=""
RESOURCE_DESCRIPTION=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --resource-name)
      RESOURCE_NAME="$2"
      shift 2
      ;;
    --resource-description)
      RESOURCE_DESCRIPTION="$2"
      shift 2
      ;;
    *)
      echo "[ ERROR ] Unknown option: \"$1\""
      exit 1
      ;;
  esac
done

VALID_RESOURCE_NAME="^[a-zA-Z0-9\-]+$"
VALID_RESOURCE_DESCRIPTION="^[a-zA-Z0-9_\-\. ]+$"

if [[ ! "$RESOURCE_NAME" =~ $VALID_RESOURCE_NAME ]]; then
    echo "[ ERROR ] Invalid resource-name: \"$RESOURCE_NAME\""
    exit 1
fi

if [[ ! "$RESOURCE_DESCRIPTION" =~ $VALID_RESOURCE_DESCRIPTION ]]; then
    echo "[ ERROR ] Invalid resource-description: \"$RESOURCE_DESCRIPTION\""
    exit 1
fi

if ! sed -e "s/{{RESOURCE_NAME}}/$RESOURCE_NAME/g" \
         -e "s/{{RESOURCE_DESCRIPTION}}/$RESOURCE_DESCRIPTION/g" \
         "$TEMPLATES_PATH/resource.sh" > "$RESOURCE_NAME.sh" 2>/dev/null; then
    echo "[ ERROR ] Could not prepare template"
    exit 1
fi

if ! mkdir "$RESOURCE_NAME"; then
    echo "[ ERROR ] Could not make dir"
    exit 1
fi

if ! cd "$RESOURCE_NAME"; then
    echo "[ ERROR ] Could not change dir"
    exit 1
fi

if ! sed -e "s/{{RESOURCE_NAME}}/$RESOURCE_NAME/g" \
         "$TEMPLATES_PATH/help.sh" > "help.sh" 2>/dev/null; then
    echo "[ ERROR ] Could not prepare template"
    exit 1
fi
