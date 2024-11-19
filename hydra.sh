#!/bin/bash

PROJECT_NAME="hydra"
VERSION="0.0.4-test"

HOME_DIR=$(dirname $0)

APACHE_MAVEN_KEYWORD="apache-maven"

apache-maven-init() {
    PROJECT_NAME="$1"

    VALID_PROJECT_NAME="^[a-zA-Z0-9_\-\.]+$"

    if [[ ! "$PROJECT_NAME" =~ $VALID_PROJECT_NAME ]]; then
        echo "Invalid input: \"$PROJECT_NAME\""
        exit 1
    fi

    cp -r "$HOME_DIR/resources/$APACHE_MAVEN_KEYWORD/default-template" "$PROJECT_NAME"
}

apache-maven() {
    if [ $# -ge 1 ]; then
        OPTION="$1"

        if [ "$OPTION" = "init" ]; then
            shift 1
            apache-maven-init "$@"
            exit 0
        fi
    fi

    echo "hydra $APACHE_MAVEN_KEYWORD [ OPTIONS ]"
    echo "================================================<[ OPTIONS ]>================================================"
    echo "> init [ PROJECT_NAME ] ..... > Generate new default $APACHE_MAVEN_KEYWORD template"
}

hydra() {
    if [ $# -ge 1 ]; then
        OPTION="$1"

        if [ "$OPTION" = "version" ]; then
            echo "$VERSION"
            exit 0
        fi

        if [ "$OPTION" = "$APACHE_MAVEN_KEYWORD" ]; then
            shift 1
            apache-maven "$@"
            exit 0
        fi
    fi

    echo "hydra [ OPTIONS ]"
    echo "================================================<[ OPTIONS ]>================================================"
    echo "> help ..... > Shows this options menu"
    echo "> version ..... > Shows the current version of hydra"
    echo "> $APACHE_MAVEN_KEYWORD ..... > Generate $APACHE_MAVEN_KEYWORD templates"
}

hydra "$@"
