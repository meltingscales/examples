#!/usr/bin/env bash
#===================================================================================
# LESSON 6: Variables
#===================================================================================
# Variables are NAMED STORAGE for data. Think of them as labeled boxes:
#
#   ┌─────────────┐
#   │   NAME      │
#   │  ─────────  │
#   │  "Diego"    │
#   └─────────────┘
#
# Rules:
# - No spaces around = sign:  NAME="Diego"  ✓   NAME = "Diego"  ✗
# - Use $ to GET value:       echo $NAME    ✓
# - Use ${} for clarity:      echo ${NAME}  ✓ (better in strings)
# - By convention: UPPERCASE for variables, lowercase for functions
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 6: Variables"
echo "=========================================="
echo ""

# Debug: Basic variable assignment
echo "=== Basic Variable Assignment ==="
echo "[DEBUG] Assigning variables (NO SPACES around =)..."
NAME="Diego"
AGE=25
CITY="San Francisco"
echo "NAME=$NAME"
echo "AGE=$AGE"
echo "CITY=$CITY"
echo ""

# Debug: Using variables
echo "=== Using Variables ==="
echo "[DEBUG] Access with \$ sign..."
echo "Hello, my name is $NAME!"
echo "I am $AGE years old."
echo "I live in $CITY."
echo ""

# Debug: Variable in strings
echo "=== Variables in Strings ==="
echo "[DEBUG] Double quotes ALLOW variable expansion:"
echo "Hello ${NAME}, welcome to bash!"
echo ""
echo "[DEBUG] Single quotes DO NOT expand variables:"
echo 'Hello ${NAME}, this will not expand!'
echo ""
echo "[DEBUG] Use ${} to separate variable from text:"
FRUIT="apple"
echo "I have 3 ${FRUIT}s"    # apples
echo "Without braces: I have 3 $FRUITs"  # This looks for $FRUITs (wrong!)
echo ""

# Debug: Special variables
echo "=== Built-in Variables ==="
echo "[DEBUG] These are automatically set by bash:"
echo "\$0 = script name: $0"
echo "\$# = number of arguments: $#"
echo "\$@ = all arguments: $@"
echo "\$\$ = process ID: $$"
echo "\$? = last exit code: $?"
echo "\$USER = current user: $USER"
echo "\$HOME = home directory: $HOME"
echo "\$PWD = current directory: $PWD"
echo "\$PATH = command search path:"
echo "    $PATH" | tr ':' '\n' | head -5
echo "    ... (and more)"
echo ""

# Debug: Command substitution
echo "=== Command Substitution ==="
echo "[DEBUG] \$(command) stores command output in variable..."
CURRENT_DIR=$(pwd)
echo "Current directory: $CURRENT_DIR"
echo ""

FILE_COUNT=$(ls /bin | wc -l)
echo "Files in /bin: $FILE_COUNT"
echo ""

TODAY=$(date +%Y-%m-%d)
echo "Today is: $TODAY"
echo ""

# Debug: Variable scope - export
echo "=== Export (Environment Variables) ==="
echo "[DEBUG] Regular variables are LOCAL to this script..."
MY_VAR="local value"
echo "In script: MY_VAR=$MY_VAR"
echo ""
echo "[DEBUG] 'export' makes it available to CHILD processes..."
export EXPORTED_VAR="exported value"
echo "Exported: EXPORTED_VAR=$EXPORTED_VAR"
echo "(Child scripts/processes can see this)"
echo ""

# Debug: Arrays
echo "=== Arrays ==="
echo "[DEBUG] Arrays hold MULTIPLE values..."
FRUITS=("apple" "banana" "cherry" "date")
echo "All fruits: ${FRUITS[@]}"
echo "First fruit: ${FRUITS[0]}"
echo "Second fruit: ${FRUITS[1]}"
echo "Number of fruits: ${#FRUITS[@]}"
echo ""

# Debug: Readonly variables
echo "=== Readonly Variables ==="
echo "[DEBUG] 'readonly' prevents changes..."
readonly PI=3.14159
echo "PI = $PI"
echo "(Can't change PI now - it's locked!)"
echo ""

# Debug: Unset
echo "=== Unset ==="
echo "[DEBUG] 'unset' deletes a variable..."
TEMP_VAR="temporary"
echo "Before unset: TEMP_VAR=$TEMP_VAR"
unset TEMP_VAR
echo "After unset: TEMP_VAR=$TEMP_VAR (empty!)"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. NAME=\"value\" (NO SPACES!)"
echo "2. \$NAME or \${NAME} to access"
echo "3. Double quotes expand, single don't"
echo "4. \$(command) captures output"
echo "5. export makes variable available to children"
echo "6. Arrays: ARR=(\"a\" \"b\" \"c\")"
echo "7. readonly locks a variable"
echo "8. unset deletes a variable"
echo "=========================================="
