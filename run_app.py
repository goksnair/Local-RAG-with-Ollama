#!/usr/bin/env python3
"""
Script to run the RAG Reflex application.
"""

import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Import and run the app
if __name__ == "__main__":
    try:
        print("Starting RAG Chat Application...")
        print("Setting up environment...")
        
        # Import the app
        from rag_gemma_reflex.rag_gemma_reflex import app
        
        print("App imported successfully!")
        print("Starting server on http://localhost:8000")
        print("Press Ctrl+C to stop the server")
        
        # Run the app
        app.run(host="0.0.0.0", port=8000, dev=True)
        
    except Exception as e:
        print(f"Error starting application: {e}")
        import traceback
        traceback.print_exc()
