#!/bin/bash
# Package the skill as a .skill file for Cowork installation
# Usage: bash scripts/package-skill.sh

set -e

NAME="personal-wiki-setup"
BUILD_DIR=".build"
DIST_DIR="dist"

echo "=== Packaging $NAME as .skill ==="

# Clean
rm -rf "$BUILD_DIR" "$DIST_DIR"
mkdir -p "$BUILD_DIR/$NAME" "$DIST_DIR"

# Copy skill content
cp SKILL.md "$BUILD_DIR/$NAME/"

# Create the .skill file (zip archive)
cd "$BUILD_DIR"
zip -r "../$DIST_DIR/$NAME.skill" "$NAME/"
cd ..

# Clean up build dir
rm -rf "$BUILD_DIR"

echo ""
echo "=== Done! ==="
echo "File: $DIST_DIR/$NAME.skill"
echo "Install in Cowork by dragging the .skill file into the Skills panel."
echo ""
echo "Or just share the SKILL.md directly — users can paste its content into Cowork Skills settings."
