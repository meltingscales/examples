"""
Example 4: Lists and Dictionaries
==================================
This example covers two of Python's most important data structures.
"""

print("=" * 50)
print("LISTS - Ordered collections of items")
print("=" * 50)
print()

# Creating lists
empty_list = []
numbers = [1, 2, 3, 4, 5]
fruits = ["apple", "banana", "cherry"]
mixed = [1, "hello", 3.14, True]  # Lists can contain different types

print("Example 1: Creating and accessing lists")
print(f"Numbers: {numbers}")
print(f"Fruits: {fruits}")
print(f"Mixed types: {mixed}")
print()

# Accessing elements by index (starts at 0)
print("Example 2: Accessing list elements")
print(f"First fruit: {fruits[0]}")
print(f"Second fruit: {fruits[1]}")
print(f"Last fruit: {fruits[-1]}")  # Negative indices count from the end
print(f"Second to last: {fruits[-2]}")
print()

# Slicing - getting a subset of a list
print("Example 3: List slicing")
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print(f"Full list: {numbers}")
print(f"First 3 items: {numbers[:3]}")  # Start to index 3 (exclusive)
print(f"Items 3-6: {numbers[3:7]}")
print(f"Last 3 items: {numbers[-3:]}")
print(f"Every other item: {numbers[::2]}")
print()

# Modifying lists
print("Example 4: Modifying lists")
fruits = ["apple", "banana", "cherry"]
print(f"Original: {fruits}")

fruits.append("date")  # Add to end
print(f"After append: {fruits}")

fruits.insert(1, "blueberry")  # Insert at index 1
print(f"After insert: {fruits}")

fruits.remove("banana")  # Remove by value
print(f"After remove: {fruits}")

popped = fruits.pop()  # Remove and return last item
print(f"After pop: {fruits}")
print(f"Popped item: {popped}")
print()

# List operations
print("Example 5: List operations")
list1 = [1, 2, 3]
list2 = [4, 5, 6]
combined = list1 + list2  # Concatenation
print(f"Combined lists: {combined}")
print(f"Length: {len(combined)}")
print(f"Sum: {sum(combined)}")
print(f"Min: {min(combined)}")
print(f"Max: {max(combined)}")
print()

# Sorting
print("Example 6: Sorting lists")
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
print(f"Original: {numbers}")
print(f"Sorted (temporary): {sorted(numbers)}")
print(f"Original unchanged: {numbers}")

numbers.sort()  # Sort in-place
print(f"After .sort(): {numbers}")

numbers.reverse()  # Reverse in-place
print(f"After .reverse(): {numbers}")
print()

print("=" * 50)
print("DICTIONARIES - Key-value pairs")
print("=" * 50)
print()

# Creating dictionaries
empty_dict = {}
person = {
    "name": "Alice",
    "age": 30,
    "city": "New York",
    "is_student": False
}

print("Example 7: Creating and accessing dictionaries")
print(f"Person: {person}")
print(f"Name: {person['name']}")
print(f"Age: {person['age']}")
print()

# Safe access with .get()
print("Example 8: Safe dictionary access")
print(f"City: {person.get('city')}")
print(f"Country: {person.get('country', 'USA')}")  # Default value if key missing
print()

# Modifying dictionaries
print("Example 9: Modifying dictionaries")
person["email"] = "alice@example.com"  # Add new key-value pair
print(f"After adding email: {person}")

person["age"] = 31  # Update existing value
print(f"After birthday: {person}")

del person["is_student"]  # Delete a key-value pair
print(f"After deleting is_student: {person}")
print()

# Dictionary methods
print("Example 10: Dictionary methods")
print(f"Keys: {list(person.keys())}")
print(f"Values: {list(person.values())}")
print(f"Items: {list(person.items())}")
print()

# Checking if key exists
print("Example 11: Checking for keys")
if "name" in person:
    print(f"Name exists: {person['name']}")
if "phone" not in person:
    print("Phone number not found")
print()

# Nested structures
print("Example 12: Nested dictionaries and lists")
students = [
    {"name": "Alice", "grade": 95},
    {"name": "Bob", "grade": 87},
    {"name": "Charlie", "grade": 92}
]

print("Student grades:")
for student in students:
    print(f"  {student['name']}: {student['grade']}")
print()

# Dictionary comprehension
print("Example 13: Dictionary comprehension")
squares_dict = {x: x**2 for x in range(1, 6)}
print(f"Squares dictionary: {squares_dict}")
print()

# Practical example - counting items
print("Example 14: Counting with dictionaries")
text = "hello world"
letter_count = {}
for letter in text:
    if letter != " ":
        letter_count[letter] = letter_count.get(letter, 0) + 1
print(f"Letter frequency in '{text}':")
for letter, count in sorted(letter_count.items()):
    print(f"  {letter}: {count}")
