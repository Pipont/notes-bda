# Clase 02 - Semana 16
## Bases de datos avanzadas

Al momento de iniciar, se debe de considerar un Stored Procedure que permita realizar el login. De este modo, se tendrá que utilizar la tabla de Login para realizar ello.

```sql
DELIMITER //
CREATE PROCEDURE registroUsuario(
    IN nombre VARCHAR(50),
    IN appaterno VARCHAR(50),
    IN apmaterno VARCHAR(50),
    IN correo VARCHAR(100),
    IN pass VARCHAR(100)
)
BEGIN
    DECLARE usuario_id INT;

    -- Verificamos si el usuario existe
    IF (SELECT EXISTS (SELECT 1 FROM Login WHERE email = correo)) THEN
        SELECT 'Este usuario ya existe!';
    ELSE
        INSERT INTO Usuarios (nombre,apaterno,amaterno)
        VALUES (nombre,appaterno,apmaterno);
    
    -- Obtenemos el Id del Usuario insertado
    SET usuario_id = LAST_INSERT_ID();

    -- Ahora Insertamos los datos en la tabla Login
    INSERT INTO Login (usuario_id, contrasenia, email)
    VALUES (usuario_id, pass, correo);

    SELECT 'Registro exitoso' AS mensaje;
    END IF;
END //
DELIMITER ;
```
```sql
DELIMITER $$
CREATE PROCEDURE verificar_login(
    IN correo VARCHAR(100),
    IN password VARCHAR(100),
    OUT resultado INT
)
BEGIN
    SELECT COUNT(*) INTO resultado FROM Login WHERE (email=correo AND contrasenia=password);
END $$
DELIMITER ;
```

```sql
CALL verificar_login('peje@elpeje.com','1234',@resultado);
```

Ahora se debe de realizar la incorporación de FLASK para la funcionalidad necesaria.

Ahora realizaremos una copia del directorio de ejemplo09 a ejemplo10

```sh
cp -fR ejemplo09 ejemplo10
```


Ahora editaremos el archivo del index.html
```html
<!DOCTYPE html>
 <html>
  <head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="{{ url_for('static', filename='css/estilo.css') }}">
    <title>Muestra Datos de la Base de Datos</title>
  </head>
 <body>
 <!-- Cuerpo del documento  -->
 <hr>
  <!-- Crea una liga o referencia a otro documento -->
    <ul id="menu-bar">
        <li class="active"><a href="#"><span id="active">Main</span></a></li>
        <li><a href="/ver">Select</a>
        </li>
        <li><a href="#">Insert</a>
        </li>
        <li><a href="#">Update</a></li>
        <li><a href="#">Delete</a></li>
    </ul>
  <!-- Crea una liga o referencia a otro documento -->
 <hr>
 <h1> Inicio de Sesión</h1>
 <center>
         <div class="container">
                {% if mensaje %}

                        <p class="error">{{ mensaje }}</p>
                {% endif %}
                <!--- Inicio de Login --->
                <form id="login-form" method='POST' >
                        <input type="email" name="email" placeholder="Correo electr&oacute;nico" required>
                        <input type="password" name="contrasenia" placeholder="Contrase&ntilde;a" required>
                        <button type="submit"> Iniciar sesi&oacute;n</button>
                </form>
                 </div>
                 <script src="{{ url_for('static',filename='script.js' )}}"></script>
 </center>
 <!-- Fin del cuerpo del documento -->
 </body>
</html>
```

Con ello, deberemos ahora modificar el app.py
```py
@app.route('/login',methods=['GET','POST'])
def login():
    mensaje = None
    if request.method == 'POST':
        email = request.form['email']
        contrasenia = request.form['contrasenia']

        ## Vamos a llamar a los Stored Procedure
        cursor = mysql.connection.cursor()
        cursor.callproc('verificar_login',(email,contrasenia, 0))
        resultado = cursor.fetchone()[0]

        if resultado == 1:
            return redirect('bienvenida')
        else:
            mensaje = 'Credenciales inválidas, intente de nuevo'
```



