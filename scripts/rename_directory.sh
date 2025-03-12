#!/bin/bash

# First, move up one level from the current directory
cd ..

# Current directory name
OLD_DIR="Lantern Point"
NEW_DIR="Lantern_Point"

# Check if we're in the expected location
if [ "$(basename "$(pwd)")" = "$OLD_DIR" ]; then
    echo "Error: You need to run this script from within the cursor_dt directory, not from the parent."
    exit 1
fi

# Check if the parent directory has the expected name
if [ ! -d "../$OLD_DIR" ]; then
    echo "Error: Parent directory \"$OLD_DIR\" not found."
    exit 1
fi

# Rename the directory
echo "Renaming \"$OLD_DIR\" to \"$NEW_DIR\"..."
mv "../$OLD_DIR" "../$NEW_DIR"

if [ $? -eq 0 ]; then
    echo "Successfully renamed directory."
    echo "Your new workspace path is: /Users/ryanconstantino/Desktop/$NEW_DIR/cursor_dt"
    
    # Change to the new directory
    cd "../$NEW_DIR/cursor_dt"
    echo "You are now in: $(pwd)"
else
    echo "Failed to rename directory. You may need to close any applications using files in this directory first."
fi 