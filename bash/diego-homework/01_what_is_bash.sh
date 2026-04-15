#!/usr/bin/env bash
#===================================================================================
# LESSON 1: What is Bash?
#===================================================================================
# Bash = "Bourne Again SHell"
# - It's a COMMAND INTERPRETER: you type commands, it runs them
# - It's a PROGRAMMING LANGUAGE: you can write scripts (like this one!)
# - It's your "translator" between you and the Linux kernel
#
# Think of it like a translator at a UN meeting:
#   You (human) --> Bash (translator) --> Linux Kernel (computer)
#
# When you open a terminal, you're talking to Bash!
#===================================================================================

set -euxo pipefail

echo "=========================================="
echo "LESSON 1: What is Bash?"
echo "=========================================="
echo ""

# Debug: Show what shell we're running
echo "[DEBUG] Checking our shell..."
echo "Our shell is: $SHELL"
echo "Bash version: $BASH_VERSION"
echo ""

# Debug: Show who we are
echo "[DEBUG] Who am I?"
echo "Username: $(whoami)"
echo "Current time: $(date)"
echo ""

# Debug: What is this script?
echo "[DEBUG] What is this file?"
echo "Script name: $0"
echo "Process ID: $$"
echo ""

# Debug: Basic echo demonstration
echo "[DEBUG] echo is the 'print' command of bash"
echo "Hello Diego! Welcome to bash!"
echo "You can print variables like this: \$SHELL = $SHELL"
echo ""

# Debug: Commands are just programs!
echo "[DEBUG] Commands are programs living in directories"
echo "Where does 'ls' live? $(which ls)"
echo "Where does 'cat' live? $(which cat)"
echo "Where does 'bash' live? $(which bash)"
echo ""

echo "=========================================="
echo "KEY TAKEAWAYS:"
echo "1. Bash interprets your commands"
echo "2. Commands are just programs on disk"
echo "3. echo prints things to screen"
echo "4. \$VARIBLE syntax accesses variables"
echo "=========================================="
