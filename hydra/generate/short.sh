#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCES_PATH="$CURRENT_PATH/short"
TEMPLATES_PATH="$RESOURCES_PATH/templates"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Generate short link"
    exit 0
fi

if [ "$COMMAND" = "parameters" ]; then
    echo " ├─ > --short-name                                                  ..."
    echo " └─ > --resource-name                                               ..."
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

    if [ ! -d "$TEMPLATES_PATH" ]; then
        EXIT_CODE=1
    fi

    if [ ! -f "$TEMPLATES_PATH/short.sh" ]; then
        EXIT_CODE=1
    fi

    exit $EXIT_CODE
fi

SHORT_NAME=""
RESOURCE_NAME=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --short-name)
      SHORT_NAME="$2"
      shift 2
      ;;
    --resource-name)
      RESOURCE_NAME="$2"
      shift 2
      ;;
    *)
      echo "[ ERROR ] Unknown option: \"$1\""
      exit 1
      ;;
  esac
done

VALID_SHORT_NAME="^[a-zA-Z0-9\-]+$"
VALID_RESOURCE_NAME="^[a-zA-Z0-9\-]+$"

if [[ ! "$SHORT_NAME" =~ $VALID_SHORT_NAME ]]; then
    echo "[ ERROR ] Invalid short-name: \"$RESOURCE_NAME\""
    exit 1
fi

if [[ ! "$RESOURCE_NAME" =~ $VALID_RESOURCE_NAME ]]; then
    echo "[ ERROR ] Invalid resource-name: \"$RESOURCE_NAME\""
    exit 1
fi

if ! sed -e "s/{{RESOURCE_NAME}}/$RESOURCE_NAME/g" \
         "$TEMPLATES_PATH/short.sh" > "$SHORT_NAME.sh" 2>/dev/null; then
    echo "[ ERROR ] Could not prepare template"
    exit 1
fi
