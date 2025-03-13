#!/bin/bash

echo "Fixing syntax errors in Mermaid diagram files..."

# Fix main consulting flow
echo "Checking main_consulting_flow.mmd..."
sed -i '' 's/_blank//g' diagrams/main_consulting_flow.mmd

# Fix all subtree MMD files
for file in diagrams/subtrees/*.mmd; do
    echo "Fixing $file..."
    # Fix double quotes around links - these were introduced by the previous script
    sed -i '' 's/click mainFlow ""\.\.\/index\.html"/click mainFlow "\.\.\/index\.html"/g' "$file"
    sed -i '' 's/click nextPhase ""\.\.\/index\.html"/click nextPhase "\.\.\/index\.html"/g' "$file"
    # Remove _blank parameters
    sed -i '' 's/" _blank"/"/g' "$file"
    # Remove _self parameters (not needed)
    sed -i '' 's/" _self"/"/g' "$file"
done

echo "All Mermaid diagram files have been fixed!"
echo "The syntax errors should now be resolved." 