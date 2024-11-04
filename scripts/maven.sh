#!/bin/bash

PROJECT_TITLE=maven
ABBREVIATION=maven
VERSION=0.0.1-test

HOME_DIR=$(dirname $0)

if [ $# -ge 1 ]; then
    OPTION=$1
    PROJECT_NAME=$2

    if [ $OPTION = version ]; then
        echo $VERSION
        exit 0
    fi

    if [ $OPTION = init ]; then
        cp -r $HOME_DIR/resources/maven/init $PROJECT_NAME
        exit 0
    fi
fi

cat <<EOF
hydra maven [ OPTIONS ]
================================================<[ OPTIONS ]>================================================
> help       > Shows this options menu
> version    > Shows the current version of hydra:maven
> init       > Generate new default maven template
EOF
