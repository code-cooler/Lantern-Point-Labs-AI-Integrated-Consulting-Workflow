#!/bin/bash

# Deploy to GitHub Pages script for Consulting Workflow Viewer

echo "==== Deploying Consulting Workflow to GitHub Pages ===="
echo "This script will help you deploy your consulting workflow to GitHub Pages"
echo "so you can share it with a single link."
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Git is not initialized. Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit"
else
    echo "Git repository already initialized."
fi

# Ask for GitHub username if not already set
git_user=$(git config --get user.name)
if [ -z "$git_user" ]; then
    echo "Please enter your GitHub username:"
    read git_user
    git config --global user.name "$git_user"
fi

# Ask for GitHub email if not already set
git_email=$(git config --get user.email)
if [ -z "$git_email" ]; then
    echo "Please enter your GitHub email:"
    read git_email
    git config --global user.email "$git_email"
fi

# Ask for repository name
echo "Please enter the name for your GitHub repository (e.g., consulting-workflow):"
read repo_name

# Check if remote already exists
if git remote | grep -q "origin"; then
    echo "Remote 'origin' already exists. Using existing remote."
    current_remote=$(git remote get-url origin)
    echo "Current remote: $current_remote"
    echo "Do you want to keep this remote? (y/n)"
    read keep_remote
    if [ "$keep_remote" != "y" ]; then
        echo "Removing existing remote 'origin'..."
        git remote remove origin
        echo "Please enter your GitHub username:"
        read github_username
        git remote add origin "https://github.com/$github_username/$repo_name.git"
        echo "Remote set to: https://github.com/$github_username/$repo_name.git"
    fi
else
    echo "Setting up GitHub remote repository..."
    echo "Please enter your GitHub username:"
    read github_username
    git remote add origin "https://github.com/$github_username/$repo_name.git"
    echo "Remote set to: https://github.com/$github_username/$repo_name.git"
fi

# Create index.html redirect in the root to point to diagrams/index.html
echo "Creating redirect from root to diagrams/index.html..."
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url=diagrams/index.html">
    <title>Redirecting to Consulting Workflow</title>
    <script>
        window.location.href = "diagrams/index.html";
    </script>
</head>
<body>
    <p>If you are not redirected automatically, follow this <a href="diagrams/index.html">link to the consulting workflow</a>.</p>
</body>
</html>
EOF

# Commit the redirect file
git add index.html
git commit -m "Add redirect from root to diagrams/index.html"

# Push to GitHub
echo "Pushing to GitHub..."
echo "Note: You will need to create a repository named '$repo_name' on GitHub first."
echo "Have you created the repository on GitHub? (y/n)"
read repo_created

if [ "$repo_created" == "y" ]; then
    git push -u origin main || git push -u origin master
    
    # Determine which branch name was used
    current_branch=$(git branch --show-current)
    
    echo ""
    echo "==== Deployment Complete! ===="
    echo "Your consulting workflow is now available at:"
    echo "https://$github_username.github.io/$repo_name/"
    echo ""
    echo "Instructions to share with others:"
    echo "1. Make sure your repository is public in GitHub settings"
    echo "2. Go to repository settings on GitHub"
    echo "3. Navigate to 'Pages' in the left sidebar"
    echo "4. Under 'Source', select branch '$current_branch'"
    echo "5. Click Save"
    echo "6. Share this link with others: https://$github_username.github.io/$repo_name/"
else
    echo "Please create the repository on GitHub first at: https://github.com/new"
    echo "Name it '$repo_name' and do not initialize it with any files."
    echo "Then run this script again."
fi 