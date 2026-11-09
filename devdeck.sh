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
    "clean")
        ./modules/maintenance.sh "$@"
        ;;
    *)
        echo "Usage: ./devdeck.sh [setup|dockerize|secrets|clean]"
        exit 1
        ;;
esac
