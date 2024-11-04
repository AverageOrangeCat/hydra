PROJECT_TITLE=maven
ABBREVIATION=maven
VERSION=0.0.1-test

HOME_DIR=$(dirname $0)

if [ $# -ge 1 ]; then
    OPTION=$1

    if [ $OPTION = init ]; then
        shift 1
        source $HOME_DIR/scripts/maven/init.sh $@
        exit 0
    fi

    if [ $OPTION = version ]; then
        echo $VERSION
        exit 0
    fi
fi

cat << EOF
hydra maven [ OPTIONS ]
========================<[ OPTIONS ]>========================
- help       > Creates this options menu
- version    > Shows the current version of hydra:maven
EOF
