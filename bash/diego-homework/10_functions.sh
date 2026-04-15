#!/usr/bin/env bash
#===================================================================================
# LESSON 10: Functions
#===================================================================================
# Functions are REUSABLE blocks of code. Think of them as mini-scripts:
#
#   function_name() {
#       # code here
#   }
#
# Why use functions?
# - Avoid repeating code (DRY: Don't Repeat Yourself)
# - Organize your script into logical pieces
# - Make code easier to read and debug
# - Can take ARGUMENTS and return VALUES
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 10: Functions"
echo "=========================================="
echo ""

# Debug: Basic function
echo "=== Basic Function ==="
echo "[DEBUG] Define and call a simple function..."

greet() {
    echo "  Hello from inside the function!"
}

echo "Calling greet():"
greet
echo ""

# Debug: Function with arguments
echo "=== Function with Arguments ==="
echo "[DEBUG] Functions receive arguments just like scripts..."
echo "      \$1, \$2, \$3... inside function = function arguments"
echo "      NOT script arguments!"

greet_person() {
    local name="$1"
    local greeting="${2:-Hello}"  # Default value if not provided
    echo "  ${greeting}, ${name}!"
}

echo "Calling greet_person 'Diego':"
greet_person "Diego"
echo ""
echo "Calling greet_person 'Diego' 'Hola':"
greet_person "Diego" "Hola"
echo ""

# Debug: Return values
echo "=== Return Values ==="
echo "[DEBUG] Functions can only return NUMBERS (0-255)"
echo "      Use echo for string output, return for exit codes..."

is_even() {
    local num="$1"
    if [ $((num % 2)) -eq 0 ]; then
        return 0  # Success (true in bash)
    else
        return 1  # Failure (false in bash)
    fi
}

echo "Checking if 4 is even:"
if is_even 4; then
    echo "  4 is even!"
else
    echo "  4 is odd!"
fi

echo "Checking if 7 is even:"
if is_even 7; then
    echo "  7 is even!"
else
    echo "  7 is odd!"
fi
echo ""

# Debug: Output capture
echo "=== Capturing Function Output ==="
echo "[DEBUG] Use \$(function) to capture echoed output..."

get_square() {
    local num="$1"
    echo $((num * num))
}

RESULT=$(get_square 5)
echo "Square of 5 = $RESULT"

RESULT=$(get_square 12)
echo "Square of 12 = $RESULT"
echo ""

# Debug: Local variables
echo "=== Local Variables ==="
echo "[DEBUG] 'local' keeps variables INSIDE the function..."
echo "      Without local, variables pollute the global scope!"

demo_scope() {
    local local_var="I'm local!"
    global_var="I'm global!"
    echo "  Inside function: local_var=$local_var"
    echo "  Inside function: global_var=$global_var"
}

demo_scope
echo "Outside function: local_var=$local_var"   # Empty!
echo "Outside function: global_var=$global_var"  # Has value!
echo ""

# Debug: Recursive function
echo "=== Recursive Function ==="
echo "[DEBUG] Functions can call themselves!"
echo "      Example: factorial"

factorial() {
    local n="$1"
    if [ "$n" -le 1 ]; then
        echo 1
    else
        local prev=$(factorial $((n - 1)))
        echo $((n * prev))
    fi
}

for i in {1..6}; do
    RESULT=$(factorial "$i")
    echo "  $i! = $RESULT"
done
echo ""

# Debug: Function with multiple return values via array
echo "=== Multiple Return Values ==="
echo "[DEBUG] Return multiple values by echoing them..."

get_min_max() {
    local arr=("$@")
    local min="${arr[0]}"
    local max="${arr[0]}"
    for num in "${arr[@]}"; do
        [ "$num" -lt "$min" ] && min="$num"
        [ "$num" -gt "$max" ] && max="$num"
    done
    echo "$min $max"
}

RESULT=$(get_min_max 5 2 9 1 7 3)
MIN=$(echo "$RESULT" | awk '{print $1}')
MAX=$(echo "$RESULT" | awk '{print $2}')
echo "Numbers: 5 2 9 1 7 3"
echo "  Min: $MIN"
echo "  Max: $MAX"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. Define: name() { ... }"
echo "2. Call: name arg1 arg2"
echo "3. Arguments: \$1, \$2, \$3 inside function"
echo "4. Return codes: return 0 (success) or 1 (failure)"
echo "5. Capture output: RESULT=\$(function)"
echo "6. Use 'local' for function variables"
echo "7. Functions can be recursive"
echo "8. Echo multiple values, parse with awk"
echo "=========================================="
