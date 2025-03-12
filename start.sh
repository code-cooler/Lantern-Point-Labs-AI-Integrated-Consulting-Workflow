#!/bin/bash

echo "Starting AI-Enhanced Consulting Workflow Viewer..."

# Check if we can launch a browser
if command -v python3 &> /dev/null; then
    echo "Starting local server on port 8090..."
    echo "View the workflow at: http://localhost:8090/diagrams/index.html"
    echo "Press Ctrl+C to stop the server"
    echo "---------------------------------------"
    python3 -m http.server 8090
elif command -v python &> /dev/null; then
    echo "Starting local server on port 8090..."
    echo "View the workflow at: http://localhost:8090/diagrams/index.html"
    echo "Press Ctrl+C to stop the server"
    echo "---------------------------------------"
    python -m SimpleHTTPServer 8090
else
    echo "Python not found. Please manually open diagrams/index.html in your browser."
    
    # Try to open the file directly with the default browser
    if command -v open &> /dev/null; then
        open diagrams/index.html
    elif command -v xdg-open &> /dev/null; then
        xdg-open diagrams/index.html
    elif command -v start &> /dev/null; then
        start diagrams/index.html
    else
        echo "Could not open browser automatically. Please manually open:"
        echo "$(pwd)/diagrams/index.html"
    fi
fi 