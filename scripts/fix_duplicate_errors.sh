#!/bin/bash

echo "Fixing duplicate catch blocks in all subtree HTML files..."

# Get all subtree HTML files
for file in diagrams/subtrees/*.html; do
    echo "Checking $file..."
    
    # Use grep to check if the file has duplicate catch blocks
    if grep -q "catch.*error.*catch.*error" "$file"; then
        echo "Found duplicate catch blocks in $file, fixing..."
        
        # Use sed to replace the duplicate pattern
        sed -i '' -E '
            /console\.error\(.Error loading diagram:., error\);/,/\}\);/ {
                /console\.error\(.Error loading diagram:., error\);/{
                    N;N;N;
                    /document\.getElementById\(.subtree-diagram.\)\.innerHTML = .div style="color: red; padding: 20px;">Error loading diagram: \$\{error\.message\}<\/div>.;/!b
                    N;
                    /\}\);/{
                        d
                    }
                }
            }
        ' "$file"
    fi
done

echo "All duplicate catch blocks have been fixed!"
echo "You can now try running the server again." 