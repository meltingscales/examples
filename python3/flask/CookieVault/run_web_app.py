from flask import Flask, render_template, request, redirect, url_for
import sqlite3

SESSION_ID = "static-session-id-12345"

app = Flask(__name__)

# This function is called before every request
# This makes the app vulnerable to CSRF attacks because it allows malicious javascript to make requests to any endpoint outside of the app
@app.after_request
def add_cors_headers(response):
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
    return response


def get_cookies() -> list[tuple]:
    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    c.execute('SELECT * FROM cookies')
    cookies = c.fetchall()
    conn.close()
    return cookies

def get_sales() -> list[tuple]:
    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    c.execute('SELECT * FROM sales')
    sales = c.fetchall()
    conn.close()
    return sales

def get_comments() -> list[tuple]:
    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    c.execute('SELECT * FROM comments')
    comments = c.fetchall()
    conn.close()
    return comments

@app.route('/')
def show_cookies():
    cookies = get_cookies()
    sales = get_sales()
    comments = get_comments()
    return render_template(
        'cookies.html',
        cookies=cookies,
        sales=sales,
        comments=comments,
        session_id=SESSION_ID,
    )

@app.route('/update_stock', methods=['POST'])
def update_stock():
    cookie_id = request.form['cookie_id']
    new_stock = request.form['new_stock']

    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    # Vulnerable to SQL injection
    # i.e.
    # 1; DELETE FROM cookies; DELETE FROM comments; DELETE FROM sales; --
    query = "UPDATE cookies SET stock = " + str(new_stock) + " WHERE id = " + str(cookie_id)
    print("query", query)
    c.executescript(query)
    conn.commit()
    conn.close()

    return redirect(url_for('show_cookies'))

@app.route('/add_comment', methods=['POST'])
def add_comment():
    comment = request.form['comment']

    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    # Insert the comment into the database with a prepared statement
    c.execute("INSERT INTO comments (text) VALUES (?)", (comment,))
    conn.commit()
    conn.close()

    return redirect(url_for('show_cookies'))

if __name__ == '__main__':
    app.run(debug=True)