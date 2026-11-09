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
    "secrets")
        ./modules/secret_manager.sh "$@"
        ;;
    *)
        echo "Usage: ./devdeck.sh [setup|dockerize|secrets]"
        exit 1
        ;;
esac
