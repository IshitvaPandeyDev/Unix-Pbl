#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMAND=$1
shift

case "$COMMAND" in
    "setup")
        "$SCRIPT_DIR/modules/workspace_setup.sh" "$@"
        ;;
    "dockerize")
        "$SCRIPT_DIR/modules/dockerizer.sh" "$@"
        ;;
    "secrets")
        "$SCRIPT_DIR/modules/secret_manager.sh" "$@"
        ;;
    "clean")
        "$SCRIPT_DIR/modules/maintenance.sh" "$@"
        ;;
    "git")
        "$SCRIPT_DIR/modules/git_automator.sh" "$@"
        ;;
    *)
        echo "Usage: ./devdeck.sh [setup|dockerize|secrets|clean|git]"
        exit 1
        ;;
esac
