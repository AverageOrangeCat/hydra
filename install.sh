#!/bin/bash

PROJECT_NAME=hydra
VERSION=0.0.4-test

if [ -d "~/.$PROJECT_NAME" ]; then
    rm -fr "~/.$PROJECT_NAME" >/dev/null 2>/dev/null
    
    if [[ $? -ne 0 ]]; then
        echo "[ ERROR ] Failed to delete folder: \"~/.$PROJECT_NAME\""
        exit 1
    fi
fi

echo "................................................................ (01 / 04)"

mkdir "~/.$PROJECT_NAME" >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to create folder: \"~/.$PROJECT_NAME\""
    exit 1
fi

echo "................................................................ (02 / 04)"

cd "~/.$PROJECT_NAME" >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to change directory: \"~/.$PROJECT_NAME\""
    exit 1
fi

echo "................................................................ (03 / 04)"

git clone "git@github.com:AverageOrangeCat/$PROJECT_NAME.git" . --branch "$VERSION" >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to clone the repository"
    exit 1
fi

echo "................................................................ (04 / 04)"
echo "[ INFO ] You will need to add \"alias $PROJECT_NAME='bash ~/.$PROJECT_NAME/$PROJECT_NAME.sh'\" to .bashrc"
