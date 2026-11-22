# DevDeck - Modular Developer Automation Toolkit

A modular Bash CLI toolkit built for Unix Programming Lab to automate workspace scaffolding, containerization, secret protection, cleanup, and Git workflows.

## Usage

    ./devdeck.sh [command] [args]

## Modules
- setup python: Scaffolds src/, tests/, docs/, requirements.txt, and a Python venv.
- dockerize: Tracks dependency hashes via md5sum and generates a Dockerfile on approval.
- secrets: Appends environment variables to .env and enforces .gitignore protection.
- clean: Purges __pycache__ directories and prompts before clearing .log files.
- git: Stages changes, enforces conventional commit prefixes (feat, fix, docs, chore), and pushes to remote.
