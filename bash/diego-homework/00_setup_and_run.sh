#!/usr/bin/env bash
#===================================================================================
# SETUP SCRIPT: Run this first to make all lessons executable
#===================================================================================

set -euo pipefail

echo "=========================================="
echo "BASH FUNDAMENTALS - SETUP"
echo "For Diego's Learning Journey"
echo "=========================================="
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "[INFO] Scripts location: $SCRIPT_DIR"
echo ""

# Make all lesson scripts executable
echo "[INFO] Making scripts executable..."
for script in "$SCRIPT_DIR"/[0-9][0-9]_*.sh; do
    if [ -f "$script" ]; then
        chmod +x "$script"
        echo "  ✓ $(basename "$script")"
    fi
done
echo ""

echo "=========================================="
echo "HOW TO USE THESE LESSONS:"
echo "=========================================="
echo ""
echo "Run in order (they build on each other):"
echo ""
echo "  ./01_what_is_bash.sh"
echo "  ./02_files_vs_directories.sh"
echo "  ./03_linux_directory_structure.sh"
echo "  ./04_special_directories.sh"
echo "  ./05_basic_commands.sh"
echo "  ./06_variables.sh"
echo "  ./07_input_output_redirection.sh"
echo "  ./08_conditionals.sh"
echo "  ./09_loops.sh"
echo "  ./10_functions.sh"
echo "  ./11_practical_examples.sh"
echo "  ./12_debugging_and_set_options.sh"
echo ""
echo "TIPS:"
echo "  - Read the comments at the top of each script FIRST"
echo "  - Run each script, then read through the code"
echo "  - Try modifying things to see what happens"
echo "  - The [DEBUG] lines explain what's happening"
echo "  - set -x shows you every command as it runs"
echo ""
echo "WARNING:"
echo "  - Don't run random bash scripts from the internet!"
echo "  - These are safe because you can READ them first"
echo "  - Always understand code before running it"
echo ""
echo "Good luck, Diego! 🐧"
echo "=========================================="
