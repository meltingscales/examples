import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect("bakery.db")
c = conn.cursor()

# Create a table
c.execute(
    """CREATE TABLE IF NOT EXISTS cookies
             (id INTEGER PRIMARY KEY, name TEXT, price REAL, stock INTEGER)"""
)

# check if we already have data
c.execute("SELECT * FROM cookies")
if c.fetchone() is not None:
    print("Cookie data already exists in the database. Exiting...")
    conn.close()
    exit()

# Add some cookies
cookies = [
    ("Chocolate Chip", 2.50, 10),
    ("Oatmeal Raisin", 1.75, 5),
    ("Sugar Cookie", 2.00, 8),
]
c.executemany("INSERT INTO cookies (name, price, stock) VALUES (?, ?, ?)", cookies)

# Commit and close
conn.commit()
print("Cookies added to the database")
conn.close()
