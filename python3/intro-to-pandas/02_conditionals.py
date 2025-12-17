"""
Example 2: Conditionals and Control Flow
=========================================
This example shows you how to make decisions in your code using if/elif/else.
"""

# Basic if statement
age = 20
print("Example 1: Simple if statement")
if age >= 18:
    print("You are an adult!")
    print("You can vote.")
print()

# if-else statement
temperature = 15
print("Example 2: if-else statement")
if temperature > 25:
    print("It's hot outside!")
else:
    print("It's cool outside!")
print()

# if-elif-else chain
score = 85
print("Example 3: if-elif-else chain")
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
elif score >= 60:
    grade = "D"
else:
    grade = "F"
print(f"Score: {score}, Grade: {grade}")
print()

# Comparison operators
x = 10
y = 5
print("Example 4: Comparison operators")
print(f"{x} == {y}: {x == y}")  # Equal to
print(f"{x} != {y}: {x != y}")  # Not equal to
print(f"{x} > {y}: {x > y}")    # Greater than
print(f"{x} < {y}: {x < y}")    # Less than
print(f"{x} >= {y}: {x >= y}")  # Greater than or equal
print(f"{x} <= {y}: {x <= y}")  # Less than or equal
print()

# Logical operators (and, or, not)
is_weekend = True
is_sunny = False
print("Example 5: Logical operators")
if is_weekend and is_sunny:
    print("Let's go to the beach!")
elif is_weekend and not is_sunny:
    print("Let's watch a movie!")
elif not is_weekend and is_sunny:
    print("Wish I could enjoy the sun, but I have work!")
else:
    print("Just another workday!")
print()

# Checking if a value is in a collection
fruits = ["apple", "banana", "cherry"]
print("Example 6: Membership testing")
if "banana" in fruits:
    print("We have bananas!")
if "orange" not in fruits:
    print("We don't have oranges.")
print()

# Nested conditionals
age = 25
has_license = True
print("Example 7: Nested conditionals")
if age >= 16:
    if has_license:
        print("You can drive!")
    else:
        print("You're old enough, but you need a license.")
else:
    print("You're too young to drive.")
print()

# Ternary operator (shorthand if-else)
is_member = True
price = 10 if is_member else 15
print(f"Example 8: Ternary operator")
print(f"Membership status: {is_member}")
print(f"Price: ${price}")
