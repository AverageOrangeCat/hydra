#!/bin/bash

CURRENT_PATH=$(dirname "$0")

RESOURCES_PATH="$CURRENT_PATH/resource"
TEMPLATES_PATH="$RESOURCES_PATH/templates"

COMMAND="$1"

if [ "$COMMAND" = "info" ]; then
    echo "Generate resource template"

    # Shows options
    echo " ├─ > --resource-name                                               ..."
    echo " └─ > --resource-info                                               ..."

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

    if [ ! -f "$TEMPLATES_PATH/resource.sh" ]; then
        EXIT_CODE=1
    fi

    if [ ! -f "$TEMPLATES_PATH/help.sh" ]; then
        EXIT_CODE=1
    fi

    exit $EXIT_CODE
fi

RESOURCE_NAME=""
RESOURCE_INFO=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --resource-name)
      RESOURCE_NAME="$2"
      shift 2
      ;;
    --resource-info)
      RESOURCE_INFO="$2"
      shift 2
      ;;
    *)
      echo "[ ERROR ] Unknown option: \"$1\""
      exit 1
      ;;
  esac
done

VALID_RESOURCE_NAME="^[a-zA-Z0-9\-]+$"
VALID_RESOURCE_INFO="^[a-zA-Z0-9_\-\. ]+$"

if [[ ! "$RESOURCE_NAME" =~ $VALID_RESOURCE_NAME ]]; then
    echo "[ ERROR ] Invalid resource-name: \"$RESOURCE_NAME\""
    exit 1
fi

if [[ ! "$RESOURCE_INFO" =~ $VALID_RESOURCE_INFO ]]; then
    echo "[ ERROR ] Invalid resource-info: \"$RESOURCE_INFO\""
    exit 1
fi

if ! sed -e "s/{{RESOURCE_NAME}}/$RESOURCE_NAME/g" \
         -e "s/{{RESOURCE_INFO}}/$RESOURCE_INFO/g" \
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

if ! cp "$TEMPLATES_PATH/test.sh" "test.sh" 2>/dev/null; then
    echo "[ ERROR ] Could copy template"
    exit 1
fi
