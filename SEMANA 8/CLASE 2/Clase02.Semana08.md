# Clase 02 - Semana 08
## Bases de datos avanzadas

### Ambientes de desarrollo

Existen tres tipos de ambientes de desarrollo

1. Development, que es nuestro ambiente personal donde realizamos el desarrollo del código.

2. Testing, Staging: que es una computadora muy similar a la computadora final donde se ejecutará completamente. Es importante que este staging tenga una dirección IP pública. Durante  este ambiente, el cliente validará las características del sistema, si no lo aprueba, no pasa a la siguiente fase.

3. Production: En esta fase el sistema está completo, acá se ejecutará definitivamente.

- - -
### Pasando de ambiente development hacia testing

En el caso se desee hacer desde nuestra máquina virtual se puede realizar instalando lo necesario
```
pip install Flask
```
Luego, podremos realizar la codificación necesaria
```py
from flask import Flask

@app.route("/")
def pagina():
    return "<h1>Hola</h1>"
```

Se hace una muestra básica para poder desplegarlo, luego a través del Shell de Google Cloud podemos subir el archivo.
Un vez subido el archivo, debemo de verificar que el nombre se encuentre correcto

```shell
ls -l
```

Luego, exportamos la variable *FLASK_APP*
```shell
export FLASK_APP=app.py
```
Ejecutamos Flask
```shell
flask run --host=0.0.0.0
```

Con ello, ya se pudo realizar la subida de los archivos que desarrollamos desde nuestra computadora hacia la máquina virtual

- - -
Por motivos prácticos, se moverá el archivo hacia una carpeta de prueba en Proyectos

```shell
mkdir Proyectos/prueba
```
```shell
mv Proyectos/prueba/app.py
```
En el caso deseemos mover y renombrar el archivo
```shell
mv Proyectos/prueba/app.py ./prueba2.py
```
Con ello, se moverá el archivo app.py hacia nuestra ruta personal y luego se renombrará.

- - -

### Empezando con Jinja2

Realizaremos una copia del directorio *ejemplo03*
```shell
cp -fR ejemplo03 ejemplo04
```

Nos movemos hacia el directorio *ejemplo04*
```shell
cd ejemplo04
```

Ahora, dentro del directorio, generaremos las carpetas *static/css* y *static/images*
```shell
mkdir static/css
mkdir static/images
```

Jinja se permite comunicar entre python, enviando mensajes hacia el HTML. 

Ingresamos hacia la ruta de templates
```shell
cd templates
```

Abrimos la página para visualización
```shell
vi pagina.html
```

En el header, se colocará
```html
<!-- Permite los carácteres especiales -->
<meta charset="UTF-8"> 
```

Asimismo, se adicionará
```html
<!-- Permite mantener la vista responsiva, se maneja que la vista se vea al máximo siempre y no sea escalable-->
<!-- Estas etiquetas son metas -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
```

Del mismo modo, se adicionará la conexión al archivo css utilizando Jinja2
```html
<link rel="stylesheet" href="{{ url_for('static',filename='css/estilo.css') }}">
```
Con ello, se realiza la búsqueda del archivo, tomando en consideración el url de la carpeta origen.

Salimos del archivo
```shell
:wq
```

Crearemos el archivo *css*
```shell
vi static/css/estilo.css
```

En el archivo *css*, se realizará lo siguiente

```css
body {
  background-color: lightblue;
}

h1 {
  color: white;
  text-align: center;
}

p {
  font-family: verdana;
  font-size: 20px;
}
```

- - -

### Conectando con la base de datos

Creamos un nuevo directorio en Proyectos
```shell
mkdir ejemplo05
```

Generamos todas las rutas necesarias

```shell
mkdir ejemplo05/templates
mkdir ejemplo05/static
mkdir ejemplo05/static/images
mkdir ejemplo05/static/css
```

De este modo, se maneja el siguiente modo
```shell
ejemplo05
├── static
│   ├── css
│   └── images
└── templates
```

Ahora realizaremos la copia del archivo *css* del *ejemplo04* hacia el ejemplo05
```shell
cp ejemplo04/static/css/estilo.css ejemplo05/static/css/
```

Igualmente, se realizará con el *html* del *ejemplo04*
```shell
cp ejemplo04/templates/pagina.html ejemplo05/templates/
```

De este modo, el directorio del *ejemplo05* quedará de la siguiente manera

```shell
ejemplo05
├── static
│   ├── css
│   │   └── estilo.css
│   └── images
└── templates
    └── pagina.html
```

Ingresamos al directorio de *ejemplo05*
```shell
cd ejemplo05
```

Abrimos el *pagina.html*

```shell
vi templates/pagina.html
```

Dentro del archivo limpiaremos lo que no utilizaremos.
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
 
 <!-- Fin del cuerpo del documento -->
 </body>
</html>
```

- - -

### Creando la base de datos

Ingresamos a mariadb con el usuario root
```shell
mysql -u root -p
```
Creamos la base de datos **Agencia**
```sql
CREATE DATABASE Agencia;
```

Creamos un usuario *agencia_user* con permisos en la base de datos creada
```sql
GRANT ALL PRIVILEGES ON Agencia.* TO agencia_user@localhost IDENTIFIED BY '666';
FLUSH PRIVILEGES;
```

Ahora, utilizaremos la base de datos
```sql
USE Agencia;
```

Crearemos la tabla **Autos**
```sql
CREATE TABLE Autos (
    id int auto_increment primary key,
    Nombre varchar(50),
    Modelo varchar(50),
    Anio int(11),
    Precio int(40)
);
```

Insertaremos datos a la tabla
```sql
INSERT INTO Autos (Nombre,Modelo,Anio,Precio) VALUES ('Honda','Accord',2023,900000),
       ('Toyota','Camry',2023,750000),
       ('Ford','Focus',2023,500000),
       ('Kia','Forte',2024,390000);
```

De este modo, se queda el registro con el siguiente

```bash
+----+--------+--------+------+--------+
| id | Nombre | Modelo | Anio | Precio |
+----+--------+--------+------+--------+
|  1 | Honda  | Accord | 2023 | 900000 |
|  2 | Toyota | Camry  | 2023 | 750000 |
|  3 | Ford   | Focus  | 2023 | 500000 |
|  4 | Kia    | Forte  | 2024 | 390000 |
+----+--------+--------+------+--------+
```

- - - 

**Objetivo del día**: Se pudo realizar la conexión de *css* con el archivo html generado utilizando jinja, igualmente se generó lo necesario en la base de datos para poder utilizarlo


