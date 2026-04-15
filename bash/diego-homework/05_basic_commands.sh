#!/usr/bin/env bash
#===================================================================================
# LESSON 5: Basic Commands
#===================================================================================
# These are the commands you'll use EVERY DAY:
#
# Navigation:     pwd, cd, ls
# File creation:  touch, mkdir
# File viewing:   cat, head, tail, less
# File copying:   cp
# File moving:    mv
# File deletion:  rm
# Finding things: find, which
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 5: Basic Commands"
echo "=========================================="
echo ""

# Setup playground
PLAYGROUND="/tmp/diego_lesson_05"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Playground: $(pwd)"
echo ""

# Debug: pwd - Print Working Directory
echo "=== pwd - Print Working Directory ==="
echo "[DEBUG] Where am I?"
pwd
echo ""

# Debug: mkdir - Make Directory
echo "=== mkdir - Make Directory ==="
echo "[DEBUG] Creating directories..."
mkdir projects
mkdir -p projects/web projects/cli projects/data  # -p = parents, no error if exists
echo "Created:"
ls -la
echo ""

# Debug: touch - Create empty file or update timestamp
echo "=== touch - Create/Update Files ==="
echo "[DEBUG] Creating empty files..."
touch projects/web/index.html
touch projects/web/style.css
touch projects/cli/app.sh
touch projects/data/numbers.txt
echo "Created:"
find projects -type f
echo ""

# Debug: cd - Change Directory
echo "=== cd - Change Directory ==="
echo "[DEBUG] Navigating around..."
cd projects/web
echo "Now in: $(pwd)"
cd ../cli
echo "Now in: $(pwd)"
cd "$PLAYGROUND"  # Always use full path to go back to known location
echo "Back to: $(pwd)"
echo ""

# Debug: cat - Concatenate (and display)
echo "=== cat - Display File Contents ==="
echo "[DEBUG] Writing and reading files..."
cat > projects/data/numbers.txt << 'EOF'
1
2
3
4
5
6
7
8
9
10
EOF
echo "Contents of numbers.txt:"
cat projects/data/numbers.txt
echo ""

# Debug: head and tail
echo "=== head and tail - First/Last Lines ==="
echo "[DEBUG] First 3 lines:"
head -3 projects/data/numbers.txt
echo ""
echo "[DEBUG] Last 3 lines:"
tail -3 projects/data/numbers.txt
echo ""

# Debug: cp - Copy
echo "=== cp - Copy Files/Directories ==="
echo "[DEBUG] Copying files..."
cp projects/data/numbers.txt projects/data/numbers_backup.txt
echo "After copy:"
ls projects/data/
echo ""
echo "[DEBUG] Copying directories (need -r for recursive!):"
cp -r projects/web projects/web_backup
echo "After copy:"
ls projects/
echo ""

# Debug: mv - Move (or rename)
echo "=== mv - Move/Rename ==="
echo "[DEBUG] Renaming a file..."
mv projects/data/numbers_backup.txt projects/data/backup.txt
echo "After rename:"
ls projects/data/
echo ""
echo "[DEBUG] Moving a file to different directory..."
mv projects/data/backup.txt projects/cli/
echo "After move:"
ls projects/cli/
echo ""

# Debug: rm - Remove (DANGEROUS!)
echo "=== rm - Remove (USE WITH CARE!) ==="
echo "[DEBUG] Removing a file..."
rm projects/cli/backup.txt
echo "After removal:"
ls projects/cli/
echo ""
echo "[DEBUG] Removing a directory (need -r for recursive!):"
rm -r projects/web_backup
echo "After removal:"
ls projects/
echo ""
echo "[WARN] rm -rf is VERY dangerous! -r = recursive, -f = force"
echo "       'rm -rf /' would delete EVERYTHING! Don't do it!"
echo ""

# Debug: which - Find where a command lives
echo "=== which - Find Command Location ==="
echo "[DEBUG] Where do these commands live?"
which bash
which ls
which python3 2>/dev/null || echo "python3 not found"
echo ""

# Debug: find - Find files
echo "=== find - Find Files ==="
echo "[DEBUG] Find all files in projects:"
find projects -type f
echo ""
echo "[DEBUG] Find all directories in projects:"
find projects -type d
echo ""
echo "[DEBUG] Find all .html files:"
find projects -name "*.html"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. pwd = where am I?"
echo "2. cd = go somewhere"
echo "3. ls = list contents"
echo "4. mkdir -p = make directory tree"
echo "5. touch = create empty file"
echo "6. cat = show file contents"
echo "7. head/tail = first/last lines"
echo "8. cp -r = copy (use -r for directories)"
echo "9. mv = move or rename"
echo "10. rm -r = delete (BE CAREFUL!)"
echo "11. which = where is a command?"
echo "12. find = search for files"
echo "=========================================="
