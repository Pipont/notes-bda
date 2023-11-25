from flask import Flask, request, render_template

from flask_mysqldb import MySQL

app = Flask(__name__)
mysql = MySQL(app)


app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='hotel_user'   
app.config['MYSQL_PASSWORD']='123'
app.config['MYSQL_DB']='Hotel'

@app.route('/')
def inicio():
    return render_template('inicio.html')

@app.route('/habitaciones', methods=['GET'])
def ver_habitaciones():
    cursor = mysql.connection.cursor()
    cursor.execute(''' SELECT numero_habitacion, camas_habitacion, categoria_habitacion, costo_habitacion FROM Habitaciones ''') 
    habitaciones = cursor.fetchall()
    cursor.close()
    return render_template('lista_habitaciones.html', habitaciones=habitaciones)

@app.route('/crear_reserva', methods=['GET','POST'])
def crear_reserva():
    cursor = mysql.connection.cursor()
    cursor.execute(''' SELECT * FROM Habitaciones ''')
    habitaciones = cursor.fetchall()
    if request.method == "GET":
        return render_template('crear_reserva.html', habitaciones=habitaciones)
    elif request.method == "POST":
        habitacion_id = request.form["habitacion_id"]
        usuario_id = request.form["usuario_id"]
        fecha_reserva = request.form["fecha_reserva"]
        fecha_fin = request.form["fecha_fin"]
        costo_reserva = request.form["costo_reserva"]
        cursor.execute(''' INSERT INTO HabitacionReservas (habitacion_id, usuario_id, fecha_reserva, fecha_fin, costo_reserva) VALUES (%s,%s,%s,%s) ''', (habitacion_id, usuario_id, fecha_reserva, fecha_fin,))
        cursor.close()
        return crear_reserva()

@app.route('/lista_usuarios', methods=['GET'])
def ver_usuarios():
    cursor = mysql.connection.cursor()
    cursor.execute(''' SELECT * FROM Usuarios ''')
    usuarios = cursor.fetchall()
    return render_template("lista_usuario.html", usuarios=usuarios)

@app.route('/reservas_usuario/<int:usuario_id>', methods=['GET'])
def ver_reservas(usuario_id):
    cursor = mysql.connection.cursor()
    cursor.execute(''' SELECT * FROM HabitacionReservas WHERE usuario_id = %s ''')
    habitaciones = cursor.fetchall()
    cursor.close()
    return render_template("lista_mis_habitaciones.html", habitaciones=habitaciones)


if __name__ == '__main__':
    app.run(debug=True)
