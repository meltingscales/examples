"""
Example 3: Loops (for and while)
=================================
This example teaches you how to repeat actions using loops.
"""

# Basic for loop - iterate over a range
print("Example 1: Basic for loop with range")
print("Counting from 0 to 4:")
for i in range(5):
    print(f"  Number: {i}")
print()

# For loop with start and end
print("Example 2: Range with start and end")
print("Counting from 1 to 5:")
for i in range(1, 6):
    print(f"  Number: {i}")
print()

# For loop with step
print("Example 3: Range with step")
print("Even numbers from 0 to 10:")
for i in range(0, 11, 2):
    print(f"  {i}")
print()

# Iterating over a list
fruits = ["apple", "banana", "cherry", "date"]
print("Example 4: Iterating over a list")
print("My favorite fruits:")
for fruit in fruits:
    print(f"  - {fruit}")
print()

# Enumerate - get both index and value
print("Example 5: Using enumerate to get index and value")
for index, fruit in enumerate(fruits):
    print(f"  {index + 1}. {fruit}")
print()

# Iterating over a string
word = "Python"
print("Example 6: Iterating over a string")
print("Letters in 'Python':")
for letter in word:
    print(f"  {letter}")
print()

# While loop - repeat while condition is true
print("Example 7: Basic while loop")
count = 0
while count < 5:
    print(f"  Count is: {count}")
    count += 1  # Same as count = count + 1
print()

# While loop with user input simulation
print("Example 8: While loop with break")
attempts = 0
max_attempts = 3
secret_number = 7
while attempts < max_attempts:
    guess = 5 + attempts  # Simulating guesses
    print(f"  Guess #{attempts + 1}: {guess}")
    if guess == secret_number:
        print("  Correct!")
        break  # Exit the loop early
    attempts += 1
else:
    # This 'else' runs if the loop completes without breaking
    print("  Out of attempts!")
print()

# Continue - skip to next iteration
print("Example 9: Using continue to skip iterations")
print("Odd numbers from 1 to 10:")
for i in range(1, 11):
    if i % 2 == 0:  # If even
        continue  # Skip to next iteration
    print(f"  {i}")
print()

# Nested loops
print("Example 10: Nested loops (multiplication table)")
for i in range(1, 4):
    for j in range(1, 4):
        print(f"  {i} x {j} = {i * j}")
    print()  # Blank line between rows

# List comprehension - create lists with loops in one line
print("Example 11: List comprehension")
squares = [x**2 for x in range(1, 6)]
print(f"Squares of 1-5: {squares}")

# List comprehension with condition
even_squares = [x**2 for x in range(1, 11) if x % 2 == 0]
print(f"Squares of even numbers 1-10: {even_squares}")
print()

# Looping over a dictionary
person = {"name": "Alice", "age": 30, "city": "New York"}
print("Example 12: Looping over a dictionary")
for key, value in person.items():
    print(f"  {key}: {value}")
