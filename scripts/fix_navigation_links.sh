#!/bin/bash

echo "Fixing navigation links in subtree diagrams..."

# Fix intake_subtree.mmd
echo "Fixing navigation in intake_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/intake_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/kickoff_subtree.html" "Continue to next phase"|g' diagrams/subtrees/intake_subtree.mmd

# Fix kickoff_subtree.mmd
echo "Fixing navigation in kickoff_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/kickoff_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/research_subtree.html" "Continue to next phase"|g' diagrams/subtrees/kickoff_subtree.mmd

# Fix research_subtree.mmd
echo "Fixing navigation in research_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/research_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/analysis_subtree.html" "Continue to next phase"|g' diagrams/subtrees/research_subtree.mmd

# Fix analysis_subtree.mmd
echo "Fixing navigation in analysis_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/analysis_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/deliverable_subtree.html" "Continue to next phase"|g' diagrams/subtrees/analysis_subtree.mmd

# Fix analysis_ai_insights.mmd
echo "Fixing navigation in analysis_ai_insights.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/analysis_ai_insights.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/analysis_subtree.html" "Continue to next phase"|g' diagrams/subtrees/analysis_ai_insights.mmd

# Fix deliverable_subtree.mmd
echo "Fixing navigation in deliverable_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/deliverable_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/client_delivery_subtree.html" "Continue to next phase"|g' diagrams/subtrees/deliverable_subtree.mmd

# Fix client_delivery_subtree.mmd
echo "Fixing navigation in client_delivery_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/client_delivery_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/implementation_subtree.html" "Continue to next phase"|g' diagrams/subtrees/client_delivery_subtree.mmd

# Fix implementation_subtree.mmd
echo "Fixing navigation in implementation_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/implementation_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "subtrees/retrospective_subtree.html" "Continue to next phase"|g' diagrams/subtrees/implementation_subtree.mmd

# Fix retrospective_subtree.mmd
echo "Fixing navigation in retrospective_subtree.mmd..."
sed -i '' 's|click mainFlow.*|click mainFlow "../index.html" "Return to main workflow"|g' diagrams/subtrees/retrospective_subtree.mmd
sed -i '' 's|click nextPhase.*|click nextPhase "../index.html" "Return to main workflow"|g' diagrams/subtrees/retrospective_subtree.mmd

# Fix AI tooltips to ensure they use # links
echo "Fixing AI tooltips..."
for file in diagrams/subtrees/*.mmd; do
    # Extract all click commands that target AI nodes
    if grep -q "click ai" "$file"; then
        echo "  Fixing AI tooltips in $(basename "$file")..."
        # Find lines with AI click directives and ensure they use # for the link
        while read -r line; do
            # Extract the node name and tooltip text
            node=$(echo "$line" | grep -o 'click ai[^ ]*' | awk '{print $2}')
            tooltip=$(echo "$line" | sed -E 's/.*"([^"]+)".*/\1/')
            if [ -n "$node" ] && [ -n "$tooltip" ]; then
                # Create a new line with # as link but preserve tooltip
                new_line="click $node \"#\" \"$tooltip\""
                # Replace the old line with the new one
                sed -i '' "s|click $node.*|$new_line|g" "$file"
            fi
        done < <(grep "click ai" "$file")
    fi
done

echo "Navigation links fixed in all subtree diagrams!"
echo "Users should now be able to properly navigate between phases." 