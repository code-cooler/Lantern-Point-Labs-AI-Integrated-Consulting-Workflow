# AI-Enhanced Consulting Workflow

This project provides an interactive, multi-level consulting workflow that visually represents the AI-enhanced consulting process. It's designed to help consultants understand where and how to integrate AI throughout the consulting engagement lifecycle.

## Overview

The consulting workflow is visualized as a series of interconnected diagrams using Mermaid.js. The main workflow provides a high-level overview of the entire consulting process, while subtree diagrams offer detailed breakdowns of each phase.

Key features:
- **Interactive Navigation**: Click through different phases of the consulting process
- **AI Integration Points**: Clearly marked touchpoints where AI can enhance consulting work
- **Modular Structure**: Each phase is represented as a separate diagram for easy understanding
- **Detailed Guidance**: Specific prompts and expected outputs for each AI integration point

## Getting Started

To use the workflow:

1. Open `diagrams/index.html` in your browser
2. Navigate through the main workflow
3. Click on any phase to see a detailed breakdown of that phase
4. Explore AI integration points for specific guidance

Alternatively, you can start a local server:

```bash
./start.sh
```

Then open http://localhost:8090/diagrams/index.html in your browser.

## Workflow Structure

The consulting workflow consists of the following phases:

1. **Project Intake & Scoping**
   - Client needs assessment
   - Proposal development
   - SOW creation
   - AI-enhanced scoping

2. **Kickoff & Alignment**
   - Project planning
   - Stakeholder mapping
   - AI-driven project plan optimization
   
3. **Research & Problem Definition**
   - Data collection
   - Stakeholder interviews
   - Market research
   - Problem definition workshop
   - AI research enhancement

4. **Analysis & Synthesis**
   - Data analysis
   - Insight generation
   - Hypothesis development
   - AI pattern recognition and insight generation
   
5. **Deliverable Production**
   - Content outline
   - Visualization strategy
   - Narrative development
   - AI deliverable assistance

6. **Client Engagement & Delivery**
   - Presentation preparation
   - Client presentation
   - AI presentation support
   - Feedback incorporation
   
7. **Implementation Support** (Optional)
   - Implementation planning
   - Change management
   - AI implementation assistance
   
8. **Retrospective & Knowledge Capture**
   - Lessons learned
   - Knowledge base updates
   - AI knowledge management

## AI Integration Points

Throughout the workflow, AI integration points are highlighted with purple diamond shapes. Each integration point includes:

- **Purpose**: What the AI is helping accomplish
- **When to use**: Specific situations where AI adds value
- **Example prompt**: Sample language to use when working with AI
- **Expected output**: What to expect from the AI in response

## Project Organization

The project is organized as follows:

- `diagrams/`: Contains all diagram files
  - `index.html`: Main entry point for the visualization
  - `main_consulting_flow.mmd`: Main workflow diagram with links to subtrees
  - `detailed_consulting_flow.mmd`: Detailed version of the complete workflow
  - `subtrees/`: Detailed diagrams for each phase

- `docs/`: Documentation files
  - `ai_consulting_guide.md`: Detailed guidance on AI integration
  - `decision_tree_guide.md`: Guide for using decision trees in consulting
  - `consultant_tips.md`: Tips for consultants
  - `troubleshooting.md`: Help with common issues

- `scripts/`: Utility scripts
  - `verify_workflow.sh`: Check that all components are present
  - `create_remaining_subtrees.sh`: Generate new subtree templates
  - Other utility scripts for maintenance

- `start.sh`: Script to start a local server for viewing the workflow

## Customization

All diagrams are written in Mermaid markdown (.mmd files) which can be easily edited to customize the workflow. HTML wrappers provide the interactive features.

To customize:
1. Edit the corresponding .mmd file for content changes
2. Edit the .html file for styling or interaction changes

## Development

If you want to extend the workflow:

1. Use the `scripts/create_remaining_subtrees.sh` script to generate templates for new subtrees
2. Use the `scripts/verify_workflow.sh` script to check for completeness
3. Each subtree should include:
   - A Mermaid diagram (.mmd file)
   - An HTML wrapper (.html file)
   - At least one AI integration point
   - Navigation back to the main workflow

## Viewing Offline

This workflow is designed to work completely offline. All dependencies (Mermaid.js) are loaded via CDN, but you can modify the HTML files to use local copies if needed.

## Documentation

For additional information, see:
- `docs/ai_consulting_guide.md` - Detailed guidance on AI integration
- The HTML files for each subtree contain specific guidance for that phase 