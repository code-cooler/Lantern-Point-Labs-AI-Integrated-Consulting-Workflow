# Consulting Workflow Deployment Guide

This guide provides instructions on how to deploy your Consulting Workflow diagrams so that you can share them with others through a single link, without requiring them to download files or run any commands.

## Deployment Options

There are two recommended deployment options:

1. **GitHub Pages** - Free hosting directly from your GitHub repository
2. **Netlify** - Free hosting with an even simpler deployment process (drag and drop)

## Option 1: GitHub Pages Deployment

### Prerequisites
- A GitHub account
- Git installed on your computer

### Deployment Steps

1. **Run the deployment script**:
   ```
   ./scripts/deploy_to_github_pages.sh
   ```

2. **Follow the prompts** in the script, which will:
   - Ask for your GitHub username
   - Ask for a repository name
   - Create a root-level redirect to your main diagram
   - Help you set up the GitHub remote repository

3. **Create a repository on GitHub**:
   - Go to [https://github.com/new](https://github.com/new)
   - Create a new repository with the same name you provided to the script
   - Do not initialize it with a README or any other files

4. **Complete the deployment**:
   - Return to the script and confirm you've created the repository
   - The script will push your code to GitHub

5. **Enable GitHub Pages**:
   - Go to your repository on GitHub
   - Click on "Settings"
   - Scroll down to "GitHub Pages" section
   - Select the branch (main or master) as the source
   - Click Save

6. **Access your deployed workflow**:
   Your workflow will be available at:
   ```
   https://your-username.github.io/your-repo-name/
   ```

## Option 2: Netlify Deployment (Easiest)

### Prerequisites
- A Netlify account (free to create)

### Deployment Steps

1. **Run the Netlify preparation script**:
   ```
   ./scripts/deploy_to_netlify.sh
   ```

2. **Deploy to Netlify**:
   - Go to [https://app.netlify.com/drop](https://app.netlify.com/drop)
   - Sign up or log in to Netlify
   - Drag and drop your entire project folder onto the upload area
   - Wait for deployment to complete (usually takes 1-2 minutes)

3. **Access your deployed workflow**:
   Your workflow will be available at the URL provided by Netlify, which looks like:
   ```
   https://random-name-123456.netlify.app
   ```

4. **Customize your URL** (optional):
   - In the Netlify dashboard, click on "Domain settings"
   - Under "Custom domains", click "Options" → "Edit site name"
   - Enter a more meaningful name like "consulting-workflow"

## Sharing Your Workflow

Once deployed, simply share the URL with anyone you want to have access to the workflow. They will be able to:

- View all diagrams
- Navigate between different phases
- Interact with AI integration points
- See the tooltips and explanations
- All without installing anything or downloading files

## Updating Your Deployed Workflow

### Updating on GitHub Pages

After making changes to your workflow:

1. Commit your changes:
   ```
   git add .
   git commit -m "Description of changes"
   ```

2. Push to GitHub:
   ```
   git push origin main
   ```

Your changes will be automatically deployed.

### Updating on Netlify

After making changes:

1. Go to [https://app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag and drop your updated project folder
3. Netlify will deploy a new version while keeping the same URL

## Troubleshooting

If your deployment doesn't work as expected:

1. **Check file paths**: Make sure all links between files use relative paths correctly.
2. **Check browser console**: Open your browser's developer tools to check for any errors.
3. **Verify GitHub Pages settings**: Make sure you've selected the correct branch as the source.
4. **Check Netlify deploy logs**: In the Netlify dashboard, check the deploy logs for any errors. 