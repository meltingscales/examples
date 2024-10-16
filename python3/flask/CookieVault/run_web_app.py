# run `pip install flask` if you haven't already
from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

def get_cookies()->list[tuple]:
    conn = sqlite3.connect('bakery.db')
    c = conn.cursor()
    c.execute('SELECT * FROM cookies')
    cookies = c.fetchall()
    conn.close()
    return cookies

@app.route('/')
def show_cookies():
    cookies = get_cookies()
    return render_template('cookies.html', cookies=cookies)

if __name__ == '__main__':
    app.run(debug=True)
