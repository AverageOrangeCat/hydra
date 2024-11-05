#!/bin/bash

HOME_DIR=$(dirname $0)

if [ $# -ge 1 ]; then
    OPTION=$1
    PROJECT_NAME=$2

    if [ $OPTION = init ]; then
        cp -r $HOME_DIR/resources/maven/init $PROJECT_NAME
        exit 0
    fi
fi

cat <<EOF
hydra maven [ OPTIONS ]
================================================<[ OPTIONS ]>================================================
> init   > Generate new default maven template
EOF
