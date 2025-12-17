"""
Example 5: CSV Operations (Reading and Writing)
================================================
This example shows you how to work with CSV files, which are commonly used
for storing tabular data like spreadsheets.
"""

import csv
import os

# First, let's create a sample CSV file to work with
print("=" * 60)
print("WRITING CSV FILES")
print("=" * 60)
print()

# Example 1: Writing a simple CSV file
print("Example 1: Writing a basic CSV file")
filename = "05_students.csv"

# Data to write
students_data = [
    ["Name", "Age", "Grade", "City"],
    ["Alice", 20, "A", "New York"],
    ["Bob", 22, "B", "Los Angeles"],
    ["Charlie", 21, "A", "Chicago"],
    ["Diana", 23, "C", "Houston"],
    ["Eve", 20, "B", "Phoenix"]
]

# Write to CSV
with open(filename, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(students_data)  # Write all rows at once

print(f"✓ Created {filename}")
print(f"  Wrote {len(students_data)} rows (including header)")
print()

# Example 2: Writing CSV using DictWriter (more readable for complex data)
print("Example 2: Writing CSV with DictWriter")
filename2 = "05_products.csv"

products = [
    {"Product": "Laptop", "Price": 999.99, "Stock": 15, "Category": "Electronics"},
    {"Product": "Mouse", "Price": 25.50, "Stock": 150, "Category": "Electronics"},
    {"Product": "Desk", "Price": 299.00, "Stock": 30, "Category": "Furniture"},
    {"Product": "Chair", "Price": 150.00, "Stock": 45, "Category": "Furniture"},
]

with open(filename2, 'w', newline='') as file:
    fieldnames = ["Product", "Price", "Stock", "Category"]
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()  # Write the header row
    writer.writerows(products)  # Write all data rows

print(f"✓ Created {filename2}")
print(f"  Wrote {len(products)} products")
print()

# Example 3: Reading CSV files
print("=" * 60)
print("READING CSV FILES")
print("=" * 60)
print()

print("Example 3: Reading CSV with csv.reader")
with open(filename, 'r') as file:
    reader = csv.reader(file)
    rows = list(reader)

    print(f"Read {len(rows)} rows from {filename}:")
    for row in rows:
        print(f"  {row}")
print()

# Example 4: Reading CSV with headers
print("Example 4: Reading CSV and separating header from data")
with open(filename, 'r') as file:
    reader = csv.reader(file)
    header = next(reader)  # Get first row as header
    data = list(reader)  # Rest as data

    print(f"Header: {header}")
    print(f"Data rows: {len(data)}")
    for row in data:
        print(f"  {row}")
print()

# Example 5: Reading with DictReader (most convenient!)
print("Example 5: Reading CSV with DictReader")
with open(filename2, 'r') as file:
    reader = csv.DictReader(file)

    print(f"Products from {filename2}:")
    for row in reader:
        print(f"  {row['Product']}: ${row['Price']} ({row['Stock']} in stock)")
print()

# Example 6: Processing and filtering CSV data
print("Example 6: Filtering CSV data")
with open(filename, 'r') as file:
    reader = csv.DictReader(file)

    print("Students with grade 'A':")
    for student in reader:
        if student['Grade'] == 'A':
            print(f"  {student['Name']} from {student['City']}")
print()

# Example 7: Calculating statistics from CSV
print("Example 7: Calculating statistics from CSV data")
with open(filename, 'r') as file:
    reader = csv.DictReader(file)
    ages = [int(row['Age']) for row in reader]

    print(f"Age statistics:")
    print(f"  Average age: {sum(ages) / len(ages):.1f}")
    print(f"  Youngest: {min(ages)}")
    print(f"  Oldest: {max(ages)}")
print()

# Example 8: Modifying and writing back
print("Example 8: Reading, modifying, and writing CSV")
output_filename = "05_products_discounted.csv"

with open(filename2, 'r') as infile:
    reader = csv.DictReader(infile)
    products_list = list(reader)

    # Apply 10% discount to all products
    for product in products_list:
        original_price = float(product['Price'])
        product['Price'] = f"{original_price * 0.9:.2f}"
        product['Discount'] = "10%"

# Write modified data to new file
with open(output_filename, 'w', newline='') as outfile:
    fieldnames = ["Product", "Price", "Stock", "Category", "Discount"]
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerows(products_list)

print(f"✓ Created {output_filename} with discounted prices")
print()

# Example 9: Creating a summary CSV
print("Example 9: Creating a summary/aggregation CSV")
summary_filename = "05_category_summary.csv"

# Read products and count by category
category_counts = {}
category_totals = {}

with open(filename2, 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        category = row['Category']
        stock = int(row['Stock'])

        category_counts[category] = category_counts.get(category, 0) + 1
        category_totals[category] = category_totals.get(category, 0) + stock

# Write summary
with open(summary_filename, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Category", "Product Count", "Total Stock"])

    for category in category_counts:
        writer.writerow([
            category,
            category_counts[category],
            category_totals[category]
        ])

print(f"✓ Created {summary_filename}")
with open(summary_filename, 'r') as file:
    print(file.read())

# Example 10: Working with different delimiters
print("Example 10: Using different delimiters (tab-separated)")
tsv_filename = "05_data.tsv"

with open(tsv_filename, 'w', newline='') as file:
    writer = csv.writer(file, delimiter='\t')  # Tab-separated
    writer.writerow(["ID", "Name", "Value"])
    writer.writerow([1, "Alpha", 100])
    writer.writerow([2, "Beta", 200])

print(f"✓ Created {tsv_filename} (tab-separated)")

# Reading it back
with open(tsv_filename, 'r') as file:
    reader = csv.reader(file, delimiter='\t')
    for row in reader:
        print(f"  {row}")
print()

# Clean up - show files created
print("=" * 60)
print("FILES CREATED IN THIS EXAMPLE:")
print("=" * 60)
created_files = [filename, filename2, output_filename, summary_filename, tsv_filename]
for f in created_files:
    size = os.path.getsize(f)
    print(f"  {f} ({size} bytes)")
print()
print("Tip: You can open these CSV files in Excel, Google Sheets, or any text editor!")
