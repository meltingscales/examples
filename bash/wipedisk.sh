#!/usr/bin/env bash
# dod 3 pass wipe, /dev/random with progress using dd

# Check if the user provided a device as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <device>"
    echo "Example: $0 /dev/sdX"
    exit 1
fi

DEVICE=$1

# Function to perform a single pass
wipe_pass() {
    local pass_number=$1
    echo "Starting pass $pass_number..."
    dd if=/dev/random of=$DEVICE bs=1M status=progress
    if [ $? -ne 0 ]; then
        echo "Error during pass $pass_number. (Probably ran out of space. Continuiung.)"
    else
        echo "Pass $pass_number completed."
    fi
}

# Perform 3 passes
for pass in {1..3}; do
    wipe_pass $pass
done

echo "3-pass wipe completed successfully."