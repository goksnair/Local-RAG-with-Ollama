#!/bin/bash

# Kill any existing processes on port 8000
lsof -ti:8000 | xargs kill -9 2>/dev/null || true

# Change to the project directory
cd /Users/gokulnair/Desktop/RAG-OLLAMA/Local-RAG-with-Ollama

# Start the application
echo "Starting RAG Chat Application on port 8000..."
/Users/gokulnair/Desktop/RAG-OLLAMA/.venv/bin/python -m reflex run --port 8000 --loglevel debug

echo "Application should be running at http://localhost:8000"
