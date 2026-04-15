#!/usr/bin/env bash
#===================================================================================
# LESSON 2: Files vs Directories
#===================================================================================
# In Linux, EVERYTHING is a file. But there are two main types you'll work with:
#
# FILES:
#   - Contain DATA (text, code, images, etc.)
#   - Have extensions like .txt, .sh, .py (but extensions are optional in Linux!)
#   - Example: resume.txt, script.sh, photo.jpg
#
# DIRECTORIES (aka "folders" in Windows/Mac):
#   - Contain OTHER files and directories
#   - Think of them as CONTAINERS or DRAWERS
#   - Example: Documents/, Downloads/, Pictures/
#
# The 'ls' command lists contents of a directory
# The 'file' command tells you what type of file something is
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 2: Files vs Directories"
echo "=========================================="
echo ""

# Create a temporary playground for our experiments
PLAYGROUND="/tmp/diego_lesson_02"
echo "[DEBUG] Creating playground directory: $PLAYGROUND"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Now in: $(pwd)"
echo ""

# Debug: Create some files
echo "[DEBUG] Creating FILES (things that hold data)..."
echo "This is my resume" > resume.txt
echo "#!/bin/bash\necho hello" > script.sh
echo "123,456,789" > numbers.csv
echo ""

# Debug: Create some directories
echo "[DEBUG] Creating DIRECTORIES (containers for files)..."
mkdir -p Documents
mkdir -p Pictures
mkdir -p Documents/Work
mkdir -p Documents/Personal
echo ""

# Debug: List everything with details
echo "[DEBUG] Using 'ls -la' to see all files and directories..."
echo "Look for 'd' at the start = directory, '-' = regular file"
echo ""
ls -la
echo ""

# Debug: Show file types
echo "[DEBUG] Using 'file' command to identify file types..."
file resume.txt
file script.sh
file numbers.csv
file Documents
echo ""

# Debug: Demonstrate directories are containers
echo "[DEBUG] Directories CONTAIN things..."
echo "Contents of Documents/:"
ls -la Documents/
echo ""
echo "Contents of Documents/Work/:"
ls -la Documents/Work/
echo ""

# Debug: Show the difference visually
echo "[DEBUG] Visual representation:"
echo ""
echo "resume.txt         <-- FILE (has content)"
echo "script.sh          <-- FILE (has content)"
echo "numbers.csv        <-- FILE (has content)"
echo "Documents/         <-- DIRECTORY (contains other things)"
echo "├── Work/          <-- DIRECTORY (inside Documents)"
echo "└── Personal/      <-- DIRECTORY (inside Documents)"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. FILES hold data"
echo "2. DIRECTORIES hold files and other directories"
echo "3. 'ls' lists directory contents"
echo "4. 'ls -la' shows details (look for 'd'
