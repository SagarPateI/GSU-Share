import pymysql
from app import app
from db_config import mysql
from flask import Flask, request, render_template, request, redirect, session, flash, url_for, jsonify
from datetime import timedelta
app.secret_key = "hello"

# rendering static pages using template index, about_us, content, copyright,contact,
# layout, login, portfolio, privacy policy, registeration, terms of service
# routes and functions

# page not found handler
@app.errorhandler(404)
def not_found(e):
    return render_template("404.html")

# index page
@app.route("/")
def index():
    return render_template("index.html")

# login page
@app.route("/login", methods=["POST", "GET"] )
def login():
    if request.method == "POST":
        session.permanent = True
        user = request.form["username"]
        password = request.form["password"]
        
        # Check if login information is valid
        messages = validate_login(user, password)
        if messages:
            # Login information is invalid
            for message in messages:
                flash(message, "error")
            return redirect(url_for("login"))
        
        session["user"] = user
        flash("Login Successful!")
        return redirect(url_for("resource_list"))
    else:
        if "user" in session:
            flash("Already Logged in!")
            return redirect(url_for("resource_list"))
        return render_template("login.html")
def validate_login(username, password):
    messages = []
    
    if not username:
        messages.append("Username is required.")
    if not password:
        messages.append("Password is required.")
    
    # Add any additional validation checks here
    
    return messages

# resource list page
@app.route("/resource_list")
def resource_list():
    if "user" in session:
        return render_template("resource_list.html")
    else:
        flash("You need to log in first.")
        return redirect(url_for("login"))

# logout page
@app.route("/logout")
def logout():
    session.pop("user", None)
    flash("You have been logged out!")
    return redirect(url_for("login"))

# about us page
@app.route("/about us")
def aboutUs():
    return render_template("aboutUs.html")

# content page
@app.route("/content")
def content():
    return render_template("content.html")

# copyright page
@app.route("/copyright")
def copyright():
    return render_template("copyrightNotice.html")

# contact us page
@app.route("/contact")
def contact():
    return render_template("contactus.html")

# post page
@app.route("/postpage")
def postpage():
    return render_template("postPage.html")

# portfolio page
@app.route("/portfolio")
def portfolio():
    return render_template("portfolio.html")

# privacy page
@app.route("/privacy")
def privacy():
    return render_template("privacypolicy.html")

# registration page
@app.route("/registration")
def registration():
    return render_template("registration.html")

# terms and conditions page
@app.route("/terms")
def terms():
    return render_template("termsofService.html")

#Get records from a specific table in JSON format
#http://localhost/user
@app.route('/contentdb')
def contentdb():
    try:
        #MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor) #The function is actually cursor(), not cur()
        
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

        cur.close() #The finally block was removed and its content was placed here
        conn.close()

    except Exception as e: #(If there is an error, it will be returned in a JSON format)
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

            #MySQL connection
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
                resp.status_code =200

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

# count the number of resources in the database
@app.route('/count')
def count():
    try:
        #MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor)
        
        cur.execute("SELECT COUNT(*) total FROM contenttable;")
       
        rows = cur.fetchall()

        resp = jsonify(rows)
        resp.status_code = 200

        cur.close() #The finally block was removed and its content was placed here
        conn.close()

        return resp

    except Exception as e: #(If there is an error, it will be returned in a JSON format)
        message = {
        'status': 500,
        'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp

# get content from database
# this function is tide with search bar and edit page
@app.route('/fetch_content', methods = ['GET']) #Changed the path to 'users'
def fetch_content():
    try:
        #Obtaining arguments
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

        #MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor) #The function is actually cursor(), not cur()
        
        cur.execute("SELECT * FROM contenttable "+whereString+" ORDER BY "+orderBy+" "+orderAscDesc+" LIMIT "+str((pageNo-1)*limit)+","+str(limit)+";")
        #SELECT * FROM user WHERE username = 'username5' ORDER BY ID DESC LIMIT 10,5;
        rows = cur.fetchall()
        print("Records returned: "+str(len(rows)))

        cur.close() #The finally block was removed and its content was placed here
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

    except Exception as e: #(If there is an error, it will be returned in a JSON format)
        message = {
        'status': 500,
        'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp

# get content by id
@app.route('/cont/<int:id>')
def view_cont(id):
    try:
        #MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor) #The function is actually cursor(), not cur()
        
        cur.execute("SELECT * FROM contenttable WHERE id = %s;",id)
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

        cur.close() #The finally block was removed and its content was placed here
        conn.close()

    except Exception as e: #(If there is an error, it will be returned in a JSON format)
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
        #MySQL connection
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor) #The function is actually cursor(), not cur()
        
        cur.execute("SELECT * FROM contenttable WHERE id = %s;",id)
        rows = cur.fetchall()
        print("Records returned: "+str(len(rows)))

        if len(rows) > 0:
            cur.execute("DELETE FROM contenttable WHERE id = %s;",id)
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

        cur.close() #The finally block was removed and its content was placed here
        conn.close()

    except Exception as e: #(If there is an error, it will be returned in a JSON format)
        message = {
        'status': 500,
        'message': 'Error: '+str(e)
        }
        resp = jsonify(message)
        resp.status_code = 500
        return resp


if __name__ == "__main__":
     app.run()