#!/usr/bin/env bash
#===================================================================================
# LESSON 12: Debugging & Set Options
#===================================================================================
# The `set` command controls bash behavior for error handling:
#
#   set -e   Exit immediately if any command fails
#   set -u   Treat unset variables as errors
#   set -x   Print every command before executing (TRACE)
#   set -o pipefail  Pipeline fails if ANY command in it fails
#
# Combined: set -euxo pipefail (what we've been using!)
#
# Why? Catches bugs EARLY instead of silently continuing.
#===================================================================================

echo "=========================================="
echo "LESSON 12: Debugging & Set Options"
echo "=========================================="
echo ""

PLAYGROUND="/tmp/diego_lesson_12"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Playground: $(pwd)"
echo ""

# Debug: WITHOUT set -e (default behavior)
echo "=== Without set -e ==="
echo "[DEBUG] Errors are IGNORED by default..."
(
    set +e  # Turn off exit on error for this subshell
    echo "  Running command that will fail..."
    ls /nonexistent_directory
    echo "  This STILL runs even though ls failed!"
    echo "  Exit code of ls was: $?"
)
echo ""

# Debug: WITH set -e
echo "=== With set -e ==="
echo "[DEBUG] Script STOPS on first error..."
(
    set -e
    echo "  Running command that will fail..."
    ls /nonexistent_directory
    echo "  THIS WILL NEVER PRINT - script already stopped!"
) || echo "  (Subshell exited with error as expected!)"
echo ""

# Debug: WITHOUT set -u
echo "=== Without set -u ==="
echo "[DEBUG] Unset variables are silently empty..."
(
    set +u
    echo "  UNDEFINED_VAR = '$UNDEFINED_VAR'"
    echo "  No error! Just empty string."
)
echo ""

# Debug: WITH set -u
echo "=== With set -u ==="
echo "[DEBUG] Unset variables cause errors..."
(
    set -u
    echo "  Trying to access UNDEFINED_VAR..."
    echo "  UNDEFINED_VAR = '$UNDEFINED_VAR'"
) 2>&1 | head -3
echo "  (Got 'unbound variable' error as expected!)"
echo ""

# Debug: set -x (trace)
echo "=== With set -x ==="
echo "[DEBUG] Prints every command BEFORE running (with + prefix)..."
echo "Watch for the '+' lines:"
(
    set -x
    NAME="Diego"
    echo "Hello $NAME"
    ls /tmp | head -2
    set +x
)
echo "(Trace mode turned off with set +x)"
echo ""

# Debug: pipefail
echo "=== pipefail ==="
echo "[DEBUG] Without pipefail, pipeline returns last command's status..."
(
    set +o pipefail
    ls /nonexistent | grep "anything"
    echo "  Exit code: $? (grep succeeded, ls failed but ignored!)"
)
echo ""

echo "[DEBUG] With pipefail, pipeline fails if ANY command fails..."
(
    set -o pipefail
    ls /nonexistent | grep "anything"
    echo "  This won't print"
) 2>/dev/null || echo "  (Pipeline failed as expected!)"
echo ""

# Debug: The magic combination
echo "=== set -euxo pipefail ==="
echo "[DEBUG] The recommended combination for ALL scripts:"
echo ""
echo "  set -e          Stop on error"
echo "  set -u          Error on undefined variable"
echo "  set -x          Print commands (for debugging)"
echo "  set -o pipefail Pipelines fail properly"
echo ""
echo "  Combined: set -euxo pipefail"
echo ""
echo "  For production, use: set -euo pipefail (without -x)"
echo "  For debugging, add -x temporarily"
echo ""

# Debug: Debugging techniques
echo "=== Debugging Techniques ==="
echo ""

echo "[DEBUG] Technique 1: echo with markers"
echo "---MARKER 1---"
echo "Variable value: TEST=$TEST"
echo "---END MARKER 1---"
echo ""

echo "[DEBUG] Technique 2: Use debug function"
debug_msg() {
    echo "[DEBUG][$(date +%H:%M:%S)][Line $BASH_LINENO] $*"
}
debug_msg "This is a debug message"
debug_msg "Variable X=$X"
echo ""

echo "[DEBUG] Technique 3: Conditional debug"
DEBUG_MODE="${DEBUG_MODE:-0}"
debug_only() {
    if [ "$DEBUG_MODE" = "1" ]; then
        echo "[DEBUG] $*"
    fi
}
debug_only "This only shows when DEBUG_MODE=1"
echo ""

echo "[DEBUG] Technique 4: Trap for cleanup"
echo "Traps let you run code when script exits/errors:"
cat << 'EOF'
    cleanup() {
        echo "Cleaning up..."
        rm -f /tmp/temp_file
    }
    trap cleanup EXIT
EOF
echo ""

# Debug: Common mistakes
echo "=== Common Mistakes ==="
echo ""
echo "[MISTAKE 1] Spaces around = in variables:"
echo "  Wrong: NAME = \"Diego\"  (runs NAME as command!)"
echo "  Right: NAME=\"Diego\""
echo ""
echo "[MISTAKE 2] Forgetting quotes:"
echo "  Wrong: cat \$FILE  (breaks on spaces in filename)"
echo "  Right: cat \"\$FILE\""
echo ""
echo "[MISTAKE 3] Not quoting variables in [ ]:"
echo "  Wrong: [ \$NAME = \"Diego\" ]  (breaks if NAME is empty)"
echo "  Right: [ \"\$NAME\" = \"Diego\" ]"
echo ""
echo "[MISTAKE 4] Using == in [ ] instead of =:"
echo "  Wrong: [ \"\$a\" == \"\$b\" ]  (works but not POSIX)"
echo "  Right: [ \"\$a\" = \"\$b\" ]"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. set -e = stop on error"
echo "2. set -u = error on undefined var"
echo "3. set -x = trace commands"
echo "4. set -o pipefail = strict pipelines"
echo "5. Use set -euo pipefail in production"
echo "6. Add -x for debugging"
echo "7. Use echo markers, debug functions"
echo "8. trap for cleanup on exit"
echo "9. ALWAYS quote your variables!"
echo "10. NO SPACES around = in assignments"
echo "=========================================="
