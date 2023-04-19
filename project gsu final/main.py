import pymysql
from app import app
from db_config import mysql
from flask import request, render_template, redirect, session, flash, url_for, jsonify
from datetime import timedelta
app.secret_key = "hello"

# rendering static pages using template index, about_us, content, copyright,contact,
# layout, login, portfolio, privacy policy, registeration, terms of service
# routes and functions


@app.errorhandler(404)
def not_found(e):
    return render_template("404.html")


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/login", methods=["POST", "GET"])
def login():
    if request.method == "POST":
        session.permanent = True
        user = request.form["username"]
        password = request.form["password"]
        session["user"] = user
        flash("Login Successful!")
        return render_template("resource_list.html")
    else:
        if "user" in session:
            flash("Already Logged in!")
            return render_template("resource_list.html")
        return render_template("login.html")
    # return render_template("login.html")


@app.route("/aboutus")
def aboutUs():
    return render_template("aboutUs.html")


@app.route("/content")
def content():
    return render_template("content.html")


@app.route("/copyright")
def copyright():
    return render_template("copyrightNotice.html")


@app.route("/contact")
def contact():
    return render_template("contactus.html")


@app.route("/postpage")
def postpage():
    return render_template("postPage.html")


@app.route("/portfolio")
def portfolio():
    return render_template("portfolio.html")


@app.route("/privacy")
def privacy():
    return render_template("privacypolicy.html")


@app.route("/registration")
def registration():
    return render_template("registration.html")


@app.route("/terms")
def terms():
    return render_template("termsofService.html")


@app.route("/test")
def test():
    return render_template("test.html")


@app.route("/user", methods=["POST", "GET"])
def user():
    username = None
    if "user" in session:
        user = session["user"]

        if request.method == "post":
            email = request.form["username"]
            session["username"] = username
            flash("username was saved")
        else:
            if "username" in session:
                username = session["username"]
        return render_template("user.html", username=username)
    else:
        flash("you are not logged in!")
        return redirect(url_for("login"))


@app.route("/logout")
def logout():
    flash("you have been logged out!", "info")
    session.pop("user", None)
    session.pop("password", None)
    return redirect(url_for("login"))

# database to display the content

# Get records from a specific table in JSON format
# http://localhost/user


@app.route('/contentdb')  # Changed the path to 'users'
def contentdb():
    try:
        # MySQL connection
        conn = mysql.connect()
        # The function is actually cursor(), not cur()
        cur = conn.cursor(pymysql.cursors.DictCursor)

        cur.execute("SELECT * FROM contenttable;")
        rows = cur.fetchall()
        print("Records returned: "+str(len(rows)))

        if len(rows) > 0:
            resp = jsonify(rows)
            resp.status_code = 200
            return resp

        else:
            message = {
                'status': 404,
                'message': 'The table is empty'
            }
            resp = jsonify(message)
            resp.status_code = 404
            return resp

        cur.close()  # The finally block was removed and its content was placed here
        conn.close()

    # (If there is an error, it will be returned in a JSON format)
    except Exception as e:
        message = {
            'status': 500,
            'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp

# create resources


@app.route('/create', methods=['POST'])
def add_content():
    try:
        title = request.form['title']
        body = request.form['body']
        author = request.form['author']
        tags = request.form['tags']

        # MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor)

        if title and content and author and tags:
            sql = "INSERT INTO contenttable(title, body, author, tags) VALUES(%s, %s, %s, %s)"
            data = (title, body, author, tags)
            cur.execute(sql, data)
            conn.commit()

            message = {
                'status': 200,
                'message': 'Resource created successfully!'
            }
            resp = jsonify(message)
            resp.status_code = 200

            # return redirect(url_for("contentdb"))

        else:
            message = {
                'status': 510,
                'message': 'some of the fields are empty!'
            }
            resp = jsonify(message)
            resp.status_code = 510

            cur.close()
            conn.close()

            return resp
    except Exception as e:
        message = {
            'status': 500,
            'message': 'Error:' + str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp


@app.route('/count')
def count():
    try:
        # MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor)

        cur.execute("SELECT COUNT(*) total FROM contnettable;")

        rows = cur.fetchall()

        resp = jsonify(rows)
        resp.status_code = 200

        cur.close()  # The finally block was removed and its content was placed here
        conn.close()

        return resp

    # (If there is an error, it will be returned in a JSON format)
    except Exception as e:
        message = {
            'status': 500,
            'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp


@app.route('/fetch_content', methods=['GET'])  # Changed the path to 'users'
def fetch_content():
    try:
        # Obtaining arguments
        args = request.args
        title = args.get('title')
        author = args.get('author')
        orderBy = args.get('orderBy')
        orderAscDesc = args.get('orderAscDesc')
        limit = int(args.get('limit'))
        pageNo = int(args.get('pageNo'))

        whereString = ""
        if title is not None:
            whereString += "WHERE title = '"+title+"'"
        if author is not None:
            if whereString != "":
                whereString += "AND author = '"+author+"'"
            else:
                whereString += "WHERE author = '"+author+"'"

        # MySQL connection
        conn = mysql.connect()
        # The function is actually cursor(), not cur()
        cur = conn.cursor(pymysql.cursors.DictCursor)

        cur.execute("SELECT * FROM contenttable "+whereString+" ORDER BY "+orderBy +
                    " "+orderAscDesc+" LIMIT "+str((pageNo-1)*limit)+","+str(limit)+";")
        # SELECT * FROM user WHERE username = 'username5' ORDER BY ID DESC LIMIT 10,5;
        rows = cur.fetchall()
        print("Records returned: "+str(len(rows)))

        cur.close()  # The finally block was removed and its content was placed here
        conn.close()

        if len(rows) > 0:
            resp = jsonify(rows)
            resp.status_code = 200
            return resp

        else:
            message = {
                'status': 404,
                'message': 'The table is empty'
            }
            resp = jsonify(message)
            resp.status_code = 404
            return resp

    # (If there is an error, it will be returned in a JSON format)
    except Exception as e:
        message = {
            'status': 500,
            'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp


@app.route('/cont/<int:id>')
def view_cont(id):
    try:
        # MySQL connection
        conn = mysql.connect()
        # The function is actually cursor(), not cur()
        cur = conn.cursor(pymysql.cursors.DictCursor)

        cur.execute("SELECT * FROM contenttable WHERE id = %s;", id)
        rows = cur.fetchall()
        print("Records returned: "+str(len(rows)))

        if len(rows) > 0:
            resp = jsonify(rows)
            resp.status_code = 200
            return resp

        else:
            message = {
                'status': 414,
                'message': 'The content with the ID specified does NOT exist'
            }
            resp = jsonify(message)
            resp.status_code = 414
            return resp

        cur.close()  # The finally block was removed and its content was placed here
        conn.close()

    # (If there is an error, it will be returned in a JSON format)
    except Exception as e:
        message = {
            'status': 500,
            'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp


# delete records
@app.route('/delete/<int:id>')
def delete_res(id):
    try:
        # MySQL connection
        conn = mysql.connect()
        # The function is actually cursor(), not cur()
        cur = conn.cursor(pymysql.cursors.DictCursor)

        cur.execute("SELECT * FROM contenttable WHERE id = %s;", id)
        rows = cur.fetchall()
        print("Records returned: "+str(len(rows)))

        if len(rows) > 0:
            cur.execute("DELETE FROM contenttable WHERE id = %s;", id)
            conn.commit()
            message = {
                'status': 200,
                'message': 'The content with ID '+str(id)+' was deleted successfully'
            }

            resp = jsonify(message)
            resp.status_code = 414

            return render_template('/resource_list.html')

        else:
            message = {
                'status': 414,
                'message': 'The content with the ID specified does NOT exist'
            }
            resp = jsonify(message)
            resp.status_code = 414
            return resp

        cur.close()  # The finally block was removed and its content was placed here
        conn.close()

    # (If there is an error, it will be returned in a JSON format)
    except Exception as e:
        message = {
            'status': 500,
            'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp


if __name__ == "__main__":
    app.run(debug=True, port=8080, use_reloader=False)
