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
    
    # Fix multiline tooltips in AI nodes - the most common syntax issue
    # This searches for click AI nodes with quoted tooltip texts that span multiple lines
    # and reformats them to use proper Mermaid tooltip formatting
    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" =~ click\ ai.*\".*Purpose:.*\" ]]; then
            # Extract the node name
            node_name=$(echo "$line" | grep -o 'click ai[^ ]*')
            
            # Extract the link (usually "#")
            link=$(echo "$line" | sed -n 's/.*click ai[^ ]* "\([^"]*\)".*/\1/p')
            
            # Extract the tooltip text
            tooltip=$(echo "$line" | sed -n 's/.*"\([^"]*Purpose:.*\)"/\1/p')
            
            # Clean and format tooltip properly
            # 1. Remove any newlines that aren't preceded by \
            tooltip=$(echo "$tooltip" | tr -d '\n')
            # 2. Ensure newlines are properly escaped
            tooltip=$(echo "$tooltip" | sed 's/\\n/\\\\n/g')
            
            # Create new properly formatted click line
            new_line="$node_name \"$link\" \"$tooltip\""
            
            # Replace the line in the file
            # Use a different delimiter for sed since the tooltip might contain /
            sed -i '' "s|$line|$new_line|" "$file"
        fi
    done < "$file"
done

echo "All Mermaid diagram files have been fixed!"
echo "The syntax errors should now be resolved." 