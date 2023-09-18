# Clase 01 de Semana 07
## Base de datos avanzadas


Durante la sesión se conocerá cómo desplegar e implementar la base de datos en un espacio separado.

Estructura de carpetas de **Flask**
```shell
FLASK
.
├── controllers
├── models
├── templates
└── static
    ├── config
    │   ├── css
    │   ├── js
    │   └── images
    └── other_static_files
```
- - -
### Conociendo más de Linux
Linux es un sistema operativo militarziado

```shell
/ -> raiz
/etc /var /tmp /local
```
> El sistema de archivos es jerárquico

Nosotros trabajaremos en el directorio */etc/home/user*.

La capacidad de acceso a los usuarios es superior al de Windows

El usuario /home/usr1 es un usuario mortal, ya que estará en la consola identificado con un $

Se le puede brindar permisos de administrador cuando se encuentre con un #, el cual es denominado como superuser o root.

Para que los servicios o aplicaciones desarrolladas requieren de una ip pública para que pueda ser visualizado a través de Internet en la red WAN o Internet.

> **Dato** El router configurado puede funcionar como un port forward para que se instale un servicio y al momento de consultar a la ip pública, se brindará ello

- - - 
### COMANDOS EN CONSOLA

Para conocer la maquina virtual
```shell
hostname
```
Conocer la ruta 
```shell
pwd #print working directory
```
Conocer al usuario actual
```shell
whoami
```
Limpiar los comandos de la ventana
```
clear
```
Ver los comandos introducidos
```
history
```
Listar
```shell
ls # list
```
Crear un archivo con extensión *.txt*
```shell
touch archivo.txt 
```
Listar en formato de lista
```shell
ls -l # listar en forma de lista, permite ver permisos
```
Notación de permisos
```shell
-rw-r--r--
# r: read
# w: write
# x: execute
# d: directory
```
La estructura según el Usuario, Grupo y Otros
```shell
-[rw-]|[r--]|[r--]
   U     G     O
U: usuario
G: grupo
O: otros
```
Cambiar los permisos
```shell
chmod -> change mod
```
Asignar permiso de ejecución a usuario y quitar permiso de lectura a otros
```shell 
chmod u+x,o-r archivo.txt
```
Asignar permiso de escritura a usuario y quitar permmiso de lectura a otros
```shell
chmod u+w,o-r archivo.txt
```
Adicionar permiso de ejecución y quitar permiso de lectura a grupo
```shell
chmod g+x-r archivo.txt
```
La gestión de permisos también se puede hacer con una secuencia de números
```shell
 [rw-]|[r--]|[r--]
 421 | 421 |  0
r: 4
w: 2
x: 1
```
Por ejemplo:
```shell
chmod 777 archivo.txt
```
Es equivalente a 
```shell
 [rwx]|[rwx]|[rwx]
 421 | 421 |  424
 7   | 7   |  7
```
Por otro lado
```shell
chmod 710 archivo.txt
```
Es equivalente a
```shell
 [rwx]|[--x]|[---]
 421 |    1 |  0
 7   |    1 |  0
```

Listar los archivos en formato de lista
```shell
ls -l
```
Crear un nuevo directorio
```shell
mkdir # make directory
```
Permisos actuales del directorio Proyectos
```shell
drwxr-xr-x. 2 pedro_soto pedro_soto 6 Sep 11 15:43 Proyectos
```
> Notar que tiene al inicio la *d* de Directorio

Cambiar permisos al directorio
```shell
chmod 700 Proyectos
```
Permisos actuales
```shell
drwx------. 2 pedro_soto pedro_soto 6 Sep 11 15:43 Proyectos
```
Cambiar directorio
```shell
cd # change directory
```
Cambiar al directorio de Proyectos
```shell
cd Proyectos
```
Mostrar la ruta actual
```shell
pwd # print working directory
```
- - -

Verificando la instalación de python
```shell
python --version
```

Verificar la ruta de python
```shell
whereis python
```
> Actualmente la máquina virtual de Google Cloud con el S.O de CentOs tiene el python por defecto

Utilizando el sudo para comandos superiores
```shell
sudo # el usuario va a usar un comando de administrador
```
Administrador de software de CentOS Linux
```shell
dnf # administrador de software de Linux
```
Ejecutar el instalador de gcc que sería la colección de herramientas c, c++, Fortran, etc
```shell
sudo dnf install gcc
```

- - - 



 
