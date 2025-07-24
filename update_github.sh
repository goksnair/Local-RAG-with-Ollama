#!/bin/bash

# GitHub Repository Update Script for RAG-OLLAMA Project
# This script commits and pushes changes to the repository

echo "🚀 Starting GitHub Repository Update..."
echo "======================================="

# Navigate to the project directory
cd /Users/gokulnair/Desktop/RAG-OLLAMA/Local-RAG-with-Ollama

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository!"
    echo "Initializing git repository..."
    git init
    git remote add origin https://github.com/srbhr/Local-RAG-with-Ollama.git
fi

# Check git status
echo "📊 Checking git status..."
git status

# Add all changes
echo "📝 Adding changes to git..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "ℹ️  No changes to commit"
    exit 0
fi

# Show what will be committed
echo "📋 Changes to be committed:"
git diff --staged --name-only

# Create a comprehensive commit message
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
COMMIT_MSG="🔧 Update RAG application - Python 3.13 compatibility fixes

- Modified embedding model from HuggingFaceEmbeddings to OllamaEmbeddings
- Fixed Python 3.13 compatibility issues with PyTorch/sentence-transformers
- Updated configuration to use Ollama embedding model (mxbai-embed-large)
- Added custom startup scripts for better application management
- Successfully tested with Gemma3:4b-it-qat model
- All dependencies installed and working correctly

Updated on: ${TIMESTAMP}"

# Commit the changes
echo "💾 Committing changes..."
git commit -m "$COMMIT_MSG"

# Check if commit was successful
if [ $? -eq 0 ]; then
    echo "✅ Commit successful!"
else
    echo "❌ Commit failed!"
    exit 1
fi

# Push to remote repository
echo "🌐 Pushing to remote repository..."

# Check if we have a remote origin
if git remote | grep -q origin; then
    echo "📤 Pushing to origin..."
    
    # Try to push
    if git push origin main 2>/dev/null || git push origin master 2>/dev/null; then
        echo "✅ Successfully pushed to repository!"
        echo "🎉 Repository updated successfully!"
    else
        echo "⚠️  Push failed. Trying to set upstream..."
        
        # Try to set upstream and push
        if git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null; then
            echo "✅ Successfully pushed with upstream set!"
        else
            echo "❌ Push failed. You may need to:"
            echo "   1. Check your GitHub credentials"
            echo "   2. Verify repository permissions"
            echo "   3. Make sure the remote URL is correct"
            echo ""
            echo "Current remote URL:"
            git remote -v
        fi
    fi
else
    echo "❌ No remote repository configured!"
    echo "To add a remote repository, use:"
    echo "git remote add origin <repository-url>"
fi

echo ""
echo "📊 Repository Status:"
echo "===================="
git log --oneline -n 5
echo ""
echo "🔗 Current remotes:"
git remote -v

echo ""
echo "🏁 Script completed!"
