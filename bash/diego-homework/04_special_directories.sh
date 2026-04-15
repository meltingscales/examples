#!/usr/bin/env bash
#===================================================================================
# LESSON 4: Special Directories & Paths
#===================================================================================
# There are some "magic" directories and path shortcuts you'll use constantly:
#
# .   = Current directory
# ..  = Parent directory (one level up)
# ~   = Your home directory
# -   = Previous directory
#
# And special paths like:
# /dev/null  = The black hole (output disappears)
# /dev/shm   = Shared memory (RAM-based filesystem!)
# /dev/zero  = Infinite zeros
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 4: Special Directories & Paths"
echo "=========================================="
echo ""

# Setup playground
PLAYGROUND="/tmp/diego_lesson_04"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"/level1/level2/level3
cd "$PLAYGROUND"
echo "[DEBUG] Starting in: $(pwd)"
echo ""

# Debug: Current directory (.)
echo "[DEBUG] The DOT (.) means 'current directory'"
echo "Current directory: $(pwd)"
echo "Same thing with dot: $(cd . && pwd)"
echo ""

# Debug: Parent directory (..)
echo "[DEBUG] DOUBLE DOT (..) means 'parent directory' (go up one level)"
cd level1/level2/level3
echo "Now in: $(pwd)"
echo "Going up with '..': $(cd .. && pwd)"
echo "Going up twice with '../..': $(cd ../.. && pwd)"
cd "$PLAYGROUND"
echo ""

# Debug: Home directory (~)
echo "[DEBUG] TILDE (~) means 'your home directory'"
echo "Your home: $HOME"
echo "Same thing: ~"
echo "Contents of ~:"
ls ~ | head -10
echo ""

# Debug: /dev/null - The Black Hole
echo "[DEBUG] /dev/null - The Black Hole"
echo "Anything sent here DISAPPEARS forever"
echo "Before: (running command that would produce output)"
ls /nonexistent 2>/dev/null && echo "found" || echo "error was silenced!"
echo "The error was sent to /dev/null - it vanished!"
echo ""

# Debug: /dev/shm - Shared Memory (RAM disk!)
echo "[DEBUG] /dev/shm - Shared Memory (SUPER FAST!)"
echo "This is a directory that lives in RAM, not on your hard drive!"
echo "Size of /dev/shm: $(df -h /dev/shm | tail -1 | awk '{print $2}')"
echo ""

echo "[DEBUG] Let's test speed difference..."
echo "Creating a 100MB file in /tmp (on disk)..."
time dd if=/dev/zero of=/tmp/diego_test_disk bs=1M count=100 2>/dev/null
echo ""

echo "Creating a 100MB file in /dev/shm (in RAM)..."
time dd if=/dev/zero of=/dev/shm/diego_test_ram bs=1M count=100 2>/dev/null
echo ""

echo "[DEBUG] Cleanup test files..."
rm -f /tmp/diego_test_disk
rm -f /dev/shm/diego_test_ram
echo ""

# Debug: When to use /dev/shm
echo "[DEBUG] When to use /dev/shm:"
echo "1. Temporary processing files (need speed)"
echo "2. Inter-process communication"
echo "3. WARNING: It's in RAM! Reboot = gone!"
echo "4. WARNING: Don't fill it up! Size is limited!"
echo ""

# Debug: /dev/zero - Infinite Zeros
echo "[DEBUG] /dev/zero - Produces infinite zero bytes"
echo "Reading 10 bytes from /dev/zero:"
dd if=/dev/zero bs=10 count=1 2>/dev/null | xxd
echo "(xxd shows hex - all zeros!)"
echo ""

# Debug: Absolute vs Relative paths
echo "[DEBUG] ABSOLUTE vs RELATIVE paths"
echo ""
echo "ABSOLUTE path: starts with /, full path from root"
echo "  Example: /home/diego/Documents/resume.txt"
echo "  Always works no matter where you are"
echo ""
echo "RELATIVE path: doesn't start with /, from current location"
echo "  Example: Documents/resume.txt (if you're in /home/diego)"
echo "  Only works from certain locations"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. . = current directory"
echo "2. .. = parent directory"
echo "3. ~ = home directory"
echo "4. /dev/null = black hole"
echo "5. /dev/shm = RAM disk (fast but temporary)"
echo "6. /dev/zero = infinite zeros"
echo "7. Absolute paths start with /"
echo "8. Relative paths don't start with /"
echo "=========================================="
