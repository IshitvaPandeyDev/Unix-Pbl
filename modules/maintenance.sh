#!/bin/bash

echo "Starting workspace maintenance..."

echo "Scanning for hidden Python cache files (__pycache__)..."
if find . -type d -name "__pycache__" | grep -q .; then
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null
    echo "Cleaned up Python caches."
else
    echo "No Python caches found."
fi

read -p "Do you want to clear all .log files in this directory? (y/n): " clear_logs
if [[ "$clear_logs" == "y" || "$clear_logs" == "Y" ]]; then
    find . -type f -name "*.log" -exec rm -f {} + 2>/dev/null
    echo "Log files removed successfully."
else
    echo "Log files preserved."
fi

echo "Maintenance complete. Workspace is clean."
