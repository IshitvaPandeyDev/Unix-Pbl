#!/bin/bash

PROJECT_TYPE=$1

if [ -z "$PROJECT_TYPE" ]; then
    echo "Error: Please specify a project type."
    echo "Usage: ./devdeck.sh setup [python|cpp|node|java]"
    exit 1
fi

case "$PROJECT_TYPE" in
    "python")
        echo "Scaffolding Python workspace..."
        mkdir -p src tests docs
        touch requirements.txt
        if command -v python3 > /dev/null 2>&1; then
            python3 -m venv venv
            echo "Python virtual environment (venv) created."
        elif command -v python > /dev/null 2>&1; then
            python -m venv venv
            echo "Python virtual environment (venv) created."
        else
            echo "Warning: Python not found, skipped venv creation."
        fi
        echo "Python workspace ready (src/, tests/, docs/, requirements.txt)."
        ;;
    "cpp")
        echo "Scaffolding C++ workspace..."
        mkdir -p src include build
        cat << 'CPP' > src/main.cpp
#include <iostream>

int main() {
    std::cout << "Hello from DevDeck C++ workspace!" << std::endl;
    return 0;
}
CPP
        printf "CXX = g++\nCXXFLAGS = -std=c++17 -Wall -Iinclude\n\nall:\n\t\$(CXX) \$(CXXFLAGS) src/main.cpp -o build/app\n\nclean:\n\trm -rf build/*\n" > Makefile
        echo "C++ workspace ready (src/main.cpp, include/, build/, Makefile)."
        ;;
    "node")
        echo "Scaffolding Node.js workspace..."
        mkdir -p src public tests
        echo 'console.log("Hello from DevDeck Node.js workspace!");' > src/index.js
        if command -v npm > /dev/null 2>&1; then
            npm init -y > /dev/null 2>&1
        else
            touch package.json
        fi
        echo "Node.js workspace ready (src/index.js, public/, tests/, package.json)."
        ;;
    "java")
        echo "Scaffolding Java workspace..."
        mkdir -p src bin lib
        cat << 'JAVA' > src/Main.java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from DevDeck Java workspace!");
    }
}
JAVA
        echo "Java workspace ready (src/Main.java, bin/, lib/)."
        ;;
    *)
        echo "Unsupported project type: '$PROJECT_TYPE'"
        echo "Supported types: python, cpp, node, java"
        exit 1
        ;;
esac
