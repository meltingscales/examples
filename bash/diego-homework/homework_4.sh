#!/bin/bash
# Homework 4: Live JSON Inspector (Schema Edition)
# Goal: Download the honeypot data and use 'jq' to extract specific fields.

set -euxo pipefail

echo ">>> HOMEWORK 4 START <<<"

# ---------------------------------------------------------
# SETUP: Download the live data
# ---------------------------------------------------------
API_URL="https://drakonix.systems/api/honeypot/hits"
FILE_NAME="honeypot_hits.json"

echo "Downloading data from $API_URL..."
# We download the file here so you can use it in your function.
curl -s "$API_URL" > "$FILE_NAME"

if [ ! -s "$FILE_NAME" ]; then
    echo "Error: Download failed or file is empty. Check your internet."
    exit 1
fi

echo "Download complete."

# ---------------------------------------------------------
# TODO: DIEGO, WRITE YOUR FUNCTION BELOW
# Function Name: analyze_attacks
# Arguments:
#   $1: The JSON filename
#
# SCHEMA DEFINITION:
# The file contains a list of "HoneypotHit" objects. Each object has these keys:
# - body (string)
# - country (string)
# - headers (string)
# - id (integer)
# - ip (string)
# - org (string)
# - slug (string)
# - timestamp (string)
#
# TASKS:
# 1. Print the total number of hits (using length).
# 2. Print the 'ip' address of the FIRST attack.
# 3. Print the 'country' of the FIRST attack.
#
# HINTS:
# - To get a field: jq '.field'
# - To get a field from the FIRST item: jq '.[0].field'
# ---------------------------------------------------------

analyze_attacks() {
    local filename=$1

    echo "--- Total Hits ---"
    # YOUR CODE HERE: Use jq to count the list length
    echo "NOT IMPLEMENTED"

    echo ""
    echo "--- First Attacker IP ---"
    # YOUR CODE HERE: Use jq to extract the 'ip' field from index 0
    echo "NOT IMPLEMENTED"

    echo ""
    echo "--- First Attacker Country ---"
    # YOUR CODE HERE: Use jq to extract the 'country' field from index 0
    echo "NOT IMPLEMENTED"
}

# ---------------------------------------------------------
# TEST HARNESS
# ---------------------------------------------------------

echo "Running Tests..."

# Capture output
OUTPUT=$(analyze_attacks "$FILE_NAME")

# TEST 1: Check if he found a count
if echo "$OUTPUT" | grep -qE "[0-9]+"; then
    echo "✅ PASS: Found a count number."
else
    echo "❌ FAIL: Did not find a number. Did you use '. | length'?"
fi

# TEST 2: Check if he extracted an IP address
# This simple regex checks for digits and dots (e.g. 192.168.1.1)
if echo "$OUTPUT" | grep -qE "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"; then
    echo "✅ PASS: Extracted an IP address."
else
    echo "❌ FAIL: Did not find an IP address. Did you use '.[0].ip'?"
fi

# TEST 3: Check if he extracted a country (usually a 2 letter code or full string)
if echo "$OUTPUT" | grep -q "country"; then
    # We just check if the label "country" exists or if the value isn't empty
    echo "✅ PASS: Looks like country data was extracted."
else
    echo "❌ FAIL: Did not find country data. Did you use '.[0].country'?"
fi

echo ""
echo ">>> HOMEWORK 4 FINISHED <<<"
echo "You can keep the JSON file or run: rm $FILE_NAME"
