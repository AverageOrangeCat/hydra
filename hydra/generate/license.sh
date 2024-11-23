#!/bin/bash

CURRENT_PATH="$(dirname "$0")"

RESOURCES_PATH="$CURRENT_PATH/license"
TEMPLATES_PATH="$RESOURCES_PATH/templates"

COMMAND="$1"

if [ "$COMMAND" = "description" ]; then
    echo "Generate LICENSE.md file"
    exit 0
fi

YEAR=$(date +"%Y")
TEMPLATE=""
AUTHOR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --template)
      TEMPLATE="$2"
      shift 2
      ;;
    --author)
      AUTHOR="$2"
      shift 2
      ;;
    *)
      echo "[ ERROR ] Unknown option: \"$1\""
      exit 1
      ;;
  esac
done

VALID_TEMPLATE="^mit$"
VALID_AUTHOR="^[a-zA-Z0-9_\-\. ]+$"

if [[ ! "$TEMPLATE" =~ $VALID_TEMPLATE ]]; then
    echo "[ ERROR ] Invalid template: \"$TEMPLATE\""
    echo "[ INFO ] You can choose between:"
    echo "[ INFO ]      - mit: MIT License"
    exit 1
fi

if [[ ! "$AUTHOR" =~ $VALID_AUTHOR ]]; then
    echo "[ ERROR ] Invalid author: \"$AUTHOR\""
    exit 1
fi

if ! sed -e "s/{{YEAR}}/$YEAR/g" -e "s/{{AUTHOR}}/$AUTHOR/g" \
    "$TEMPLATES_PATH/$TEMPLATE.md" > LICENSE.md 2>/dev/null; then
    echo "[ ERROR ] Could not prepare template"
    exit 1
fi
