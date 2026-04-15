#!/usr/bin/env bash
#===================================================================================
# LESSON 11: Practical Examples
#===================================================================================
# Let's put it all together with real-world useful scripts!
# These are things you might actually use.
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 11: Practical Examples"
echo "=========================================="
echo ""

PLAYGROUND="/tmp/diego_lesson_11"
rm -rf "$PLAYGROUND" 2>/dev/null || true
mkdir -p "$PLAYGROUND"
cd "$PLAYGROUND"
echo "[DEBUG] Playground: $(pwd)"
echo ""

# Debug: Example 1 - Backup script
echo "=== Example 1: Simple Backup ==="
echo "[DEBUG] A function to backup files with timestamp..."

backup_file() {
    local source="$1"
    if [ ! -f "$source" ]; then
        echo "  ERROR: $source not found!"
        return 1
    fi
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup="${source}.backup_${timestamp}"
    cp "$source" "$backup"
    echo "  Backed up: $source -> $backup"
    return 0
}

echo "test data" > important.txt
backup_file "important.txt"
backup_file "nonexistent.txt" || echo "  (handled error gracefully)"
ls -la *.backup_* 2>/dev/null || true
echo ""

# Debug: Example 2 - Log analyzer
echo "=== Example 2: Log Analyzer ==="
echo "[DEBUG] Analyze a simulated log file..."

cat << 'EOF' > simulated.log
[INFO] 2024-01-15 10:23:45 - User logged in: diego
[ERROR] 2024-01-15 10:24:01 - Failed login: unknown
[INFO] 2024-01-15 10:25:30 - File uploaded: report.pdf
[WARN] 2024-01-15 10:26:15 - Disk space low: 85%
[ERROR] 2024-01-15 10:27:00 - Database timeout
[INFO] 2024-01-15 10:28:45 - User logged out: diego
[ERROR] 2024-01-15 10:29:10 - Permission denied: /etc/shadow
[INFO] 2024-01-15 10:30:00 - Backup completed
[WARN] 2024-01-15 10:31:00 - SSL certificate expiring soon
[INFO] 2024-01-15 10:32:00 - User logged in: maria
EOF

echo "Total lines: $(wc -l < simulated.log)"
echo "ERRORs: $(grep -c ERROR simulated.log)"
echo "WARNs: $(grep -c WARN simulated.log)"
echo "INFOs: $(grep -c INFO simulated.log)"
echo ""
echo "Error details:"
grep ERROR simulated.log
echo ""

# Debug: Example 3 - File organizer
echo "=== Example 3: File Organizer ==="
echo "[DEBUG] Organize files by extension..."

mkdir -p source_folder
touch source_folder/report.pdf source_folder/photo.jpg source_folder/data.csv
touch source_folder/script.sh source_folder/readme.txt source_folder/image.png
echo "Before:"
ls source_folder/
echo ""

organize_by_extension() {
    local src_dir="$1"
    for file in "$src_dir"/*; do
        [ -f "$file" ] || continue
        local ext="${file##*.}"  # Get extension
        local dest_dir="$src_dir/$ext"
        mkdir -p "$dest_dir"
        mv "$file" "$dest_dir/"
        echo "  Moved $(basename "$file") -> $ext/"
    done
}

organize_by_extension "source_folder"
echo "After:"
find source_folder -type f
echo ""

# Debug: Example 4 - System info script
echo "=== Example 4: System Info ==="
echo "[DEBUG] Gather system information..."

get_system_info() {
    echo "  OS: $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d'"' -f2 || echo 'Unknown')"
    echo "  Kernel: $(uname -r)"
    echo "  Uptime: $(uptime -p 2>/dev/null || uptime)"
    echo "  CPU Cores: $(nproc)"
    echo "  Memory: $(free -h | awk '/Mem:/ {print $2}')"
    echo "  Disk Used: $(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')"
    echo "  Current User: $USER"
    echo "  Home: $HOME"
    echo "  Shell: $SHELL"
}

get_system_info
echo ""

# Debug: Example 5 - Countdown timer
echo "=== Example 5: Countdown Timer ==="
echo "[DEBUG] Simple countdown with progress..."

countdown() {
    local seconds="$1"
    while [ "$seconds" -gt 0 ]; do
        printf "  \rCountdown: %02d seconds remaining..." "$seconds"
        sleep 1
        seconds=$((seconds - 1))
    done
    printf "\r  Countdown: DONE!                    \n"
}

countdown 3
echo ""

# Debug: Example 6 - Temperature converter
echo "=== Example 6: Temperature Converter ==="
echo "[DEBUG] Convert between Celsius and Fahrenheit..."

celsius_to_fahrenheit() {
    local c="$1"
    local f=$(echo "scale=1; $c * 9/5 + 32" | bc 2>/dev/null || echo "$((c * 9/5 + 32))")
    echo "$c°C = ${f}°F"
}

fahrenheit_to_celsius() {
    local f="$1"
    local c=$(echo "scale=1; ($f - 32) * 5/9" | bc 2>/dev/null || echo "$(( (f - 32) * 5/9 ))")
    echo "$f°F = ${c}°C"
}

celsius_to_fahrenheit 0
celsius_to_fahrenheit 100
celsius_to_fahrenheit 37
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. Combine functions for reusable tools"
echo "2. Always check if files exist before using"
echo "3. grep -c counts matches"
echo "4. \${file##*.} extracts file extension"
echo "5. System info from /proc and commands"
echo "6. printf \r for updating same line"
echo "7. bc for decimal math (or stick to integers)"
echo "=========================================="
