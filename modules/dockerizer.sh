#!/bin/bash

echo "Scanning project files..."

if [ -f "requirements.txt" ]; then
    echo "Python dependencies detected."
    
    HASH_FILE=".devdeck_deps_hash"
    CURRENT_HASH=$(md5sum requirements.txt | awk '{ print $1 }')
    
    if [ -f "$HASH_FILE" ] && [ "$CURRENT_HASH" == "$(cat $HASH_FILE)" ]; then
        echo "No changes in requirements.txt. Dockerfile is up to date."
        exit 0
    fi
    
    read -p "Dependency changes detected. Generate a new Dockerfile? (y/n): " choice
    
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        echo "Generating Python Dockerfile..."
        cat << 'DOCKER' > Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "main.py"]
DOCKER
        # Save the new fingerprint
        echo "$CURRENT_HASH" > "$HASH_FILE"
        echo "Dockerfile created successfully."
    else
        echo "Action cancelled. Dockerfile generation skipped."
    fi

else
    echo "No recognized dependencies (like requirements.txt) found."
    exit 1
fi
