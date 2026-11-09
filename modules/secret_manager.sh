#!/bin/bash

echo "Securing environment variables..."

# Create .env if it doesn't exist
if [ ! -f ".env" ]; then
    touch .env
    echo "Created new .env file."
fi

# Prompt user for a new secret
read -p "Enter variable name (e.g., DATABASE_URL): " KEY_NAME
read -p "Enter value for $KEY_NAME: " KEY_VALUE

echo "$KEY_NAME=$KEY_VALUE" >> .env
echo "Saved $KEY_NAME to .env."

# Automatically protect it from Git
if [ ! -f ".gitignore" ]; then
    touch .gitignore
fi

if ! grep -q "^.env$" .gitignore; then
    echo ".env" >> .gitignore
    echo "Security applied: .env added to .gitignore."
else
    echo "Security check: .env is already protected."
fi
