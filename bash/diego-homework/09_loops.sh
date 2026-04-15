#!/usr/bin/env bash
#===================================================================================
# LESSON 9: Loops
#===================================================================================
# Loops let you REPEAT actions:
#
# FOR loop:  Repeat for each item in a list
# WHILE loop: Repeat while condition is true
# UNTIL loop: Repeat until condition becomes true
#
# WARNING: Always have an exit condition, or you get an infinite loop!
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 9: Loops"
echo "=========================================="
echo ""

PLAYGROUND="/tmp/diego_lesson_09"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Playground: $(pwd)"
echo ""

# Debug: Basic for loop
echo "=== Basic For Loop ==="
echo "[DEBUG] Iterate over a list..."
for FRUIT in apple banana cherry; do
    echo "  I like $FRUIT"
done
echo ""

# Debug: For loop with range
echo "=== For Loop with Range ==="
echo "[DEBUG] {START..END} generates a sequence..."
for NUM in {1..5}; do
    echo "  Number: $NUM"
done
echo ""

echo "[DEBUG] {START..END..STEP} with step..."
for NUM in {0..10..2}; do
    echo "  Even: $NUM"
done
echo ""

# Debug: For loop over files
echo "=== For Loop Over Files ==="
echo "[DEBUG] Loop through files in directory..."
touch file1.txt file2.txt file3.txt

for FILE in *.txt; do
    echo "  Found file: $FILE"
done
echo ""

# Debug: For loop over command output
echo "=== For Loop Over Command Output ==="
echo "[DEBUG] Loop through command results..."
for USER in $(cut -d: -f1 /etc/passwd | head -5); do
    echo "  User: $USER"
done
echo ""

# Debug: C-style for loop
echo "=== C-Style For Loop ==="
echo "[DEBUG] Classic for(init; condition; increment)..."
for ((i=1; i<=5; i++)); do
    echo "  Count: $i"
done
echo ""

# Debug: While loop
echo "=== While Loop ==="
echo "[DEBUG] Repeat WHILE condition is true..."
COUNT=1
while [ "$COUNT" -le 5 ]; do
    echo "  While count: $COUNT"
    COUNT=$((COUNT + 1))
done
echo ""

# Debug: While loop reading file
echo "=== While Loop Reading File ==="
echo "[DEBUG] Common pattern: read file line by line..."
cat << 'EOF' > colors.txt
red
green
blue
yellow
EOF

while read -r COLOR; do
    echo "  Color: $COLOR"
done < colors.txt
echo ""

# Debug: Until loop
echo "=== Until Loop ==="
echo "[DEBUG] Repeat UNTIL condition becomes true..."
COUNT=1
until [ "$COUNT" -gt 5 ]; do
    echo "  Until count: $COUNT"
    COUNT=$((COUNT + 1))
done
echo ""

# Debug: Break and continue
echo "=== Break and Continue ==="
echo "[DEBUG] 'break' exits the loop immediately..."
for NUM in {1..10}; do
    if [ "$NUM" -eq 5 ]; then
        echo "  Breaking at $NUM!"
        break
    fi
    echo "  Number: $NUM"
done
echo ""

echo "[DEBUG] 'continue' skips to next iteration..."
for NUM in {1..5}; do
    if [ "$NUM" -eq 3 ]; then
        echo "  Skipping $NUM!"
        continue
    fi
    echo "  Number: $NUM"
done
echo ""

# Debug: Nested loops
echo "=== Nested Loops ==="
echo "[DEBUG] Loops inside loops (like a multiplication table)..."
for i in {1..3}; do
    for j in {1..3}; do
        echo -n "  $((i * j)) "
    done
    echo ""
done
echo ""

# Debug: Loop over array
echo "=== Loop Over Array ==="
echo "[DEBUG] Arrays and for loops work great together..."
ANIMALS=("dog" "cat" "bird" "fish")

for ANIMAL in "${ANIMALS[@]}"; do
    echo "  Animal: $ANIMAL"
done
echo ""

echo "[DEBUG] With index..."
for INDEX in "${!ANIMALS[@]}"; do
    echo "  $INDEX: ${ANIMALS[$INDEX]}"
done
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. for ITEM in list; do ... done"
echo "2. {1..10} generates number sequences"
echo "3. *.txt expands to matching files"
echo "4. while [ condition ]; do ... done"
echo "5. until [ condition ]; do ... done"
echo "6. break = exit loop, continue = skip iteration"
echo "7. while read -r LINE; do ... done < file"
echo "8. \${ARRAY[@]} = all items, \${!ARRAY[@]} = indices"
echo "=========================================="
