if [ $# -ge 1 ]; then
    echo "Init ..."
    exit 0
fi

cat << EOF
hydra maven init [ OPTIONS ]
========================<[ OPTIONS ]>========================
- help       > Creates this options menu
EOF
