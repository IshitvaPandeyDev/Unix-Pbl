#!/bin/bash

# DevDeck - Main Dispatcher
COMMAND=$1
shift

case "$COMMAND" in
    "setup")
        ./modules/workspace_setup.sh "$@"
        ;;
    *)
        echo "Usage: ./devdeck.sh [setup]"
        exit 1
        ;;
esac
