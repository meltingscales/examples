"""
Example 1: Variables and Basic Data Types
==========================================
This example introduces you to Python variables and the most common data types.
"""

# Variables in Python don't need type declarations
# Just assign a value and Python figures out the type!

# Strings (text)
name = "Alice"
greeting = 'Hello, World!'  # Single or double quotes both work
print("String examples:")
print(name)
print(greeting)
print()

# Numbers - Integers (whole numbers)
age = 25
temperature = -5
print("Integer examples:")
print("Age:", age)
print("Temperature:", temperature)
print()

# Numbers - Floats (decimal numbers)
price = 19.99
pi = 3.14159
print("Float examples:")
print("Price: $" + str(price))  # Convert to string to concatenate
print(f"Pi is approximately {pi}")  # f-strings are a modern way to format
print()

# Booleans (True or False)
is_student = True
is_raining = False
print("Boolean examples:")
print("Is student?", is_student)
print("Is raining?", is_raining)
print()

# Basic arithmetic
x = 10
y = 3
print("Basic math operations:")
print(f"{x} + {y} = {x + y}")  # Addition
print(f"{x} - {y} = {x - y}")  # Subtraction
print(f"{x} * {y} = {x * y}")  # Multiplication
print(f"{x} / {y} = {x / y}")  # Division (always returns float)
print(f"{x} // {y} = {x // y}")  # Integer division (rounds down)
print(f"{x} % {y} = {x % y}")  # Modulo (remainder)
print(f"{x} ** {y} = {x ** y}")  # Exponentiation
print()

# You can check the type of any variable
print("Type checking:")
print(f"type(name) = {type(name)}")
print(f"type(age) = {type(age)}")
print(f"type(price) = {type(price)}")
print(f"type(is_student) = {type(is_student)}")
