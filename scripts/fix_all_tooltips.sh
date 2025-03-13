#!/bin/bash

echo "Fixing all tooltip formats in Mermaid diagram files..."

# Process main consulting flow
echo "Fixing main_consulting_flow.mmd..."
sed -i '' 's/_blank//g' diagrams/main_consulting_flow.mmd

# Create temporary files to store the fixed content
mkdir -p tmp_mmd_fixes

# Process all subtree MMD files
for file in diagrams/subtrees/*.mmd; do
    base_name=$(basename "$file")
    echo "Fixing $base_name..."
    
    # Create a clean copy to work with
    cp "$file" "tmp_mmd_fixes/$base_name"
    
    # Remove _blank and _self parameters
    sed -i '' 's/" _blank"/"/g' "tmp_mmd_fixes/$base_name"
    sed -i '' 's/" _self"/"/g' "tmp_mmd_fixes/$base_name"
    
    # Fix double quotes around links
    sed -i '' 's/click mainFlow ""\.\.\/index\.html"/click mainFlow "\.\.\/index\.html"/g' "tmp_mmd_fixes/$base_name"
    sed -i '' 's/click nextPhase ""\.\.\/index\.html"/click nextPhase "\.\.\/index\.html"/g' "tmp_mmd_fixes/$base_name"
    sed -i '' 's/click parentFlow ""analysis_subtree\.html"/click parentFlow "analysis_subtree\.html"/g' "tmp_mmd_fixes/$base_name"
    sed -i '' 's/click returnToAnalysis ""analysis_subtree\.html"/click returnToAnalysis "analysis_subtree\.html"/g' "tmp_mmd_fixes/$base_name"
    
    # Now create a new file with fixed tooltip formatting
    awk '
    BEGIN { 
        in_click_directive = 0; 
        click_line = ""; 
        node = ""; 
        link = ""; 
        tooltip = "";
    }
    
    # If we detect a line starting with "click" followed by an AI node
    /^[[:space:]]*click[[:space:]]+(ai|AI)[^[:space:]]*[[:space:]]+/ {
        # Check if this is a multiline tooltip or a single line tooltip
        if ($0 ~ /".*"[[:space:]]*$/) {
            # This is a complete single-line tooltip, print it as-is
            print $0;
        } else {
            # This is the start of a multiline tooltip
            in_click_directive = 1;
            # Extract the node name and link
            match($0, /click[[:space:]]+([^[:space:]]+)[[:space:]]+"([^"]+)"/);
            node = substr($0, RSTART, RLENGTH);
            # Extract any tooltip text on this line
            if ($0 ~ /"[^"]*$/) {
                match($0, /"[^"]*$/);
                tooltip = substr($0, RSTART+1);
            }
            next;
        }
    }
    
    # If we are in a click directive, collect tooltip text
    in_click_directive == 1 {
        # Check if this line contains the closing quote of the tooltip
        if ($0 ~ /"/) {
            in_click_directive = 0;
            match($0, /^[^"]*"/);
            tooltip = tooltip "\n" substr($0, 1, RSTART+RLENGTH-1);
            
            # Clean up the tooltip text
            gsub(/\n/, "\\n", tooltip);
            gsub(/\r/, "", tooltip);
            gsub(/Click for more details\.?"?/, "", tooltip);
            
            # Print the complete click directive
            print node " \"" tooltip;
        } else {
            # Add this line to the tooltip
            tooltip = tooltip "\n" $0;
        }
        next;
    }
    
    # For all other lines, print them as-is
    { print $0; }
    ' "tmp_mmd_fixes/$base_name" > "tmp_mmd_fixes/${base_name}.fixed"
    
    # Replace the original file with the fixed one
    mv "tmp_mmd_fixes/${base_name}.fixed" "$file"
    
    # Clean up
    rm -f "tmp_mmd_fixes/$base_name"
done

# Clean up temporary directory
rmdir tmp_mmd_fixes

echo "All Mermaid diagram files have been fixed!"
echo "All tooltip formats should now be compatible with Mermaid 10.9.3." 