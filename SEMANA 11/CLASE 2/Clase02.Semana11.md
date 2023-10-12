# Clase 02 - Semana 11
## Bases de datos avanzadas

### ¿Qué es AJAX?

Asynchronous Javascript XML, su finalidad es hacer micropeticiones. Funcionalmente para los autocompletados
```
<T>
→Toyota
→Tarrito
→Terminado
```
```
<To>
→Toyota
```
- - -
### Visualización de datos en gráficos

Esto se realiza a través de análisis de datos o gráfica de barras. Esto con la finalidad de interpretar los gráficos a partir de un query.

Para ello, se utiliza la librería llamada [**Highcharts**](https://www.highcharts.com/)

 - - -

### Creando la vista de categorías y productos
Ingresando a la base de datos

```shell
mysql -u agencia_user -p Agencia
```

Verificar las tablas

```sql
SHOW TABLES;
```

Verificamos la descripción de la tabla Productos
```sql
DESC Productos;
```

Insertar datos en Categorías
```sql
INSERT INTO Categorias (Nombre) VALUES ('Hibrido');
```

Cambiamos la columna Imagen
```sql
ALTER TABLE Productos MODIFY Imagen varchar(500);
```

Insertamos
```sql
INSERT INTO Productos (nombre, descripcion, categoria_id) VALUES ('Honda', 'Accord', 5), ('Toyota','Camry', 5), ('Ford', 'Focus', 2), ('Kia','Forte',2)
```

Actualizamos los productos
```sql
UPDATE Productos SET Precio = 900000, Imagen = 'https://img.remediosdigitales.com/1dd87c/honda-accord-2018-mexico_/840_560.jpg' WHERE id = 1;
```

Para almacenar los datos especificamente en en la base de datos se utiliza un BLOB o CLOB
que está centrando en descomponer una imagen. El DBMS transforma la imagen en codigo y la almacena, para su posterior utilización. En sistemas reales las imagenes se almacenan en Buckets.

- - -

Ingresamos al directorio de Proyectos 
```shell
cd Proyectos
```

Copiamos de *ejemplo08* a *ejemplo09*
```shell
cp -fR ejemplo08 ejemplo09
```

Ahora se modificará el vista.py del ejemplo09
```shell
cd ejemplo09
```
```shell
vi vista.py
```

Se añadirá esto
```py
@app.route('/selecciona')
def selecciona():
    cursor = mysql.connection.cursor()
    cursor.execute(''' SELECT * FROM Categorias  ''')
    categorias = cursor.fetchall()
    cursor.close()
    return render_template('selecciona.html', categorias=categorias)

@app.route('/productos/<categoria_id>')
def productos(categoria_id):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM Productos WHERE Categoria_id = %s ", [categoria_id])
    productos = cursor.fetchall()
    cursor.close()
    return render_template('productos.html', productos=productos)
```

Ahora en el directorio de templates, crearemos los archivos necesarios
```shell
cd templates
```

```shell
vi selecciona.html
```

En el archivo, se desarrolla lo siguiente
```html
<!DOCTYPE html>
<html>
 <head>
  <title>DropDown Menu</title>
 </head>
<body>
 <h2>Men&uacute; Desplegable</h2>
 <hr>
 <form method="GET" action="{{ url_for('productos', categoria_id=categoria_id) }}"> 
    <select name="categoria">
      {% for categoria in categorias %}
        <option value="{{ categoria[0] }}">{{ categoria[1] }} </option>
      {% endfor %}
    </select>
    <button type="submit">Mostrar productos</button>
 </form>

</body>
</html>
```

Ejecutamos la aplicación
```shell
export FLASK_APP=vista.py
flask run --host=0.0.0.0
```

