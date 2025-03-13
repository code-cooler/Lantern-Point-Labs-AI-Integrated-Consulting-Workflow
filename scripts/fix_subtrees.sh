#!/bin/bash

echo "Fixing all subtree HTML files to properly load Mermaid diagrams..."

# Create a temporary file with the new fetch code template
cat > /tmp/new_fetch_code.txt << 'EOF'
            // Load the subtree diagram
            fetch('__FILENAME__')
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Network response was not ok, status: ${response.status}`);
                    }
                    return response.text();
                })
                .then(diagram => {
                    console.log('Subtree diagram loaded successfully:', diagram.substring(0, 100) + '...');
                    document.getElementById('subtree-diagram').innerHTML = `<pre class="mermaid">${diagram}</pre>`;
                    
                    // Re-initialize Mermaid to handle the newly added diagram
                    try {
                        mermaid.contentLoaded();
                    } catch(e) {
                        console.error('Mermaid initialization error:', e);
                        mermaid.init(undefined, '.mermaid');
                    }
                })
                .catch(error => {
                    console.error('Error loading diagram:', error);
                    document.getElementById('subtree-diagram').innerHTML = `<div style="color: red; padding: 20px;">Error loading diagram: ${error.message}</div>`;
                });
EOF

# Get all subtree HTML files
for file in diagrams/subtrees/*.html; do
    echo "Fixing $file..."
    
    # Get the base name without extension for the .mmd file reference
    base_name=$(basename "$file" .html)
    mmd_file="${base_name}.mmd"
    
    # Create a custom fetch code for this file
    sed "s|__FILENAME__|${mmd_file}|g" /tmp/new_fetch_code.txt > /tmp/this_fetch_code.txt
    
    # Create a new version of the HTML file
    awk '
    BEGIN { fetch_seen = 0; skip_mode = 0; }
    {
        if (match($0, /fetch.*\.mmd/)) {
            fetch_seen = 1;
            skip_mode = 1;
            system("cat /tmp/this_fetch_code.txt");
        } else if (skip_mode && match($0, /catch.*error/)) {
            skip_mode = 0;
            next;
        } else if (!skip_mode) {
            print $0;
        }
    }
    ' "$file" > "${file}.new"
    
    # If the file was modified, replace the original
    if [ -s "${file}.new" ]; then
        mv "${file}.new" "$file"
    else
        echo "Warning: Failed to update $file"
        rm -f "${file}.new"
    fi
done

# Clean up
rm -f /tmp/new_fetch_code.txt /tmp/this_fetch_code.txt

echo "All subtree HTML files have been updated!"
echo "Restart the server and try viewing the diagrams again."

echo "Fixing syntax errors in MMD files..."

# Fix main consulting flow
echo "Checking main_consulting_flow.mmd..."
sed -i '' 's/_blank//g' diagrams/main_consulting_flow.mmd

# Fix all subtree MMD files
for file in diagrams/subtrees/*.mmd; do
    echo "Fixing $file..."
    # Fix double quotes around links
    sed -i '' 's/click mainFlow ""\.\.\/index\.html"/click mainFlow "\.\.\/index\.html"/g' "$file"
    sed -i '' 's/click nextPhase ""\.\.\/index\.html"/click nextPhase "\.\.\/index\.html"/g' "$file"
    # Remove _blank parameters
    sed -i '' 's/_blank//g' "$file"
    # Remove _self parameters (not needed)
    sed -i '' 's/_self//g' "$file"
done

echo "All MMD files have been fixed!"
echo "The syntax errors should now be resolved." 