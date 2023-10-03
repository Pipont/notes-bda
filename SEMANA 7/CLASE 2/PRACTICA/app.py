from flask import Flask

app = Flask(__name__)

@app.route("/")
def prueba():
    return '<font color="blue"><h1>Hola a todos, soy Pedro</h1></font>'