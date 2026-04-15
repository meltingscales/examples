#!/bin/bash
# Homework 2: The Countdown Timer
# Goal: Write a function that takes a number and counts down to 1, then prints "Time is up!".
# If the number is 0 or negative, it should print "Invalid number".

set -euxo pipefail

echo ">>> HOMEWORK 2 START <<<"

# ---------------------------------------------------------
# TODO: DIEGO, WRITE YOUR FUNCTION BELOW
# Function Name: launch_timer
# Argument: $1 (An integer representing seconds)
# Behavior:
#   1. If $1 is less than 1, print "Invalid number"
#   2. Otherwise, print the number, then number-1, ..., down to 1.
#   3. Finally, print "Time is up!"
# Hints:
#   - Use a 'while' loop.
#   - Use arithmetic $(( ... )) to subtract.
# ---------------------------------------------------------

launch_timer() {
    # Delete the line below and write your code
    echo "NOT IMPLEMENTED YET"
}

# ---------------------------------------------------------
# TEST HARNESS
# Do not edit the code below this line.
# We capture the output to check your logic.
# ---------------------------------------------------------

echo "--- Test 1: Countdown from 3 ---"
# We use '|| true' so the script doesn't crash if your function errors immediately.
OUTPUT1=$(launch_timer 3) || true

# We check if the output contains the expected numbers and text in order
if echo "$OUTPUT1" | grep -q "3" && \
   echo "$OUTPUT1" | grep -q "2" && \
   echo "$OUTPUT1" | grep -q "1" && \
   echo "$OUTPUT1" | grep -q "Time is up!"; then
    echo "✅ PASS: Countdown worked."
    echo "   Output was:"
    echo "$OUTPUT1"
else
    echo "❌ FAIL: Countdown logic incorrect."
    echo "   Expected 3, 2, 1, Time is up!"
    echo "   Got: $OUTPUT1"
fi

echo ""
echo "--- Test 2: Invalid number (0) ---"
OUTPUT2=$(launch_timer 0) || true

if echo "$OUTPUT2" | grep -q "Invalid number"; then
    echo "✅ PASS: Invalid number handled correctly."
else
    echo "❌ FAIL: Should have handled 0 as Invalid."
    echo "   Got: $OUTPUT2"
fi

echo ""
echo "--- Test 3: Countdown from 1 ---"
OUTPUT3=$(launch_timer 1) || true

if echo "$OUTPUT3" | grep -q "1" && \
   echo "$OUTPUT3" | grep -q "Time is up!"; then
    echo "✅ PASS: Single step countdown worked."
else
    echo "❌ FAIL: Single step failed."
    echo "   Got: $OUTPUT3"
fi

echo ""
echo ">>> HOMEWORK 2 FINISHED <<<"
