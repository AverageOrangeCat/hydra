VALID_PROJECT_NAME=^\[a-z_\]+$

if [ $# -ge 1 ]; then
    PROJECT_NAME=$1

    if [[ ! $PROJECT_NAME =~ $VALID_PROJECT_NAME ]]; then
        echo "[ ERROR ] \"$PROJECT_NAME\" is not a valid project name"
        exit 1
    fi

    mkdir ./$PROJECT_NAME >/dev/null 2>/dev/null

    if [[ $? -ne 0 ]]; then
        echo "[ ERROR ] Failed to create \"./$PROJECT_NAME\" folder"
        exit 1
    fi

    exit 0
fi

cat << EOF
hydra maven init [ OPTIONS ]
========================<[ OPTIONS ]>========================
- help       > Creates this options menu
EOF
