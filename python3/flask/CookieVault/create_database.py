import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect("bakery.db")
c = conn.cursor()


def create_cookies():
    """Create the cookies table and add some data"""
    # Create a table
    c.execute(
        """CREATE TABLE IF NOT EXISTS cookies
                 (id INTEGER PRIMARY KEY, name TEXT, price REAL, stock INTEGER)"""
    )

    # check if we already have data
    c.execute("SELECT * FROM cookies")
    if c.fetchone() is not None:
        print("Cookie data already exists in the database. Exiting...")
        return

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


def create_sales():
    """Create the sales table"""
    # Create a table
    c.execute(
        """CREATE TABLE IF NOT EXISTS sales
                 (id INTEGER PRIMARY KEY, 
                 cookie_id INTEGER,
                  quantity INTEGER,
                   sale_date TEXT,
                   profit REAL)"""
    )

    # check if we already have data
    c.execute("SELECT * FROM sales")
    if c.fetchone() is not None:
        print("Sales data already exists in the database. Exiting...")
        return

    # Add some sales
    sales = [
        (1, 1, 3, "2021-01-01", 4.50),
        (2, 2, 2, "2021-01-02", 3.50),
        (3, 3, 1, "2021-01-03", 2.00),
    ]
    c.executemany("INSERT INTO sales (id, cookie_id, quantity, sale_date, profit) VALUES (?, ?, ?, ?, ?)", sales)

    # Commit and close
    conn.commit()
    print("Sales table created")


if __name__ == "__main__":
    create_cookies()
    create_sales()