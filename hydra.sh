#!/bin/bash

PROJECT_TITLE=hydra
ABBREVIATION=hydra
VERSION=0.0.3-test

HOME_DIR=$(dirname $0)

if [ $# -ge 1 ]; then
    OPTION=$1

    if [ $OPTION = version ]; then
        echo $VERSION
        exit 0
    fi

    if [ $OPTION = apache-maven ]; then
        shift 1
        source $HOME_DIR/scripts/apache-maven.sh $@
        exit 0
    fi
fi

cat <<EOF
hydra [ OPTIONS ]
================================================<[ OPTIONS ]>================================================
> help           > Shows this options menu
> version        > Shows the current version of hydra
> apache-maven   > Generate apache-maven templates
EOF
