"""
Example 6: Introduction to Pandas
==================================
Pandas is the most popular library for data manipulation and analysis in Python.
It makes working with structured data (like CSV files) much easier!

Before running: Install pandas with: pip install pandas
Or if using uv: uv pip install pandas
"""

import pandas as pd

print("=" * 60)
print("CREATING DATAFRAMES")
print("=" * 60)
print()

# Example 1: Creating a DataFrame from a dictionary
print("Example 1: Creating a DataFrame from a dictionary")
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'],
    'Age': [25, 30, 35, 28, 32],
    'City': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'],
    'Salary': [70000, 80000, 90000, 75000, 85000]
}

df = pd.DataFrame(data)
print(df)
print()

# Example 2: Basic DataFrame info
print("Example 2: Getting DataFrame information")
print(f"Shape (rows, columns): {df.shape}")
print(f"Column names: {df.columns.tolist()}")
print(f"Data types:\n{df.dtypes}")
print()

# Example 3: Viewing data
print("Example 3: Viewing parts of the DataFrame")
print("First 3 rows:")
print(df.head(3))
print("\nLast 2 rows:")
print(df.tail(2))
print()

# Example 4: Accessing columns
print("Example 4: Accessing columns")
print("Just the names:")
print(df['Name'])
print("\nMultiple columns:")
print(df[['Name', 'Salary']])
print()

# Example 5: Accessing rows by index
print("Example 5: Accessing rows")
print("Row at index 0:")
print(df.iloc[0])  # iloc = integer location
print("\nRows 1-3:")
print(df.iloc[1:4])
print()

# Example 6: Filtering data
print("Example 6: Filtering data")
print("People older than 30:")
print(df[df['Age'] > 30])
print("\nPeople in Chicago or Houston:")
print(df[df['City'].isin(['Chicago', 'Houston'])])
print()

# Example 7: Adding new columns
print("Example 7: Adding and modifying columns")
df['Bonus'] = df['Salary'] * 0.1  # 10% bonus
df['Total_Compensation'] = df['Salary'] + df['Bonus']
print(df[['Name', 'Salary', 'Bonus', 'Total_Compensation']])
print()

# Example 8: Basic statistics
print("Example 8: Statistical summary")
print(df.describe())
print()

print("Example 9: Specific statistics")
print(f"Average salary: ${df['Salary'].mean():,.2f}")
print(f"Median salary: ${df['Salary'].median():,.2f}")
print(f"Max salary: ${df['Salary'].max():,.2f}")
print(f"Min salary: ${df['Salary'].min():,.2f}")
print()

# Example 10: Sorting
print("Example 10: Sorting data")
print("Sorted by salary (descending):")
print(df.sort_values('Salary', ascending=False)[['Name', 'Salary']])
print()

# Example 11: Grouping and aggregating
print("Example 11: Grouping by city")
city_stats = df.groupby('City')['Salary'].agg(['mean', 'count'])
print(city_stats)
print()

print("=" * 60)
print("READING AND WRITING CSV FILES WITH PANDAS")
print("=" * 60)
print()

# Example 12: Writing to CSV
print("Example 12: Writing DataFrame to CSV")
csv_file = "06_employees.csv"
df.to_csv(csv_file, index=False)  # index=False prevents writing row numbers
print(f"✓ Saved to {csv_file}")
print()

# Example 13: Reading from CSV
print("Example 13: Reading CSV into DataFrame")
df_loaded = pd.read_csv(csv_file)
print(df_loaded.head())
print()

# Example 14: Creating sample sales data for more examples
print("Example 14: Working with a sales dataset")
sales_data = {
    'Date': ['2024-01-01', '2024-01-02', '2024-01-03', '2024-01-04', '2024-01-05'],
    'Product': ['Laptop', 'Mouse', 'Laptop', 'Keyboard', 'Mouse'],
    'Quantity': [2, 5, 1, 3, 10],
    'Price': [999.99, 25.50, 999.99, 75.00, 25.50],
    'Region': ['East', 'West', 'East', 'North', 'West']
}

sales_df = pd.DataFrame(sales_data)
sales_df['Total'] = sales_df['Quantity'] * sales_df['Price']
print(sales_df)
print()

# Example 15: Grouping and aggregation with sales data
print("Example 15: Sales summary by product")
product_summary = sales_df.groupby('Product').agg({
    'Quantity': 'sum',
    'Total': 'sum'
}).round(2)
print(product_summary)
print()

print("Example 16: Sales summary by region")
region_summary = sales_df.groupby('Region')['Total'].sum().round(2)
print(region_summary)
print()

# Example 16: Date handling
print("Example 17: Working with dates")
sales_df['Date'] = pd.to_datetime(sales_df['Date'])
sales_df['DayOfWeek'] = sales_df['Date'].dt.day_name()
print(sales_df[['Date', 'DayOfWeek', 'Product', 'Total']])
print()

# Example 17: Handling missing data
print("Example 18: Handling missing data")
incomplete_data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana'],
    'Age': [25, None, 35, 28],
    'Score': [85, 90, None, 88]
}
incomplete_df = pd.DataFrame(incomplete_data)
print("Data with missing values:")
print(incomplete_df)
print(f"\nMissing values per column:\n{incomplete_df.isnull().sum()}")
print("\nAfter filling missing values:")
filled_df = incomplete_df.fillna({'Age': incomplete_df['Age'].mean(), 'Score': 0})
print(filled_df)
print()

# Example 18: Merging DataFrames
print("Example 19: Merging DataFrames")
employees = pd.DataFrame({
    'EmpID': [1, 2, 3],
    'Name': ['Alice', 'Bob', 'Charlie'],
    'DeptID': [10, 20, 10]
})

departments = pd.DataFrame({
    'DeptID': [10, 20, 30],
    'Department': ['Sales', 'Engineering', 'Marketing']
})

merged = pd.merge(employees, departments, on='DeptID', how='left')
print("Merged employee and department data:")
print(merged)
print()

# Example 19: Pivot tables
print("Example 20: Creating a pivot table")
sales_df.to_csv("06_sales_data.csv", index=False)
pivot = sales_df.pivot_table(
    values='Total',
    index='Product',
    columns='Region',
    aggfunc='sum',
    fill_value=0
).round(2)
print("Sales by Product and Region:")
print(pivot)
print()

# Example 20: Quick data visualization info
print("=" * 60)
print("BONUS: Quick visualization with pandas")
print("=" * 60)
print("\nPandas has built-in plotting (requires matplotlib):")
print("  df.plot(kind='bar')  # Bar chart")
print("  df.plot(kind='line')  # Line chart")
print("  df.plot(kind='scatter', x='col1', y='col2')  # Scatter plot")
print("  df['column'].hist()  # Histogram")
print("\nExample: df['Salary'].plot(kind='bar', title='Salaries')")
print()

print("=" * 60)
print("KEY PANDAS METHODS TO REMEMBER:")
print("=" * 60)
print("""
Data Loading:
  - pd.read_csv('file.csv')
  - pd.read_excel('file.xlsx')
  - df.to_csv('file.csv')

Data Inspection:
  - df.head() / df.tail()
  - df.info()
  - df.describe()
  - df.shape

Selection:
  - df['column']
  - df[['col1', 'col2']]
  - df.iloc[0]  # by integer position
  - df.loc[0]   # by label

Filtering:
  - df[df['age'] > 30]
  - df[df['city'] == 'NYC']

Aggregation:
  - df.groupby('column').mean()
  - df.groupby('column').agg(['sum', 'mean', 'count'])

Cleaning:
  - df.isnull()
  - df.fillna(value)
  - df.dropna()

Sorting:
  - df.sort_values('column')
  - df.sort_values(['col1', 'col2'], ascending=[True, False])
""")

print("Files created in this example:")
print("  - 06_employees.csv")
print("  - 06_sales_data.csv")
print("\nNext steps: Explore the pandas documentation at https://pandas.pydata.org/")
