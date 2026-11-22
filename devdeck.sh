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
    "git")
        ./modules/git_automator.sh "$@"
        ;;
    *)
        echo "Usage: ./devdeck.sh [setup|dockerize|secrets|clean|git]"
        exit 1
        ;;
esac
