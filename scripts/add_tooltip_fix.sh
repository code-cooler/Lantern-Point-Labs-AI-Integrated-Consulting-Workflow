#!/bin/bash

echo "Adding tooltip fix script to all subtree HTML files..."

# Get all subtree HTML files
for file in diagrams/subtrees/*.html; do
    echo "Updating $file..."
    
    # Check if the script is already added
    if grep -q "fix_ai_tooltips.js" "$file"; then
        echo "Script already added to $file, skipping..."
        continue
    fi
    
    # Add the script tag before the closing </body> tag
    sed -i '' 's|</body>|    <script src="fix_ai_tooltips.js"></script>\n</body>|' "$file"
done

echo "All subtree HTML files have been updated!"
echo "The tooltip fix script has been added to all HTML files." 