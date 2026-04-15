#!/usr/bin/env bash
#===================================================================================
# LESSON 7: Input/Output & Redirection
#===================================================================================
# Every Linux process has 3 "streams" (channels):
#
#   STDIN  (0)  <-- Input  (keyboard by default)
#   STDOUT (1)  --> Output (screen by default)
#   STDERR (2)  --> Errors  (screen by default)
#
# Redirection CHANGES where these streams go:
#
#   >    = Redirect STDOUT to file (OVERWRITE)
#   >>   = Redirect STDOUT to file (APPEND)
#   2>   = Redirect STDERR to file
#   &>   = Redirect BOTH to file
#   <    = Read STDIN from file
#   |    = Pipe (send STDOUT to another command's STDIN)
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 7: Input/Output & Redirection"
echo "=========================================="
echo ""

PLAYGROUND="/tmp/diego_lesson_07"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Playground: $(pwd)"
echo ""

# Debug: The three streams
echo "=== The Three Streams ==="
echo "[DEBUG] STDIN (0), STDOUT (1), STDERR (2)"
echo "File descriptor 0 = STDIN = input"
echo "File descriptor 1 = STDOUT = normal output"
echo "File descriptor 2 = STDERR = error output"
echo ""

# Debug: Redirect output to file (>)
echo "=== Redirect Output (> and >>) ==="
echo "[DEBUG] > OVERWRITES file..."
echo "Line 1" > output.txt
echo "Line 2" > output.txt  # This overwrites!
echo "Contents after >:"
cat output.txt
echo ""

echo "[DEBUG] >> APPENDS to file..."
echo "Line 3" >> output.txt
echo "Line 4" >> output.txt
echo "Contents after >>:"
cat output.txt
echo ""

# Debug: Redirect errors (2>)
echo "=== Redirect Errors (2>) ==="
echo "[DEBUG] Redirecting STDERR to file..."
ls /nonexistent_directory 2> errors.txt
echo "errors.txt contents:"
cat errors.txt
echo ""

echo "[DEBUG] Separate stdout and stderr:"
ls /bin > stdout.txt 2> stderr.txt
echo "stdout.txt lines: $(wc -l < stdout.txt)"
echo "stderr.txt lines: $(wc -l < stderr.txt)"
echo ""

# Debug: Redirect both (&>)
echo "=== Redirect Both (&>) ==="
echo "[DEBUG] &> sends BOTH stdout and stderr to same file..."
ls /bin /nonexistent &> both.txt
echo "both.txt lines: $(wc -l < both.txt)"
cat both.txt
echo ""

# Debug: Discard output (/dev/null)
echo "=== Discard Output ==="
echo "[DEBUG] Send output to /dev/null (black hole)..."
ls /nonexistent 2>/dev/null
echo "(No error shown! It went to /dev/null)"
echo ""

echo "[DEBUG] Discard both:"
ls /bin /nonexistent &>/dev/null
echo "(Nothing shown at all!)"
echo ""

# Debug: Input from file (<)
echo "=== Input from File (<) ==="
echo "[DEBUG] < reads from file instead of keyboard..."
echo "apple
banana
cherry" > fruits.txt
echo "Contents of fruits.txt:"
cat fruits.txt
echo ""
echo "Using < to read:"
while read fruit; do
    echo "  I like $fruit"
done < fruits.txt
echo ""

# Debug: Pipes (|)
echo "=== Pipes (|) ==="
echo "[DEBUG] | sends output of one command to input of another..."
echo "Chain: ls | grep | sort | head"
echo ""
echo "Files in /bin containing 'zip':"
ls /bin | grep zip
echo ""

echo "Count files in /bin:"
ls /bin | wc -l
echo ""

echo "Find 5 largest files in /usr/bin:"
ls -lS /usr/bin 2>/dev/null | head -6
echo ""

# Debug: Pipe examples
echo "=== More Pipe Examples ==="
echo "[DEBUG] Sort and unique:"
echo -e "banana\napple\ncherry\napple\nbanana" | sort | uniq
echo ""

echo "[DEBUG] Extract specific columns (awk):"
ls -l /bin | head -5 | awk '{print $9, $5}'
echo ""

echo "[DEBUG] Replace text (tr):"
echo "HELLO WORLD" | tr 'A-Z' 'a-z'
echo ""

# Debug: Here documents
echo "=== Here Documents ==="
echo "[DEBUG] <<EOF lets you write multi-line input..."
cat << EOF
This is a here document.
It can span multiple lines.
Variables work: $USER
The word 'EOF' ends it.
EOF
echo ""

# Debug: Tee command
echo "=== Tee (split output) ==="
echo "[DEBUG] tee sends output to BOTH file AND screen..."
echo "This goes to screen AND file" | tee tee_output.txt
echo ""
echo "File contents:"
cat tee_output.txt
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. >  = overwrite file"
echo "2. >> = append to file"
echo "3. 2> = redirect errors"
echo "4. &> = redirect both"
echo "5. <  = read from file"
echo "6. |  = pipe to another command"
echo "7. /dev/null = discard output"
echo "8. tee = output to screen AND file"
echo "9. <<EOF = multi-line input"
echo "=========================================="
