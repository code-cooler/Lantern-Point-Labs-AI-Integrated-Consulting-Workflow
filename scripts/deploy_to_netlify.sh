#!/bin/bash

# Deploy to Netlify script for Consulting Workflow Viewer

echo "==== Preparing Consulting Workflow for Netlify Deployment ===="
echo "This script will prepare your site for easy deployment to Netlify."
echo ""

# Create index.html redirect in the root
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

# Create netlify.toml configuration file
echo "Creating Netlify configuration file..."
cat > netlify.toml << 'EOF'
# Netlify configuration for Consulting Workflow

# Basic site settings
[build]
  publish = "."

# Redirect for root URL
[[redirects]]
  from = "/"
  to = "/diagrams/index.html"
  status = 302
  force = true

# Set security headers
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"
EOF

echo ""
echo "==== Site Prepared for Netlify Deployment ===="
echo ""
echo "To deploy to Netlify:"
echo "1. Go to https://app.netlify.com/drop"
echo "2. Sign up or log in to Netlify"
echo "3. Drag and drop your entire project folder onto the upload area"
echo "4. Wait for deployment to complete (usually 1-2 minutes)"
echo "5. Your site will be available at a URL like: https://random-name-123456.netlify.app"
echo "6. You can customize this URL in the Netlify dashboard"
echo ""
echo "Would you like to open the Netlify drop page now? (y/n)"
read open_netlify

if [ "$open_netlify" == "y" ]; then
    if command -v open &> /dev/null; then
        open "https://app.netlify.com/drop"
    elif command -v xdg-open &> /dev/null; then
        xdg-open "https://app.netlify.com/drop"
    elif command -v start &> /dev/null; then
        start "https://app.netlify.com/drop"
    else
        echo "Could not open browser automatically. Please visit: https://app.netlify.com/drop"
    fi
fi

echo ""
echo "After deployment, share the Netlify URL with others for instant access to your workflow." 