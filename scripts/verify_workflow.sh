#!/bin/bash

echo "Verifying AI Consulting Workflow Components..."
echo "=============================================="

# Check for required directories
echo -n "Checking directories: "
for dir in diagrams diagrams/subtrees docs scripts; do
  if [ ! -d "$dir" ]; then
    echo "FAILED"
    echo "Missing directory: $dir"
    exit 1
  fi
done
echo "OK"

# Check main files
echo -n "Checking main files: "
MAIN_FILES=(
  "diagrams/index.html"
  "diagrams/main_consulting_flow.mmd"
  "docs/ai_consulting_guide.md"
)
for file in "${MAIN_FILES[@]}"; do
  if [ ! -f "$file" ]; then
    echo "FAILED"
    echo "Missing file: $file"
    exit 1
  fi
done
echo "OK"

# Check subtree mmd files
echo -n "Checking subtree MMD files: "
SUBTREE_MMDS=(
  "diagrams/subtrees/intake_subtree.mmd"
  "diagrams/subtrees/kickoff_subtree.mmd"
  "diagrams/subtrees/research_subtree.mmd"
  "diagrams/subtrees/analysis_subtree.mmd"
  "diagrams/subtrees/analysis_ai_insights.mmd"
  "diagrams/subtrees/deliverable_subtree.mmd"
  "diagrams/subtrees/client_delivery_subtree.mmd"
  "diagrams/subtrees/implementation_subtree.mmd"
  "diagrams/subtrees/retrospective_subtree.mmd"
)
MISSING_MMDS=0
for file in "${SUBTREE_MMDS[@]}"; do
  if [ ! -f "$file" ]; then
    echo ""
    echo "Warning: Missing file: $file"
    MISSING_MMDS=$((MISSING_MMDS+1))
  fi
done
if [ $MISSING_MMDS -eq 0 ]; then
  echo "OK"
else
  echo "INCOMPLETE ($MISSING_MMDS files missing)"
fi

# Check subtree HTML files
echo -n "Checking subtree HTML files: "
SUBTREE_HTMLS=(
  "diagrams/subtrees/intake_subtree.html"
  "diagrams/subtrees/kickoff_subtree.html"
  "diagrams/subtrees/research_subtree.html"
  "diagrams/subtrees/analysis_subtree.html"
  "diagrams/subtrees/analysis_ai_insights.html"
  "diagrams/subtrees/deliverable_subtree.html"
  "diagrams/subtrees/client_delivery_subtree.html"
  "diagrams/subtrees/implementation_subtree.html"
  "diagrams/subtrees/retrospective_subtree.html"
)
MISSING_HTMLS=0
for file in "${SUBTREE_HTMLS[@]}"; do
  if [ ! -f "$file" ]; then
    echo ""
    echo "Warning: Missing file: $file"
    MISSING_HTMLS=$((MISSING_HTMLS+1))
  fi
done
if [ $MISSING_HTMLS -eq 0 ]; then
  echo "OK"
else
  echo "INCOMPLETE ($MISSING_HTMLS files missing)"
fi

# Check for proper HTML content
echo -n "Checking AI references in HTML files: "
AI_MENTIONS=0
for file in diagrams/subtrees/*.html; do
  if grep -q -e "ai-integration" -e "AI Prompt" -e "AI.*Assistant" -e "AI.*Support" "$file"; then
    AI_MENTIONS=$((AI_MENTIONS+1))
  fi
done
if [ $AI_MENTIONS -eq ${#SUBTREE_HTMLS[@]} ]; then
  echo "OK ($AI_MENTIONS files with AI integration)"
else
  echo "INCOMPLETE (Only $AI_MENTIONS files have AI integration sections)"
fi

# Check for click interactions in MMD files
echo -n "Checking click interactions in MMD files: "
CLICK_INTERACTIONS=0
for file in diagrams/subtrees/*.mmd; do
  if grep -q "click.*html" "$file"; then
    CLICK_INTERACTIONS=$((CLICK_INTERACTIONS+1))
  fi
done
if [ $CLICK_INTERACTIONS -eq ${#SUBTREE_MMDS[@]} ]; then
  echo "OK ($CLICK_INTERACTIONS files with click interactions)"
else
  echo "INCOMPLETE (Only $CLICK_INTERACTIONS files have click interactions)"
fi

echo ""
echo "Verification complete!"
echo "======================="
if [ $MISSING_MMDS -eq 0 ] && [ $MISSING_HTMLS -eq 0 ] && [ $AI_MENTIONS -eq ${#SUBTREE_HTMLS[@]} ] && [ $CLICK_INTERACTIONS -eq ${#SUBTREE_MMDS[@]} ]; then
  echo "All components are present and properly connected."
  echo "The workflow is ready to be deployed."
else
  echo "Some components are missing or incomplete."
  echo "Please run the scripts/create_remaining_subtrees.sh script to complete the workflow."
fi 