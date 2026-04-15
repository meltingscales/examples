#!/bin/bash
# Homework 3: The Downloader
# Goal: Write a function that takes a URL and downloads the content to a specified file.
# URL to use: https://drakonix.systems/api/honeypot/hits

set -euxo pipefail

echo ">>> HOMEWORK 3 START <<<"

# ---------------------------------------------------------
# TODO: DIEGO, WRITE YOUR FUNCTION BELOW
# Function Name: download_file
# Arguments:
#   $1: The URL to download
#   $2: The filename to save the data to
# Behavior:
#   1. Use 'curl' to fetch the data from $1.
#   2. Use output redirection '>' to save that data into $2.
# Hints:
#   - Command structure: curl [options] [URL] > [FILE]
#   - Add the '-s' flag to curl to make it silent (less messy output)
# ---------------------------------------------------------

download_file() {
    # Delete the lines below and write your code
    echo "URL: $1"
    echo "Filename: $2"
    echo "NOT IMPLEMENTED YET"
}

# ---------------------------------------------------------
# TEST HARNESS
# Do not edit the code below this line.
# ---------------------------------------------------------

# The URL provided in the instructions
TARGET_URL="https://drakonix.systems/api/honeypot/hits"
OUTPUT_FILE="honeypot_hits.json"

echo "--- Test 1: Downloading JSON data ---"

# We run the function.
# Note: We use || true here because if 'curl' fails (e.g. no internet),
# we want the script to continue to the error message logic rather than crashing hard.
download_file "$TARGET_URL" "$OUTPUT_FILE" || true

# Check 1: Does the file exist?
if [ -f "$OUTPUT_FILE" ]; then
    echo "✅ PASS: File '$OUTPUT_FILE' was created."
else
    echo "❌ FAIL: File '$OUTPUT_FILE' was not created."
    exit 1
fi

# Check 2: Is the file empty?
if [ -s "$OUTPUT_FILE" ]; then
    echo "✅ PASS: File contains data."
else
    echo "❌ FAIL: File is empty (download failed or was not redirected)."
    exit 1
fi

# Check 3: Does it look like JSON? (Simple check for opening brace)
if grep -q "{" "$OUTPUT_FILE"; then
    echo "✅ PASS: File appears to contain valid JSON."
    echo ""
    echo "Here is a preview of your data:"
    head -n 5 "$OUTPUT_FILE"
else
    echo "❌ FAIL: File does not look like JSON."
fi

echo ""
echo ">>> HOMEWORK 3 FINISHED <<<"
echo "You can delete the test file with: rm $OUTPUT_FILE"
