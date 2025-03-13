#!/bin/bash

echo "==== Consulting Workflow Deployment Tool ===="
echo "This script will help you share your workflow with others via a single link."
echo ""
echo "Choose a deployment option:"
echo "1) GitHub Pages (requires GitHub account & git setup)"
echo "2) Netlify (easiest option, just drag & drop)"
echo "3) View deployment guide"
echo "q) Quit"
echo ""
echo "Enter your choice (1, 2, 3, or q):"
read choice

case $choice in
    1)
        echo "Starting GitHub Pages deployment..."
        ./scripts/deploy_to_github_pages.sh
        ;;
    2)
        echo "Starting Netlify deployment preparation..."
        ./scripts/deploy_to_netlify.sh
        ;;
    3)
        echo "Opening deployment guide..."
        if command -v open &> /dev/null; then
            open "docs/deployment_guide.md"
        elif command -v xdg-open &> /dev/null; then
            xdg-open "docs/deployment_guide.md"
        elif command -v start &> /dev/null; then
            start "docs/deployment_guide.md"
        else
            echo "Could not open the guide automatically."
            echo "Please open docs/deployment_guide.md in your text editor."
        fi
        ;;
    q|Q)
        echo "Exiting deployment tool."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        exit 1
        ;;
esac 