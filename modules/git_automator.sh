#!/bin/bash

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not inside a Git repository."
    exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
    echo "Working tree clean. Nothing to commit."
    exit 0
fi

echo "Modified and untracked files:"
git status -s
echo ""

echo "Select commit type:"
echo "1) feat  (New feature)"
echo "2) fix   (Bug fix)"
echo "3) docs  (Documentation)"
echo "4) chore (Maintenance / Refactor)"
read -p "Enter choice [1-4]: " TYPE_CHOICE

case "$TYPE_CHOICE" in
    1) PREFIX="feat" ;;
    2) PREFIX="fix" ;;
    3) PREFIX="docs" ;;
    4) PREFIX="chore" ;;
    *)
        echo "Invalid choice. Aborting."
        exit 1
        ;;
esac

read -p "Enter commit message: " COMMIT_MSG
if [ -z "$COMMIT_MSG" ]; then
    echo "Commit message cannot be empty. Aborting."
    exit 1
fi

FULL_MSG="$PREFIX: $COMMIT_MSG"
read -p "Stage all, commit as '$FULL_MSG', and push? (y/n): " CONFIRM

if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]; then
    git add .
    git commit -m "$FULL_MSG"
    git push
    echo "Changes pushed successfully."
else
    echo "Git operation cancelled."
fi
