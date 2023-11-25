from flask import Flask, render_template, request
## Importamos la librería flask_mysqldb
# Con ello pemrmitirá conectar con la DB
from flask_mysqldb import MySQL

app = Flask(__name__)
mysql = MySQL(app)

###
# Datos de acceso a la Base de Datos
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='agencia_user'
app.config['MYSQL_PASSWORD']='666'
app.config['MYSQL_DB']='Agencia'

print("Conexión exitosa")

## Creando ruta
@app.route('/')
def inicio():
    return render_template('index.html')

#### Lectura
## Acceder a la base de datos y mostrar registros
@app.route('/ver', methods=['GET'])
def ver_datos():
    cursor = mysql.connection.cursor()
    # Ejecutamos la sentencia SQL para obtener todo
    cursor.execute('''SELECT id,Nombre, Modelo,Precio FROM Autos''')
    # Almacenamos todo lo necesario en nuestra variable Autos, a través del método fetchall()
    Autos = cursor.fetchall()
    
    # Enviaremos los datos hacia el pagina.html donde Jinja2 los recepcionará
    return render_template('pagina.html', Autos=Autos)

#### Insert de datos
@app.route('/insertar', methods=['GET'])
def insertar():
    return render_template('insertar.html')

@app.route('/insert', methods=['GET','POST'])
def insert():
    if request.method == 'GET':
        return "M&eacute;todo err&oacute;neo, favor de usar el correcto"
    if request.method == 'POST':
        nombre = request.form['nombre']
        precio = request.form['pre']
        modelo = request.form['m']
        cursor = mysql.connection.cursor()
        cursor.execute(''' INSERT INTO Autos (Nombre, Modelo, Precio) VALUES (%s,%s,%s) ''',(nombre, modelo, precio))
        mysql.connection.commit()
        cursor.close()
        return ver_datos()

#### Borrado de datos
@app.route('/borrar/<string:id>')
def borrar(id):
    cursor = mysql.connection.cursor()
    cursor.execute(''' DELETE FROM Autos WHERE id=%s ''', (id,))
    mysql.connection.commit()
    cursor.close()
    return ver_datos()

if __name__ == '__main__':
    app.run(debug=True)
