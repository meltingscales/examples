#!/usr/bin/env bash
#===================================================================================
# LESSON 8: Conditionals (if/elif/else)
#===================================================================================
# Conditionals let your script make DECISIONS:
#
#   if [ condition ]; then
#       do something
#   elif [ another condition ]; then
#       do something else
#   else
#       do default thing
#   fi
#
# Common comparisons:
#   -eq  = equal (numbers)          -ne  = not equal
#   -lt  = less than                -le  = less or equal
#   -gt  = greater than             -ge  = greater or equal
#   =    = equal (strings)          !=   = not equal
#   -f   = file exists              -d   = directory exists
#   -z   = string is empty          -n   = string is not empty
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 8: Conditionals"
echo "=========================================="
echo ""

PLAYGROUND="/tmp/diego_lesson_08"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Playground: $(pwd)"
echo ""

# Debug: Basic if statement
echo "=== Basic If Statement ==="
echo "[DEBUG] Simple true/false check..."
AGE=25

if [ "$AGE" -ge 18 ]; then
    echo "Age $AGE: You are an adult!"
fi
echo ""

# Debug: If-else
echo "=== If-Else ==="
echo "[DEBUG] Two branches..."
SCORE=75

if [ "$SCORE" -ge 60 ]; then
    echo "Score $SCORE: You passed!"
else
    echo "Score $SCORE: You failed."
fi
echo ""

# Debug: If-elif-else
echo "=== If-Elif-Else ==="
echo "[DEBUG] Multiple branches..."
GRADE=85

if [ "$GRADE" -ge 90 ]; then
    echo "Grade $GRADE: A - Excellent!"
elif [ "$GRADE" -ge 80 ]; then
    echo "Grade $GRADE: B - Good job!"
elif [ "$GRADE" -ge 70 ]; then
    echo "Grade $GRADE: C - Satisfactory"
elif [ "$GRADE" -ge 60 ]; then
    echo "Grade $GRADE: D - Needs improvement"
else
    echo "Grade $GRADE: F - Failed"
fi
echo ""

# Debug: String comparisons
echo "=== String Comparisons ==="
echo "[DEBUG] Comparing text..."
NAME="Diego"

if [ "$NAME" = "Diego" ]; then
    echo "Hello Diego!"
fi

if [ "$NAME" != "Juan" ]; then
    echo "You're not Juan, you're $NAME"
fi
echo ""

# Debug: Empty string check
echo "=== Empty String Check ==="
echo "[DEBUG] -z checks for empty string..."
EMPTY=""
NOT_EMPTY="hello"

if [ -z "$EMPTY" ]; then
    echo "EMPTY is empty (zero length)"
fi

if [ -n "$NOT_EMPTY" ]; then
    echo "NOT_EMPTY has content: $NOT_EMPTY"
fi
echo ""

# Debug: File checks
echo "=== File Checks ==="
echo "[DEBUG] Check if files/directories exist..."
touch myfile.txt
mkdir mydir

if [ -f "myfile.txt" ]; then
    echo "myfile.txt exists and is a FILE"
fi

if [ -d "mydir" ]; then
    echo "mydir exists and is a DIRECTORY"
fi

if [ -f "nonexistent.txt" ]; then
    echo "This won't print"
else
    echo "nonexistent.txt does NOT exist"
fi
echo ""

# Debug: More file checks
echo "=== More File Checks ==="
echo "[DEBUG] Check file properties..."
echo "content" > myfile.txt

if [ -s "myfile.txt" ]; then
    echo "myfile.txt has content (not empty)"
fi

if [ -r "myfile.txt" ]; then
    echo "myfile.txt is readable"
fi

if [ -w "myfile.txt" ]; then
    echo "myfile.txt is writable"
fi

if [ -x "/bin/ls" ]; then
    echo "/bin/ls is executable"
fi
echo ""

# Debug: NOT operator
echo "=== NOT Operator ==="
echo "[DEBUG] ! reverses the condition..."
if [ ! -f "nonexistent.txt" ]; then
    echo "nonexistent.txt does NOT exist (! negated the check)"
fi
echo ""

# Debug: AND / OR
echo "=== AND and OR ==="
echo "[DEBUG] -a (AND) requires BOTH true, -o (OR) requires either true..."
AGE=25
HAS_ID="yes"

if [ "$AGE" -ge 18 ] && [ "$HAS_ID" = "yes" ]; then
    echo "Can buy alcohol: old enough AND has ID"
fi

if [ "$AGE" -ge 21 ] || [ "$HAS_ID" = "yes" ]; then
    echo "Can enter bar: old enough OR has ID"
fi
echo ""

# Debug: Case statement
echo "=== Case Statement ==="
echo "[DEBUG] Case is like multiple if-elif for one variable..."
DAY="Wednesday"

case "$DAY" in
    Monday|Tuesday|Wednesday|Thursday|Friday)
        echo "$DAY is a weekday"
        ;;
    Saturday|Sunday)
        echo "$DAY is a weekend"
        ;;
    *)
        echo "$DAY is not a valid day"
        ;;
esac
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. if [ condition ]; then ... fi"
echo "2. Add 'elif' for more branches, 'else' for default"
echo "3. Numbers: -eq -ne -lt -le -gt -ge"
echo "4. Strings: = !="
echo "5. Empty: -z (empty) -n (not empty)"
echo "6. Files: -f (file) -d (dir) -r -w -x -s"
echo "7. ! = NOT"
echo "8. && = AND, || = OR"
echo "9. case is cleaner for many options"
echo "=========================================="
