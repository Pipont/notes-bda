from flask import Flask

app = Flask(__name__)

@app.route("/")
def prueba():
    return '<h1>Hola a todos></h1>'