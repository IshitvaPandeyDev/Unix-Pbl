#!/bin/bash

PROJECT_TYPE=$1

if [ "$PROJECT_TYPE" == "python" ]; then
    echo "Setting up Python workspace..."
    mkdir -p src tests docs
    python3 -m venv venv
    touch requirements.txt
    echo "Workspace generated successfully."
else
    echo "Please specify a valid project type. Example: ./devdeck.sh setup python"
    exit 1
fi
