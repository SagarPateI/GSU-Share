from flask import Flask, request, render_template, redirect
app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/about us")
def aboutUs():
    return render_template("aboutUs.html")

@app.route("/content")
def content():
    return render_template("content.html")

@app.route("/copyright")
def copyright():
    return render_template("copyrightNotice.html")

@app.route("/login")
def login():
    return render_template("login.html")

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