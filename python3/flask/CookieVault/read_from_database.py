# This file reads data from the database and prints it

import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect("bakery.db")

# Create a cursor
c = conn.cursor()

# Select all rows from the cookies table
c.execute("SELECT * FROM cookies")

# Fetch all the rows
cookies = c.fetchall()

# Print the rows
for cookie in cookies:
    print(cookie)

# Close the connection
conn.close()
