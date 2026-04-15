#!/bin/bash
# Homework 1: The Adder Function
# Goal: Write a function that takes two numbers and prints their sum.

# 1. Turn on Strict Mode (Debugging)
set -euxo pipefail

echo ">>> HOMEWORK 1 START <<<"

# ---------------------------------------------------------
# TODO: DIEGO, WRITE YOUR FUNCTION BELOW
# Function Name: add_numbers
# Arguments: $1 (first number), $2 (second number)
# Output: Use 'echo' to print the result
# ---------------------------------------------------------

add_numbers() {
    # Hint: Use arithmetic expansion like $(( 1 + 1 ))
    # Delete the echo below and write your code

    echo "NOT IMPLEMENTED YET"
}

# ---------------------------------------------------------
# TEST HARNESS
# Do not edit the code below this line.
# The script will automatically check if your function is correct.
# ---------------------------------------------------------

echo "Running Test Harness..."

# We use '|| true' in variable assignment so the script doesn't
# crash immediately if your function has an error. We want to see the report.

# TEST 1: Basic addition
echo "--- Test 1: Adding 5 and 10 ---"
RESULT1=$(add_numbers 5 10) || true

if [ "$RESULT1" -eq 15 ]; then
    echo "✅ PASS: Result was $RESULT1"
else
    echo "❌ FAIL: Expected 15, but got '$RESULT1'"
fi

# TEST 2: Adding with zero
echo ""
echo "--- Test 2: Adding 0 and 20 ---"
RESULT2=$(add_numbers 0 20) || true

if [ "$RESULT2" -eq 20 ]; then
    echo "✅ PASS: Result was $RESULT2"
else
    echo "❌ FAIL: Expected 20, but got '$RESULT2'"
fi

# TEST 3: Adding negative numbers
echo ""
echo "--- Test 3: Adding 50 and -50 ---"
RESULT3=$(add_numbers 50 -50) || true

if [ "$RESULT3" -eq 0 ]; then
    echo "✅ PASS: Result was $RESULT3"
else
    echo "❌ FAIL: Expected 0, but got '$RESULT3'"
fi

echo ""
echo ">>> HOMEWORK 1 FINISHED <<<"
