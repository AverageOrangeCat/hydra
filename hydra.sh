#!/bin/bash

PROJECT_TITLE=hydra
ABBREVIATION=hydra
VERSION=0.0.2-test

HOME_DIR=$(dirname $0)

if [ $# -ge 1 ]; then
    OPTION=$1

    if [ $OPTION = maven ]; then
        shift 1
        source $HOME_DIR/scripts/maven.sh $@
        exit 0
    fi

    if [ $OPTION = version ]; then
        echo $VERSION
        exit 0
    fi
fi

cat << EOF
hydra [ OPTIONS ]
========================<[ OPTIONS ]>========================
- help       > Creates this options menu
- version    > Shows the current version of hydra
EOF
