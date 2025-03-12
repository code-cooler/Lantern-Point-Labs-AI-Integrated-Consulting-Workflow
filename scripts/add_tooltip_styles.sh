#!/bin/bash

echo "Adding tooltip styles to all subtree HTML files..."

# Get all subtree HTML files
for file in diagrams/subtrees/*.html; do
    echo "Updating $file..."
    
    # Check if the styles are already added
    if grep -q "tooltip_styles.css" "$file"; then
        echo "Styles already added to $file, skipping..."
        continue
    fi
    
    # Add the link tag in the head section before the closing </head> tag
    sed -i '' 's|</head>|    <link rel="stylesheet" href="tooltip_styles.css">\n</head>|' "$file"
done

echo "All subtree HTML files have been updated!"
echo "The tooltip styles have been added to all HTML files." 