#!/bin/bash

PROJECT_TITLE=hydra
ABBREVIATION=hydra
VERSION=0.0.3-test

if [ -d ~/.$PROJECT_TITLE ]; then
    rm -fr ~/.$PROJECT_TITLE >/dev/null 2>/dev/null
    
    if [[ $? -ne 0 ]]; then
        echo "[ ERROR ] Failed to delete folder: \"~/.$PROJECT_TITLE\""
        exit 1
    fi
fi

echo "................................................................ (01 / 04)"

mkdir ~/.$PROJECT_TITLE >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to create folder: \"~/.$PROJECT_TITLE\""
    exit 1
fi

echo "................................................................ (02 / 04)"

cd ~/.$PROJECT_TITLE >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to change directory: \"~/.$PROJECT_TITLE\""
    exit 1
fi

echo "................................................................ (03 / 04)"

git clone git@github.com:AverageOrangeCat/$PROJECT_TITLE.git . --branch $VERSION >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to clone the repository"
    exit 1
fi

echo "................................................................ (04 / 04)"
echo "[ INFO ] You will need to add \"alias $ABBREVIATION='bash ~/.$PROJECT_TITLE/$PROJECT_TITLE.sh'\" to .bashrc"
