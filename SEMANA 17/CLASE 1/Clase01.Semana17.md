# Clase 01 - Semana 17
## Bases de datos avanzadas


En nuestro Login, ingresaremos esto:
```html
l>
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
                 <script src="{{ url_for('static',filename='js/script.js' )}}"></script>
 </center>
 <!-- Fin del cuerpo del documento -->
 </body>
```

Cambiamos la sección de filename = 'js/script.js' porque buscará dentro de esa carpeta


Ahora ingresaremos al directorio de js
```sh
cd static/js
```

Ahora utilizaremos la sintaxis para recorrer a través del DOM
```js
$(document).ready(function(){
  $('#login-form').submit(function(event){
        event.preventDefault();
        $.ajax(
                {
                        url:'/login',
                        method: 'POST',
                        data: $(this).serialize(),
                        success: function(response) {
                                window.location.href = response;
                        },
                        error: function(xhr){
                                $('#mensaje').text('Credenciales invalidas')
                        }
                }
        )
  })
});
```

Faltaba hacer uso de la librería y de jquery en el template

```html
<!DOCTYPE html>
 <html>
  <head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="{{ url_for('static', filename='css/estilo.css') }}">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
		<form id="login-form">
			<input type="email" name="email" placeholder="Correo electr&oacute;nico" required>
			<input type="password" name="contrasenia" placeholder="Contrase&ntilde;a" required>
			<button type="submit"> Iniciar sesi&oacute;n</button>
		</form>
		 </div>
		 <script src="{{ url_for('static',filename='js/script.js' )}}"></script>
 </center>
 <!-- Fin del cuerpo del documento -->
 </body>
</html>

```

Asimismo, se debe considerar que el login en el app.py debe estar de la siguiente manera
```py
@app.route('/login',methods=['GET','POST'])
def login():
    mensaje = None
    if request.method == 'POST':
        email = request.form['email']
        contrasenia = request.form['contrasenia']

        ## Vamos a llamar a los Stored Procedure
        var = ""
        cursor = mysql.connection.cursor()
        resultado = cursor.callproc('verificar_login',(email,contrasenia, var))
        cursor.execute('SELECT @_verificar_login_2')
        resultado = cursor.fetchone()[0]
        
        if resultado[0] == 1:
            return "Bienvenido"
        else:
            mensaje = "Usuario o contraseña incorrectos"
        cursor.close()
    return render_template('index.html', mensaje=mensaje)
```