# Clase 02 - Semana 12
## Bases de datos avanzadas

Nos dirigimos al directorio de *Proyectos*
```sh
cd Proyectos
```

Ingresamos al directorio del *ejemplo09*
```sh
cd ejemplo09
```

Verificamos lo realizado en la *vista.py*
```shell
vi vista.py
```

Realizamos la verificación de lo avanzado en la sesión anterior e ingresaremos
```sh
vi templates/buscar.html
```

Para desarrollar el template correspondiente
```html
<!DOCTYPE html>
<html>
<head>
   <title>Ejemplo de Autocomplete</title>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="{{url_for('static', filename='js/autocompleta.js')}}"></script>
</head>
<body>

   <h1>Autocompletar</h1>
   <hr>
   <form>
      <label for="input">Escribe el modelo del auto:</label>
      <input type="text" id="input" name="input" />
   </form>
   <div id="resultado"></div>
</body>
</html>
```
Ahora se desarrollará el archivo correspondiente a *autocompleta.html*
```sh
vi autocompleta.html
```

De este modo, se realizará lo siguiente
```html
<ul>
 {% for result in resultado %}
    <li>{{result[0]}}</li>
 {% endfor %}
</ul>
```

Ahora ingresaremos al directorio static
```sh
cd static
```

Crearemos el directorio js
```sh
mkdir js
```

Ahora crearemos el archivo correspondiente de *autocompleta.js*
```sh
vi autocompleta.js
```


Aprovecharemos JQuery para poder realizar lo necesario
```js
$(document).ready(function(){
  $('#input').keyup(function(){
    $.ajax({
        type: 'POST',
        url: '/autocomplete',
        data: {
           input: $('#input').val()
        },
        success: function(data){
           $('#resultado').html(data);
        }
    });
  });
});
```


Existen aplicaciones que están predeterminadas para ser Responsivas; en el caso de React, son tecnologías híbridas que realiza la transformación para diferentes dispositivos. Se recomienda para diferentes puntos Ionic, Svelte, Cordova.

Content Delivery Network: Permite mandar los complementos necesarios para el desarrollo, despliegue y producción. Es recomendable incluir este tipo de manejo.