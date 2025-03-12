#!/bin/bash

# Create directories if they don't exist
mkdir -p diagrams/subtrees

# Create Deliverable Production subtree
cat > diagrams/subtrees/deliverable_subtree.mmd << 'EOF'
flowchart TD
    %% Deliverable Production Subtree
    
    %% Main node connecting back to main diagram
    mainFlow(["Back to Main Flow"]) -.-> deliverable[Deliverable Production]
    
    %% Detailed steps within Deliverable phase (limited to ~5 nodes)
    deliverable --> contentOutline[Create Content Outline]
    contentOutline --> visualizationStrategy[Visualization Strategy]
    visualizationStrategy --> narrativeDevelopment[Narrative Development]
    
    %% AI Integration - Deliverable Assistant
    narrativeDevelopment --> aiDeliverableAssistant{AI Deliverable Assistant}
    aiDeliverableAssistant --> draft[Create Complete Draft]
    
    %% Review Process
    draft --> internalReview{Internal Review\nApproved?}
    internalReview -->|No| revise[Revise Draft]
    revise --> draft
    
    %% Return to main flow
    internalReview -->|Yes| nextPhase(["Continue to Client Engagement & Delivery"])
    
    %% Click interactions
    click mainFlow "../main_consulting_flow.html" "Return to main workflow" _blank
    click nextPhase "../main_consulting_flow.html" "Continue to next phase" _blank
    click aiDeliverableAssistant "#" "AI Deliverable Assistant\n\nPurpose: Refine content and generate data visualizations for clearer communication\n\nPrompt example: 'Transform these key findings into executive-friendly visualizations that highlight the three main insights. Follow our brand guidelines for color and typography.'\n\nClick for more details" _self
    
    %% Detailed Styling and Classifications
    classDef phase fill:#f5f5f5,stroke:#333,stroke-width:1px;
    classDef subProcess fill:#fff8e1,stroke:#ff8f00,stroke-width:1px;
    classDef decision fill:#e1f5fe,stroke:#0277bd,stroke-width:1px;
    classDef aiDecision fill:#ede7f6,stroke:#4527a0,stroke-width:1px,stroke-dasharray: 5 2;
    classDef navigation fill:#e8f5e9,stroke:#2e7d32,stroke-width:1px,stroke-dasharray: 3 3;
    
    %% Apply styles to nodes
    class deliverable phase;
    class contentOutline,visualizationStrategy,narrativeDevelopment,draft,revise subProcess;
    class internalReview decision;
    class aiDeliverableAssistant aiDecision;
    class mainFlow,nextPhase navigation;
EOF

# Create Client Engagement & Delivery subtree
cat > diagrams/subtrees/client_delivery_subtree.mmd << 'EOF'
flowchart TD
    %% Client Engagement & Delivery Subtree
    
    %% Main node connecting back to main diagram
    mainFlow(["Back to Main Flow"]) -.-> clientDelivery[Client Engagement\n& Delivery]
    
    %% Detailed steps within Client Engagement phase (limited to ~5 nodes)
    clientDelivery --> presentationPrep[Presentation Preparation]
    presentationPrep --> deliveryRehearsals[Delivery Rehearsals]
    deliveryRehearsals --> clientPresentation[Client Presentation]
    
    %% AI Integration - Presentation Support
    clientPresentation --> aiPresentationSupport{AI Presentation Support}
    aiPresentationSupport --> clientFeedbackSession[Client Feedback Session]
    
    %% Client Feedback Loop
    clientFeedbackSession --> clientFeedback{Client Feedback?}
    clientFeedback -->|Requires Changes| incorporateFeedback[Incorporate\nClient Feedback]
    incorporateFeedback --> aiRevisionOptimizer[AI: Revision Optimization]
    aiRevisionOptimizer --> clientFeedbackSession
    
    %% Return to main flow
    clientFeedback -->|Approved| nextPhase(["Continue to Implementation Support or Retrospective"])
    
    %% Click interactions
    click mainFlow "../main_consulting_flow.html" "Return to main workflow" _blank
    click nextPhase "../main_consulting_flow.html" "Continue to next phase" _blank
    click aiPresentationSupport "#" "AI Presentation Support\n\nPurpose: Provide real-time Q&A assistance during client presentations\n\nPrompt example: 'Based on our recommendation to [X], what data supports this approach if the client asks about [specific concern]?'\n\nClick for more details" _self
    
    %% Detailed Styling and Classifications
    classDef phase fill:#f5f5f5,stroke:#333,stroke-width:1px;
    classDef subProcess fill:#fff8e1,stroke:#ff8f00,stroke-width:1px;
    classDef decision fill:#e1f5fe,stroke:#0277bd,stroke-width:1px;
    classDef aiDecision fill:#ede7f6,stroke:#4527a0,stroke-width:1px,stroke-dasharray: 5 2;
    classDef aiNode fill:#f3e5f5,stroke:#6a1b9a,stroke-width:1px,stroke-dasharray: 5 2;
    classDef navigation fill:#e8f5e9,stroke:#2e7d32,stroke-width:1px,stroke-dasharray: 3 3;
    
    %% Apply styles to nodes
    class clientDelivery phase;
    class presentationPrep,deliveryRehearsals,clientPresentation,clientFeedbackSession,incorporateFeedback subProcess;
    class clientFeedback decision;
    class aiPresentationSupport aiDecision;
    class aiRevisionOptimizer aiNode;
    class mainFlow,nextPhase navigation;
EOF

# Create Implementation Support subtree
cat > diagrams/subtrees/implementation_subtree.mmd << 'EOF'
flowchart TD
    %% Implementation Support Subtree
    
    %% Main node connecting back to main diagram
    mainFlow(["Back to Main Flow"]) -.-> implementation[Implementation Support]
    
    %% Detailed steps within Implementation phase (limited to ~5 nodes)
    implementation --> implementationPlanning[Implementation Planning]
    implementationPlanning --> changeManagement[Change Management]
    changeManagement --> trainingDevelopment[Training Development]
    
    %% AI Integration - Implementation Assistant
    trainingDevelopment --> aiImplementationAssistant{AI Implementation Assistant}
    aiImplementationAssistant --> adoptionPrediction[AI: Adoption Prediction]
    adoptionPrediction --> personalizedTraining[AI: Personalized Training Paths]
    personalizedTraining --> implementationMonitoring[Implementation Monitoring]
    
    %% Return to main flow
    implementationMonitoring --> nextPhase(["Continue to Retrospective & Knowledge Capture"])
    
    %% Click interactions
    click mainFlow "../main_consulting_flow.html" "Return to main workflow" _blank
    click nextPhase "../main_consulting_flow.html" "Continue to next phase" _blank
    click aiImplementationAssistant "#" "AI Implementation Assistant\n\nPurpose: Predict adoption challenges and create personalized training paths\n\nPrompt example: 'Based on this organizational assessment, identify potential adoption barriers for each stakeholder group and suggest tailored change management approaches.'\n\nClick for more details" _self
    
    %% Detailed Styling and Classifications
    classDef phase fill:#f5f5f5,stroke:#333,stroke-width:1px;
    classDef subProcess fill:#fff8e1,stroke:#ff8f00,stroke-width:1px;
    classDef aiDecision fill:#ede7f6,stroke:#4527a0,stroke-width:1px,stroke-dasharray: 5 2;
    classDef aiNode fill:#f3e5f5,stroke:#6a1b9a,stroke-width:1px,stroke-dasharray: 5 2;
    classDef navigation fill:#e8f5e9,stroke:#2e7d32,stroke-width:1px,stroke-dasharray: 3 3;
    
    %% Apply styles to nodes
    class implementation phase;
    class implementationPlanning,changeManagement,trainingDevelopment,implementationMonitoring subProcess;
    class aiImplementationAssistant aiDecision;
    class adoptionPrediction,personalizedTraining aiNode;
    class mainFlow,nextPhase navigation;
EOF

# Create Retrospective & Knowledge Capture subtree
cat > diagrams/subtrees/retrospective_subtree.mmd << 'EOF'
flowchart TD
    %% Retrospective & Knowledge Capture Subtree
    
    %% Main node connecting back to main diagram
    mainFlow(["Back to Main Flow"]) -.-> retrospective[Retrospective &\nKnowledge Capture]
    
    %% Detailed steps within Retrospective phase (limited to ~5 nodes)
    retrospective --> lessonsLearned[Lessons Learned Session]
    lessonsLearned --> projectDocumentation[Project Documentation]
    projectDocumentation --> knowledgeBase[Knowledge Base Update]
    
    %% AI Integration - Knowledge Management
    knowledgeBase --> aiKnowledgeManager{AI Knowledge Management}
    aiKnowledgeManager --> patternExtraction[AI: Pattern Extraction Across Projects]
    patternExtraction --> knowledgeDistillation[AI: Knowledge Distillation]
    
    %% Return to main flow
    knowledgeDistillation --> projectEnd(["Project End"])
    
    %% Click interactions
    click mainFlow "../main_consulting_flow.html" "Return to main workflow" _blank
    click projectEnd "../main_consulting_flow.html" "Return to main workflow" _blank
    click aiKnowledgeManager "#" "AI Knowledge Management\n\nPurpose: Extract patterns across projects and distill knowledge for future engagements\n\nPrompt example: 'Compare the outcomes of this project with our previous work in [industry]. What patterns emerge regarding successful approaches, and how might we codify these into our methodology?'\n\nClick for more details" _self
    
    %% Detailed Styling and Classifications
    classDef phase fill:#f5f5f5,stroke:#333,stroke-width:1px;
    classDef subProcess fill:#fff8e1,stroke:#ff8f00,stroke-width:1px;
    classDef aiDecision fill:#ede7f6,stroke:#4527a0,stroke-width:1px,stroke-dasharray: 5 2;
    classDef aiNode fill:#f3e5f5,stroke:#6a1b9a,stroke-width:1px,stroke-dasharray: 5 2;
    classDef navigation fill:#e8f5e9,stroke:#2e7d32,stroke-width:1px,stroke-dasharray: 3 3;
    
    %% Apply styles to nodes
    class retrospective phase;
    class lessonsLearned,projectDocumentation,knowledgeBase subProcess;
    class aiKnowledgeManager aiDecision;
    class patternExtraction,knowledgeDistillation aiNode;
    class mainFlow,projectEnd navigation;
EOF

# Create HTML files based on template structure
# Function to create HTML file
create_html_file() {
    local phase="$1"
    local title="$2"
    local description="$3"
    local ai_title="$4"
    local ai_purpose="$5"
    local ai_when="$6"
    local ai_prompt="$7"
    local ai_output="$8"
    
    cat > "diagrams/subtrees/${phase}_subtree.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - Consulting Workflow</title>
    
    <!-- Load Mermaid.js from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
    
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9fafb;
        }
        
        header {
            margin-bottom: 20px;
        }
        
        h1 {
            color: #2c3e50;
            font-size: 2em;
        }
        
        .diagram-container {
            width: 100%;
            margin: 20px 0;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            overflow: auto;
        }
        
        .tooltip {
            position: absolute;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            max-width: 400px;
            z-index: 100;
            display: none;
            font-size: 14px;
            line-height: 1.4;
        }
        
        .controls {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 15px;
        }
        
        button {
            background-color: #4299e1;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
            transition: background-color 0.2s;
        }
        
        button:hover {
            background-color: #3182ce;
        }
        
        .back-to-main {
            display: block;
            margin-bottom: 20px;
            color: #4299e1;
            text-decoration: none;
            font-weight: 500;
        }
        
        .back-to-main:hover {
            text-decoration: underline;
        }
        
        .detailed-info {
            margin: 20px 0;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
        }
        
        .detailed-info h3 {
            margin-top: 0;
            color: #2c3e50;
        }
        
        .ai-integration {
            margin: 20px 0;
            padding: 15px;
            background-color: #f3e5f5;
            border-radius: 8px;
            border: 1px dashed #6a1b9a;
        }
        
        .ai-integration h3 {
            margin-top: 0;
            color: #6a1b9a;
        }
        
        .ai-prompt {
            background-color: #fff;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #e0e0e0;
            font-family: monospace;
            margin-top: 10px;
        }
        
        footer {
            margin-top: 40px;
            text-align: center;
            font-size: 0.9rem;
            color: #777;
            border-top: 1px solid #eee;
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <a href="../index.html" class="back-to-main">← Back to Main Workflow</a>
        <h1>${title}</h1>
        <p>${description}</p>
    </header>
    
    <main>
        <div class="controls">
            <button id="zoom-out">Zoom Out</button>
            <button id="zoom-in">Zoom In</button>
            <button id="reset-zoom">Reset View</button>
        </div>
        
        <div class="diagram-container">
            <div id="subtree-diagram"></div>
        </div>
        
        <div class="detailed-info">
            <h3>Phase Overview</h3>
            <p>${description}</p>
        </div>
        
        <div class="ai-integration">
            <h3>${ai_title}</h3>
            <p><strong>Purpose:</strong> ${ai_purpose}</p>
            <p><strong>When to use:</strong></p>
            <ul>
                ${ai_when}
            </ul>
            <p><strong>Example Prompt:</strong></p>
            <div class="ai-prompt">
                "${ai_prompt}"
            </div>
            <p><strong>Expected Output:</strong> ${ai_output}</p>
        </div>
    </main>
    
    <footer>
        <p>Lantern Point Labs © 2023 | <a href="../../docs/ai_consulting_guide.md">AI Consulting Guide</a></p>
    </footer>
    
    <div id="tooltip" class="tooltip"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize Mermaid
            mermaid.initialize({
                startOnLoad: true,
                theme: 'default',
                securityLevel: 'loose',
                flowchart: {
                    useMaxWidth: true,
                    htmlLabels: true,
                    curve: 'basis'
                }
            });
            
            // Load the subtree diagram
            fetch('${phase}_subtree.mmd')
                .then(response => response.text())
                .then(diagram => {
                    document.getElementById('subtree-diagram').innerHTML = diagram;
                    mermaid.init(undefined, '.mermaid');
                })
                .catch(error => console.error('Error loading diagram:', error));
            
            // Zoom functionality
            let currentZoom = 1;
            const zoomStep = 0.1;
            
            document.getElementById('zoom-in').addEventListener('click', function() {
                currentZoom += zoomStep;
                applyZoom();
            });
            
            document.getElementById('zoom-out').addEventListener('click', function() {
                currentZoom = Math.max(0.5, currentZoom - zoomStep);
                applyZoom();
            });
            
            document.getElementById('reset-zoom').addEventListener('click', function() {
                currentZoom = 1;
                applyZoom();
            });
            
            function applyZoom() {
                const svgElements = document.querySelectorAll('.diagram-container svg');
                svgElements.forEach(svg => {
                    svg.style.transform = \`scale(\${currentZoom})\`;
                    svg.style.transformOrigin = 'top center';
                });
            }
            
            // Tooltip functionality for AI nodes
            document.addEventListener('mouseover', function(event) {
                if (event.target.closest('[title]') && event.target.closest('.aiDecision, .aiNode, .aiInsight')) {
                    const element = event.target.closest('[title]');
                    const tooltipText = element.getAttribute('title');
                    
                    if (tooltipText) {
                        const tooltip = document.getElementById('tooltip');
                        tooltip.innerHTML = tooltipText.replace(/\\n/g, '<br>');
                        tooltip.style.display = 'block';
                        
                        // Position the tooltip
                        const rect = element.getBoundingClientRect();
                        tooltip.style.left = (rect.left + rect.width / 2) + 'px';
                        tooltip.style.top = (rect.bottom + 10) + 'px';
                    }
                }
            });
            
            document.addEventListener('mouseout', function(event) {
                if (event.target.closest('[title]')) {
                    document.getElementById('tooltip').style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
EOF

    echo "Created ${phase}_subtree.html"
}

# Create Deliverable Production HTML
create_html_file "deliverable" "Deliverable Production" \
    "This subtree details the steps involved in creating client deliverables with AI assistance." \
    "AI Deliverable Assistant" \
    "Refine content and generate data visualizations for clearer communication." \
    "<li>When drafting deliverable documents</li>
    <li>For complex data that needs visual representation</li>
    <li>To ensure consistency across multiple deliverables</li>" \
    "Transform these key findings into executive-friendly visualizations that highlight the three main insights. Follow our brand guidelines for color and typography." \
    "The AI will enhance content quality through refinement and generate compelling data visualizations that effectively communicate key findings."

# Create Client Engagement & Delivery HTML
create_html_file "client_delivery" "Client Engagement & Delivery" \
    "This subtree details the steps involved in presenting findings to the client and incorporating feedback." \
    "AI Presentation Support" \
    "Provide real-time Q&A assistance during client presentations." \
    "<li>During client presentations and workshops</li>
    <li>For technical presentations where detailed questions might arise</li>
    <li>When presenting complex data or recommendations</li>" \
    "Based on our recommendation to [X], what data supports this approach if the client asks about [specific concern]?" \
    "The AI will provide factual, data-backed responses to anticipated client questions, ensuring presentations run smoothly and enhancing the consultant's credibility."

# Create Implementation Support HTML
create_html_file "implementation" "Implementation Support" \
    "This subtree details the optional phase of supporting clients with implementing recommendations." \
    "AI Implementation Assistant" \
    "Predict adoption challenges and create personalized training paths." \
    "<li>During implementation planning</li>
    <li>When developing change management strategies</li>
    <li>For creating training materials for client teams</li>" \
    "Based on this organizational assessment, identify potential adoption barriers for each stakeholder group and suggest tailored change management approaches." \
    "The AI will analyze organizational data to predict potential resistance points and create personalized training and change management approaches for different stakeholder groups."

# Create Retrospective & Knowledge Capture HTML
create_html_file "retrospective" "Retrospective & Knowledge Capture" \
    "This subtree details the final phase of capturing lessons learned and knowledge for future projects." \
    "AI Knowledge Management" \
    "Extract patterns across projects and distill knowledge for future engagements." \
    "<li>During project closeout</li>
    <li>When updating knowledge bases and best practices</li>
    <li>For continuous improvement of consulting methodologies</li>" \
    "Compare the outcomes of this project with our previous work in [industry]. What patterns emerge regarding successful approaches, and how might we codify these into our methodology?" \
    "The AI will identify patterns and best practices across multiple projects, helping to codify successful approaches into the consulting methodology and knowledge base."

echo "All subtree files have been created successfully!" 