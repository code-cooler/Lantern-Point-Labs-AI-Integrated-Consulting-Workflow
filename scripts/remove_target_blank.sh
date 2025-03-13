#!/bin/bash

echo "Updating all MMD files to keep links in the same tab..."

# Update main consulting flow
if grep -q "_blank" "diagrams/main_consulting_flow.mmd"; then
    echo "Updating main_consulting_flow.mmd..."
    sed -i '' 's/"Click to see detailed.*" _blank/"Click to see detailed \1"/g' diagrams/main_consulting_flow.mmd
fi

# Update all subtree MMD files
for file in diagrams/subtrees/*.mmd; do
    echo "Checking $file..."
    if grep -q "_blank" "$file"; then
        echo "Updating $file to remove _blank targets..."
        sed -i '' 's/".*" _blank/"&"/g' "$file"
    fi
done

echo "All MMD files have been updated to keep links in the same tab!"
echo "Users will now navigate between diagrams without opening new tabs." 