#!/bin/sh

# If using Windows please see https://github.com/hashcat/hashcat/issues/1539
# Run `man hashcat` for more info

hashcat -a 0 -m 1420 django-salted-sha256.hash example.dict -r best64.rule
# We use mode 1420 here because the format from the database was 'hash(salt); hash(password)'

# Other examples:

# Bruteforce (not using wordlists, this takes longer but is more thorough)
# hashcat -a 3 -m 1420 django-salted-sha256.hash 

# Delete pot file:
# rm ~/.hashcat/hashcat.potfile

# Other options:

# Show cracked hashes:
# --show 

# Use slow devices:
# --force

# Use a specific device to crack hashes:
# -D <n>