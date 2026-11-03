#!/bin/bash

COMMAND=$1
shift

case "$COMMAND" in
    "setup")
        ./modules/workspace_setup.sh "$@"
        ;;
    "dockerize")
        ./modules/dockerizer.sh "$@"
        ;;
    *)
        echo "Usage: ./devdeck.sh [setup|dockerize]"
        exit 1
        ;;
esac
