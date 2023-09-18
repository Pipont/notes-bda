# Clase 02 de Semana 08
## Base de datos avanzadas

Aplicaciones de bases de datos


Iniciamos la máquina virtual del gcloud


> Debemos de comprender conceptos de External IP e Internal IP al momento de hacer uso de las máquinas virtuales

Puerto es una "puerta" que permite entrar o salir datos, el puerto 80 es el puerto estándar de todo servidor web.
* Los DBMS de mariadb utiliza el puerto **3305**.
* Postgress utiliza el puerto **45321**.
* El servicio FLASK utiliza el puerto **5000**.


- - -
### En la máquina virtual
Instalar el servicio httpd
```shell
sudo dnf install httpd
```
Inicializar el servicio httpd
```shell
sudo systemctl start httpd.service
```
Verificar estado del servicio
```shell
sudo systemctl status httpd.service
```
- - -
Asimismo, se debe de habilitar el puerto 80 para poder hacer uso del servicio

1. Buscar Firewall 
2. Configurar para toda la red
3. Recepcionar de cualquier IP 0.0.0.0/0
4. Abrir el puerto 80 - TCP / 80


> **Nota**: TCP envia fragmento de los paquetes de datos que permiten que el dispositivo receptor pueda verificar si están correcto; mientras que, UDP envía todo el paquete sin la verificación correspondiente. 
- - -
Ahora se debe configurar el servicio para que esté disponible cada vez que se inicie la maquina virtual

```shell
sudo systemctl enable httpd.service
```

Ahora se instalará el mariadb-server
```shell
sudo dnf install mariadb-server
```
Inicializar servicio de mariadb
```shell
sudo systemctl start mariadb.service
```
Verificar estado del servicio
```shell
sudo systemctl status mariadb.service
```
Habilitar el servicio de mariadb
```shell
sudo systemctl enable mariadb.service
```

Habilitar permisos de superusuario
```
sudo su -
```
Ejecutar el instalador de mariadb
```
mariadb-secure-installation 
```

> Se debe de dar un remover a los usuarios anonimos y los usuarios root remotos.



- - -
## Instalación de Flask
Ingresaremos a la carpeta Proyectos
```shell
cd Proyectos/
```
Verificar la ruta
```shell
pwd
```
Realizar la instalación del gestor de paquetes de python pip
```shell
sudo dnf install pip
```
Instalar las herramientas de desarrollo
```shell
sudo dnf groupinstall "Development Tools"
```
Instalar todo lo necesario de mariadb
```shell
sudo dnf install mariadb*
```
Instalar los componentes de desarrollo de python
```shell
sudo dnf install python-devel
```
Instalar Flask
```shell
pip install Flask
```
Instalar el paquete response
```shell
pip install response
```
Instalar el driver de conexión
```shell
pip install flask_mysqldb
```
- - -
## Iniciando con Flask
Crear un directorio
```shell
mkdir ejempl01
```
Ingresar al directorio
```shell
cd ejemplo01/
```
Abrir y crear un archivo app.py
```shell
vi app.py
```
Dentro del archivo, deberemos de colocar lo siguiente

```py
from flask import Flask #Importando flask

app = Flask(__name__) #Inicializando la aplicación como un proyecto Flask

@app.route("/")  # Ruta principal
def prueba():
    return '<h1Hola a todos></h1>' #Retornar una estructura HTML
``` 






