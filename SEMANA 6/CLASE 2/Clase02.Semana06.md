# Clase 02 de Semana 06
## Base de datos avanzadas

### Aplicaciones de bases de datos


> **Conociendo:** Los procedimientos almacenados se realizan con el objetivo particular de ser utilizados para realizar consultas específicas.


Ahora se evaluará, **¿cómo ocupan las empresas las bases de datos?**

### Desarrollo de aplicaciones y SQL Embebido

* Arquitectura Cliente Servidor
* Flask Framework
* Elementos importantes a tomar en consideración **Routes** y funciones

- - -
### Cliente Servidor
Es la arquitectura más común que se podrá encontrar en cualquier sistema informático. 
Es uno de los estilos arquitectónicos distribuidos más conocidos, el cual está compuesto por dos componentes, el proveedor y el consumidor. El proveedor es un servidor que brinda una serie de servicios o recursos los cuales son consumidos por el Cliente.

En una arquitectura Cliente-Servidor existe un servidor y múltiple clientes que se conectan al servidor para recuperar todos los recursos necesarios para funcionar, en este sentido, el cliente solo es una capa para representar los datos y se detonan acciones para modificar el estado del servidor, mientras que el servidor es el que hace todo el trabjao pesado.

El servidor es un programa o conjuntos de programa ejecutandose continuamente.

El servidor internamente realiza una petición al DBMS y ahí realizará la secuencia de consulta para ejecutarse y devolver la información solicitada.

> A partir de este momento, todo lo que se desarrolla es una vista web. Una página web es solo estática, no se modifica dinámicamente. Una vista web significa que brinda contenido altamente dinámico que cambia en respuesta a las peticiones que se realicen.


### Framework
Un marco de trabajo, es una arquitectura que contiene herramientas, bibliotecas y funcionalidades adecuadas para construir y mantener proyectos masivos utilizando un enfoque rápido y eficiente. Están diseñados para optimizar los programas y promover la reutilización del código. Para crear el lado del servidor de la aplicación, debe usar un lenguaje del lado del servidor.

**Python** alberga numerosos marcos de este tipo, entre los que se encuentran **Django** y **Flask**. **Python Flask Framework** es un micro-framework ligero basado en Werkzeug, Jinja2. Se llama un marco de trabajo micro porque tiene como objetivo mantener su funcionalidad central pequeña pero típicamente extensible para cubrir una variedad de aplicaciones pequeñas y grandes.


- - -
#### Conexión a Google Cloud
Se realizará la conexión con una cuenta de Google Cloud a través del Google Cloud Console

Instalación APACHE en VM

Instalar el servicio httpd
```shell
sudo dnf install httpd
```
Iniciar el servicio httpd
```shell
sudo systemctl start httpd
```
Volverse superusuario
```shell
sudo su -
```
Ingresar a la ruta de Apache
```shell
cd /var/www/html/
```
Dentro del index.html mandaremos un echo
```
echo "Hola a todos" > index.html
```

Al momento de realizar e ingresar a la página web se visualizará el "Hola a todos"

> No obstante, se debe de aperturar la regla de firewall para permitir el tráfico en el puerto 80
