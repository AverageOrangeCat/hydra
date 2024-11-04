#!/bin/bash

VERSION=0.0.2-test

if [ $# -ge 1 ]; then
    if [ $1 = version ]; then
        echo $VERSION
        exit 0
    fi
fi

cat << EOF
========================<[ COMMANDS ]>========================
- help > Creates this commands menu
EOF
