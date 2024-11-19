#!/bin/bash

PROJECT_NAME="hydra"
VERSION="0.0.4-test"

if [ -d "$HOME/.$PROJECT_NAME" ]; then
    if ! rm -fr "$HOME/.$PROJECT_NAME" >/dev/null 2>/dev/null; then
        echo "[ ERROR ] Failed to delete folder: \"~/.$PROJECT_NAME\""
        exit 1
    fi
fi

echo "................................................................ (01 / 04)"

if ! mkdir "$HOME/.$PROJECT_NAME" >/dev/null 2>/dev/null; then
    echo "[ ERROR ] Failed to create folder: \"~/.$PROJECT_NAME\""
    exit 1
fi

echo "................................................................ (02 / 04)"

if ! cd "$HOME/.$PROJECT_NAME" >/dev/null 2>/dev/null; then
    echo "[ ERROR ] Failed to change directory: \"~/.$PROJECT_NAME\""
    exit 1
fi

echo "................................................................ (03 / 04)"

if ! git clone "git@github.com:AverageOrangeCat/$PROJECT_NAME.git" . --branch "$VERSION" >/dev/null 2>/dev/null; then
    echo "[ ERROR ] Failed to clone the repository"
    exit 1
fi

echo "................................................................ (04 / 04)"
echo "[ INFO ] You will need to add \"alias $PROJECT_NAME='bash ~/.$PROJECT_NAME/$PROJECT_NAME.sh'\" to .bashrc"
