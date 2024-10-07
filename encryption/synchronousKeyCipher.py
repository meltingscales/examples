import hashlib

# Define the key and the initial state (IV)
key = "mysecretkey"
initial_state = "IV123456"


# Function f: Updates the state (simple state increment for demonstration)
def f(key, state):
    # In a real scenario, this should be more complex
    new_state = str(int(state[-1]) + 1)
    print(f"Updated state from {state} to {new_state} using key {key}")
    return new_state


# Function G: Generates keystream (for simplicity, using a hash of key + state)
def G(key, state):
    combined = key + state
    keystream = hashlib.sha256(combined.encode()).hexdigest()[:len(state)]  # Truncate for simplicity
    print(f"Generated keystream {keystream} for state {state} and key {key}")
    return keystream


# Synchronous Stream Cipher Encryption
def stream_cipher_encrypt(plaintext, key, initial_state):
    state = initial_state
    ciphertext = []

    for i, m in enumerate(plaintext):
        print(f"\nProcessing character {i + 1}/{len(plaintext)}: '{m}'")

        # Generate keystream based on the current state and key
        y = G(key, state)

        # XOR plaintext character with keystream (only for demonstration, converting char to integer and back)
        c = chr(ord(m) ^ ord(y[0]))  # XOR with the first character of keystream
        print(f"XOR '{m}' (plaintext) with '{y[0]}' (keystream) to get '{c}' (ciphertext)")

        ciphertext.append(c)

        # Update the state using f function
        state = f(key, state)

    return ''.join(ciphertext)


# Example encryption on the string "banana"
plaintext = "banana"
ciphertext = stream_cipher_encrypt(plaintext, key, initial_state)
print("\nFinal Ciphertext:", ciphertext)


reversed = stream_cipher_encrypt(ciphertext,key,initial_state)
print("\nReversed: "+reversed)