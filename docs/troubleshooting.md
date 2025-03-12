# Troubleshooting Guide

## Common Issues with the Consulting Workflow Diagram

This document provides solutions for common issues you might encounter when viewing or modifying the Lantern Point Labs consulting workflow diagram.

### Diagram Not Rendering

If the diagram fails to render in your browser:

1. **Check Your Internet Connection**
   - The diagram requires loading Mermaid.js from a CDN, so an active internet connection is needed.

2. **Try a Different Browser**
   - We recommend using the latest versions of Chrome, Firefox, Edge, or Safari.
   - Some older browsers may not fully support all the features required.

3. **Clear Your Browser Cache**
   - Sometimes cached JavaScript files can cause issues:
     - Chrome: Settings → Privacy and Security → Clear browsing data
     - Firefox: Options → Privacy & Security → Cookies and Site Data → Clear Data
     - Edge: Settings → Privacy, search, and services → Clear browsing data
     - Safari: Preferences → Privacy → Manage Website Data → Remove All

4. **Check Developer Console**
   - Press F12 (or Cmd+Option+I on Mac) to open developer tools.
   - Check the Console tab for any error messages.
   - If you see errors related to Mermaid, include them when seeking support.

### Diagram Appears Too Small or Large

If the diagram sizing doesn't look right:

1. **Use the Zoom Controls**
   - Use the "Zoom In," "Zoom Out," and "Reset View" buttons above the diagram.

2. **Adjust Browser Zoom**
   - Most browsers allow zooming with Ctrl/Cmd + "+" or "-" keys.

3. **Try a Different Screen**
   - The diagram is responsive but may appear better on larger screens.

### SVG Export Issues

If you need to export the diagram as an image:

1. **Screenshot Method (simplest)**
   - Use your operating system's screenshot tools.
   - Windows: Win+Shift+S
   - Mac: Cmd+Shift+4
   - Then crop to the diagram area.

2. **Browser Print to PDF**
   - Use the browser's Print function (Ctrl/Cmd+P).
   - Choose "Save as PDF" as the destination.
   - Adjust settings to only capture the diagram if possible.

### Editing Diagram Issues

If you're having trouble editing the diagram:

1. **Proper Syntax**
   - Ensure you follow Mermaid's flowchart syntax exactly.
   - Check the [Mermaid documentation](https://mermaid.js.org/syntax/flowchart.html) for reference.

2. **Common Syntax Errors**
   - Missing or mismatched brackets, braces, or quotes
   - Incorrect arrow syntax (should be `-->`)
   - Spaces in node IDs (not allowed)
   - Missing closing tags for style definitions

3. **Live Editor Testing**
   - Before updating the diagram in index.html, test your changes in the [Mermaid Live Editor](https://mermaid.live/).
   - This allows you to debug syntax errors before implementing them.

4. **Backup Your Work**
   - Always save a backup copy of the working diagram before making significant changes.

### Additional Support

If you continue to experience issues:

1. **Contact Technical Support**
   - Email: support@lanternpointlabs.com
   - Include a description of the issue and any error messages
   - Add a screenshot if applicable

2. **Community Resources**
   - Visit the [Mermaid.js GitHub repository](https://github.com/mermaid-js/mermaid) for community support.
   - Check the issues section to see if others have encountered similar problems. 