#!/bin/bash

VERSION=0.0.2-test

if [ -d ~/.project-manager ]; then
    rm -fr ~/.project-manager >/dev/null 2>/dev/null
    
    if [[ $? -ne 0 ]]; then
        echo "[ ERROR ] Failed to delete '~/.project-manager' folder"
        exit 1
    fi
fi

echo "................................................................ (01 / 04)"

mkdir ~/.project-manager >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to create '~/.project-manager' folder"
    exit 1
fi

echo "................................................................ (02 / 04)"

cd ~/.project-manager >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to change to directory '~/.project-manager'"
    exit 1
fi

echo "................................................................ (03 / 04)"

git clone git@github.com:AverageOrangeCat/project-manager.git . --branch $VERSION >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ ERROR ] Failed to clone the repository"
    exit 1
fi

echo "................................................................ (04 / 04)"
echo "[ INFO ] You will need to add 'alias pm=\"bash ~/.project-manager/pm.sh\"' to .bashrc"
