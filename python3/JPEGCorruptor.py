#!/usr/bin/env python3

import random
import keyboard

def corrupt_jpg_live(file_path, output_path):
    """Corrupts 8 random bytes in a JPG file each time 'C' is pressed and released, and quits on 'Q'."""
    
    # Read the original JPG file as binary
    with open(file_path, 'rb') as f:
        jpg_data = bytearray(f.read())
    
    print("Ready! Press 'C' to corrupt 8 bytes, and 'Q' to quit.")
    
    # Loop to listen for keystrokes
    while True:
        if keyboard.is_pressed('c'):
            # Wait for key release to avoid spamming corruption
            keyboard.wait('c', suppress=True)
            for _ in range(8):
                # Randomly select a position in the file to corrupt
                index_to_corrupt = random.randint(0, len(jpg_data) - 1)
                # Randomly select a new value for this byte (0-255)
                new_value = random.randint(0, 255)
                # Assign the new value to corrupt the selected byte
                jpg_data[index_to_corrupt] = new_value
            
            # Write the corrupted data to a new JPG file
            with open(output_path, 'wb') as f:
                f.write(jpg_data)
            
            print(f"8 bytes corrupted and saved to {output_path}. Press 'C' to corrupt more or 'Q' to quit.")
        
        if keyboard.is_pressed('q'):
            print("Exiting...")
            break

# Example usage:
corrupt_jpg_live('about.jpg', 'corrupted_about.jpg')
