/**
 * AI Tooltip Enhancement Script
 * 
 * This script adds support for displaying AI tooltips when clicking on AI nodes.
 * It includes a simple markdown parser to format the content properly.
 */

// Simple markdown parser function
function parseMarkdown(text) {
    if (!text) return '';
    
    // First, clean up the text - replace literal '\n' with actual newlines
    let html = text.replace(/\\n/g, '\n');
    
    // Remove "Click for more details" text that's redundant with click functionality
    html = html.replace(/Click for more details\.?$/i, '');
    html = html.replace(/Click for more details\.?$/gmi, '');
    
    // Handle section headers - "Purpose:" and "Prompt example:" with proper formatting
    html = html.replace(/(Purpose:)/g, '<strong class="section-header">$1</strong>');
    html = html.replace(/(Prompt example:)/g, '<strong class="section-header">$1</strong>');
    html = html.replace(/(Expected Output:)/g, '<strong class="section-header">$1</strong>');
    html = html.replace(/(When to use:)/g, '<strong class="section-header">$1</strong>');
    
    // Handle headers - ## Header -> <h3>Header</h3>
    html = html.replace(/##\s+(.+)$/gm, '<h3>$1</h3>');
    html = html.replace(/###\s+(.+)$/gm, '<h4>$1</h4>');
    
    // Handle bold - **text** -> <strong>text</strong>
    html = html.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>');
    
    // Handle italic - *text* -> <em>text</em>
    html = html.replace(/\*([^*]+)\*/g, '<em>$1</em>');
    
    // Handle code blocks - ```code``` -> <pre><code>code</code></pre>
    html = html.replace(/```([^`]+)```/g, '<pre><code>$1</code></pre>');
    
    // Handle inline code - `code` -> <code>code</code>
    html = html.replace(/`([^`]+)`/g, '<code>$1</code>');
    
    // Handle bullet lists - * item -> <li>item</li>
    html = html.replace(/^\s*\*\s+(.+)$/gm, '<li>$1</li>');
    
    // Wrap lists in <ul> tags
    if (html.includes('<li>')) {
        html = html.replace(/(<li>.*<\/li>)/s, '<ul>$1</ul>');
    }
    
    // Split by double newlines first to identify paragraphs
    let paragraphs = html.split(/\n\s*\n/);
    
    // Process each paragraph
    for (let i = 0; i < paragraphs.length; i++) {
        // Skip if paragraph already has HTML tags
        if (!paragraphs[i].trim().startsWith('<') && !paragraphs[i].includes('<li>')) {
            // Handle single newlines within paragraphs as <br>
            paragraphs[i] = paragraphs[i].replace(/\n/g, '<br>');
            
            // Wrap in paragraph tags if not already wrapped
            if (!paragraphs[i].trim().startsWith('<')) {
                paragraphs[i] = '<p>' + paragraphs[i] + '</p>';
            }
        }
    }
    
    // Join paragraphs back together
    html = paragraphs.join('');
    
    // Fix any remaining unwrapped text
    if (!html.trim().startsWith('<')) {
        html = '<p>' + html + '</p>';
    }
    
    return html;
}

// Function to display tooltip
function showTooltip(element) {
    if (!element) return;
    
    const tooltipText = element.getAttribute('title');
    if (!tooltipText) return;
    
    const tooltip = document.getElementById('tooltip');
    if (!tooltip) return;
    
    // Format and display tooltip with markdown parsing
    tooltip.innerHTML = parseMarkdown(tooltipText);
    tooltip.style.display = 'block';
    
    // Position the tooltip
    const rect = element.getBoundingClientRect();
    tooltip.style.left = (rect.left + rect.width / 2) + 'px';
    tooltip.style.top = (rect.bottom + 10) + 'px';
    
    // Add a class to mark that this tooltip is shown on click (persistent)
    tooltip.classList.add('tooltip-clicked');
}

// Wait for DOM to be ready
document.addEventListener('DOMContentLoaded', function() {
    // Wait for Mermaid to render SVG (give it a second)
    setTimeout(function() {
        // Add click handler for AI nodes
        document.addEventListener('click', function(event) {
            // Only handle AI nodes
            if (event.target.closest('[title]') && 
                event.target.closest('.aiDecision, .aiNode, .aiInsight')) {
                
                const element = event.target.closest('[title]');
                
                // Toggle tooltip display
                const tooltip = document.getElementById('tooltip');
                if (tooltip && tooltip.style.display === 'block' && 
                    tooltip.classList.contains('tooltip-clicked')) {
                    // Hide tooltip if it's already shown via click
                    tooltip.style.display = 'none';
                    tooltip.classList.remove('tooltip-clicked');
                } else {
                    // Show tooltip
                    showTooltip(element);
                }
                
                // Prevent default behavior to avoid navigation
                event.preventDefault();
            } else if (document.getElementById('tooltip') && 
                    document.getElementById('tooltip').classList.contains('tooltip-clicked')) {
                // Hide clicked tooltip when clicking elsewhere
                document.getElementById('tooltip').style.display = 'none';
                document.getElementById('tooltip').classList.remove('tooltip-clicked');
            }
        });
        
        // Also enhance the existing mouseover tooltip functionality
        document.addEventListener('mouseover', function(event) {
            if (event.target.closest('[title]') && 
                event.target.closest('.aiDecision, .aiNode, .aiInsight')) {
                
                const element = event.target.closest('[title]');
                const tooltipText = element.getAttribute('title');
                
                if (tooltipText) {
                    const tooltip = document.getElementById('tooltip');
                    if (tooltip && !tooltip.classList.contains('tooltip-clicked')) {
                        // Only update if not currently displaying a clicked tooltip
                        tooltip.innerHTML = parseMarkdown(tooltipText);
                        tooltip.style.display = 'block';
                        
                        // Position the tooltip
                        const rect = element.getBoundingClientRect();
                        tooltip.style.left = (rect.left + rect.width / 2) + 'px';
                        tooltip.style.top = (rect.bottom + 10) + 'px';
                    }
                }
            }
        });
        
        console.log('AI tooltip support with markdown formatting added');
    }, 1000);
}); 