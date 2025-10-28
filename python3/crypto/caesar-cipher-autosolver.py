#!/usr/bin/env python3
"""
Caesar Cipher Auto-Solver with English word detection
Brute-forces all 26 possible shifts and ranks by English likelihood
"""

import string
import time
from collections import Counter

ciphertext = """
82% yp voknobc cki droi gsvv
eco nsqsdkv vklyb dy ohzkxn
drosb gybupybmo mkzkmsdi.
Dy wood drosb xoonc, WCZc
wecd ofyvfo sxdy WSZc.
"""

clues = """

E=O
I=S

RISE OF THE MANAGED
INTELLIGENCE PROVIDER
"""

# Common English words for detection (expanded list)
COMMON_WORDS = {
    'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'i',
    'it', 'for', 'not', 'on', 'with', 'he', 'as', 'you', 'do', 'at',
    'this', 'but', 'his', 'by', 'from', 'they', 'we', 'say', 'her', 'she',
    'or', 'an', 'will', 'my', 'one', 'all', 'would', 'there', 'their', 'what',
    'so', 'up', 'out', 'if', 'about', 'who', 'get', 'which', 'go', 'me',
    'when', 'make', 'can', 'like', 'time', 'no', 'just', 'him', 'know', 'take',
    'people', 'into', 'year', 'your', 'good', 'some', 'could', 'them', 'see', 'other',
    'than', 'then', 'now', 'look', 'only', 'come', 'its', 'over', 'think', 'also',
    'back', 'after', 'use', 'two', 'how', 'our', 'work', 'first', 'well', 'way',
    'even', 'new', 'want', 'because', 'any', 'these', 'give', 'day', 'most', 'us',
    'is', 'was', 'are', 'been', 'has', 'had', 'were', 'said', 'did', 'having',
    'may', 'should', 'am', 'being', 'does', 'must', 'need', 'rise', 'managed',
    'intelligence', 'provider', 'security', 'must', 'evolve', 'into', 'msps', 'mips'
}

# English letter frequency (approximate percentages)
ENGLISH_FREQ = {
    'e': 12.70, 't': 9.06, 'a': 8.17, 'o': 7.51, 'i': 6.97, 'n': 6.75,
    's': 6.33, 'h': 6.09, 'r': 5.99, 'd': 4.25, 'l': 4.03, 'c': 2.78,
    'u': 2.76, 'm': 2.41, 'w': 2.36, 'f': 2.23, 'g': 2.02, 'y': 1.97,
    'p': 1.93, 'b': 1.29, 'v': 0.98, 'k': 0.77, 'j': 0.15, 'x': 0.15,
    'q': 0.10, 'z': 0.07
}


def caesar_decrypt(text, shift):
    """Decrypt text using Caesar cipher with given shift"""
    result = []
    for char in text:
        if char.isalpha():
            # Determine if uppercase or lowercase
            base = ord('A') if char.isupper() else ord('a')
            # Shift character
            shifted = (ord(char) - base - shift) % 26
            result.append(chr(base + shifted))
        else:
            result.append(char)
    return ''.join(result)


def calculate_english_score(text):
    """
    Calculate how "English-like" the text is using multiple metrics:
    1. Common word frequency
    2. Letter frequency analysis
    3. Digraph analysis
    """
    text_lower = text.lower()
    words = [word.strip(string.punctuation) for word in text_lower.split()]

    # Score 1: Common words (weighted heavily)
    common_word_count = sum(1 for word in words if word in COMMON_WORDS)
    total_words = len([w for w in words if w.isalpha()])
    common_word_ratio = common_word_count / max(total_words, 1)

    # Score 2: Letter frequency correlation
    letters_only = [c for c in text_lower if c.isalpha()]
    if not letters_only:
        return 0

    letter_counts = Counter(letters_only)
    total_letters = len(letters_only)

    # Calculate chi-squared statistic (lower is better, so we invert it)
    chi_squared = 0
    for letter in string.ascii_lowercase:
        observed = (letter_counts.get(letter, 0) / total_letters) * 100
        expected = ENGLISH_FREQ.get(letter, 0)
        if expected > 0:
            chi_squared += ((observed - expected) ** 2) / expected

    # Normalize chi-squared (typical English text has chi-squared around 50-100)
    freq_score = max(0, 1 - (chi_squared / 500))

    # Score 3: Check for common digraphs (th, he, in, er, an, re, etc.)
    common_digraphs = ['th', 'he', 'in', 'er', 'an', 're', 'on', 'at', 'en', 'nd']
    digraph_count = sum(text_lower.count(dg) for dg in common_digraphs)
    digraph_score = min(1.0, digraph_count / max(total_letters / 10, 1))

    # Combined score (weighted)
    combined_score = (common_word_ratio * 50) + (freq_score * 30) + (digraph_score * 20)

    return combined_score


def print_progress_bar(iteration, total, prefix='', suffix='', length=50, fill='█'):
    """Print a modern progress bar"""
    percent = ("{0:.1f}").format(100 * (iteration / float(total)))
    filled_length = int(length * iteration // total)

    # Create gradient effect
    bar_chars = ['░', '▒', '▓', '█']
    bar = fill * filled_length

    # Add partial progress character
    if filled_length < length:
        remaining = length - filled_length - 1
        bar += '▒' + '░' * remaining

    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end='', flush=True)


def brute_force_caesar(ciphertext):
    """Try all 26 possible shifts and rank by English likelihood"""
    print("\n" + "="*70)
    print("  CAESAR CIPHER AUTO-SOLVER")
    print("="*70 + "\n")

    print(f"Ciphertext:\n{ciphertext}\n")
    print("Analyzing all 26 possible shifts...\n")

    results = []

    # Try all shifts
    for shift in range(26):
        print_progress_bar(
            shift + 1,
            26,
            prefix='Progress:',
            suffix=f'Testing shift {shift:2d}/25',
            length=40
        )

        decrypted = caesar_decrypt(ciphertext, shift)
        score = calculate_english_score(decrypted)
        results.append((shift, score, decrypted))

        # Small delay for visual effect
        time.sleep(0.05)

    print("\n\n" + "="*70)
    print("  RESULTS (Ranked by likelihood)")
    print("="*70 + "\n")

    # Sort by score (highest first)
    results.sort(key=lambda x: x[1], reverse=True)

    # Display top 5 results
    for rank, (shift, score, decrypted) in enumerate(results[:5], 1):
        print(f"\n{'─'*70}")
        print(f"Rank #{rank}  |  Shift: {shift:2d}  |  Confidence: {score:.2f}/100")
        print(f"{'─'*70}")
        print(decrypted)

    # Show the best result prominently
    best_shift, best_score, best_text = results[0]

    print("\n" + "="*70)
    print("  MOST LIKELY SOLUTION")
    print("="*70)
    print(f"\nShift: {best_shift}")
    print(f"Confidence Score: {best_score:.2f}/100\n")
    print("Decrypted text:")
    print("─" * 70)
    print(best_text)
    print("─" * 70)

    return results


if __name__ == "__main__":
    results = brute_force_caesar(ciphertext)

    # Verify with clues if provided
    print("\n" + "="*70)
    print("  CLUE VERIFICATION")
    print("="*70)
    print(clues)
