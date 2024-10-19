from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)


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

@app.route('/')
def show_cookies():
    cookies = get_cookies()
    sales = get_sales()
    return render_template(
        'cookies.html',
    cookies=cookies,
       sales=sales)


@app.route('/update_stock', methods=['POST'])
def update_stock():
    cookie_id = request.form['cookie_id']
    new_stock = request.form['new_stock']

    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    # Vulnerable to SQL injection
    query = f"UPDATE cookies SET stock = {new_stock} WHERE id = {cookie_id}"
    c.execute(query)
    conn.commit()
    conn.close()

    return redirect(url_for('show_cookies'))

if __name__ == '__main__':
    app.run(debug=True)