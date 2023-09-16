# Clase 02 de Semana 02
## Base de datos avanzadas

Conectarse a la base de datos creada


```sql
mysql -u root -p 
```

Crear una base de datos ejemplo como *Salon*
```sql
CREATE DATABASE Salon
```

Visualizar todas las bases de datos 
```sql
SHOW DATABASES
```
Seleccionar la base de datos Salon

```sql
USE Salon
```

Crear una tabla de Alumnos
```sql
CREATE TABLE Alumnos(
id int auto_increment primary key,
Nombre varchar(40),
Appaterno varchar(50),
Apmaterno varchar(50),
email varchar(100),
Telefono varchar(100));
```
Verificar los campos de la tabla Alumnos

```sql
DESCRIBE Alumnos;
```
Modificar una columna de la tabla de Alumnos

```sql
ALTER TABLE Alumnos RENAME COLUMN email TO Email;
```
Pruebas de modificación de otros campos 

```sql
ALTER TABLE Alumnos MODIFY email char;

ALTER TABLE Alumnos MODIFY email char(100);

ALTER TABLE Alumnos MODIFY email varchar(100);
```

Insertar datos a la tabla creada
```sql
INSERT INTO Alumnos (Nombre, email) VALUES ('Raúl','raul.moraless@udem.edu');
```

Inserción de múltiples datos

```sql
INSERT INTO Alumnos (Nombre, email) VALUES ('Raúl','raul.moraless@udem.edu'),
	('Salomón','sal@delsalon.com'),('Armando','@lios.com');
```

Seleccionar a los alumnos y todas sus columnas
```sql
SELECT * FROM Alumnos;
```
Modificar un row a través del Where
```sql
UPDATE Alumnos SET email = 'raul2@nose.com' WHERE id=2; 
```

>Sin el Where se aplica el cambio a todas las filas

Actualizar un campo
```sql
UPDATE Alumnos SET Telefono = '999999999';
```

Seleccionar campos especificos con el **where**

```sql
SELECT id, Nombre FROM Alumnos WHERE email = 'raul.moraless@udem.edu';
```

- - -
* Comandos de CMD 

Se creará una nueva carpeta con la bases de datos
```
exit
mkdir basesDB
cd basesDB
```
- - -
Ingresar como usuario ROOT
```sql
mysql -u root -p Salon
```
Crear un usuario con todos los permisos en la base de datos creada
```sql
GRANT ALL PRIVILEGES ON Salon.* TO salon_user@localhost IDENTIFIED BY '666';
FLUSH PRIVILEGES
EXIT
```

> * **COMMIT** → Es ejecutar un cambio de manera definitiva
> * **ROLLBACK** → Regresar al estado actual

Ingresar a la base de datos con el usuario creado

```
mysql -u salon_user -p Salon
```
Verificar que solo aparezca la base de datos atribuida
```sql
SHOW DATABASES; 
```
Solo debe de aparecer la base de datos donde se le brindaron los derechos

> Es importante manejar los privilegios, no deben de dejarse lado

Verificar las tablas de la base de datos
```sql
SHOW TABLES;
```
Seleccionar todos los alumnos registrados

```sql
SELECT * FROM Alumnos;
```

Salir del command line de MariaDB
```
EXIT
```
 - - - 
### Respaldo de base de datos

> mysqldump comando de S.O. que permite realizar el respaldo de la base de datos que se indica, utilizando el usuario y el password.
> Luego, al utilizar el > se apunta al archivo en el que se almacenará

```
mysqldump --user=salon_user --password Salon > backup.sql
```

- - -
### Crear según Diagrama ER 

> Versión corregida en carpeta de Tarea

```md
 Autos -> id, Modelo, año, precio, foto
 Marcas -> id, Nombre, id_autos
```

Ingresar como root al DBMS
```sql
mysql -u root -p
```

Crear la base de datos *Agencia*

```sql
CREATE DATABASE Agencia
```

Brindar los permisos necesarios a un usuario agente en la base de datos
```sql
GRANT ALL PRIVILEGES ON Agencia.* TO agente@localhost IDENTIFIED BY '999';

FLUSH PRIVILEGES
```

Ingresar como el usuario
```
mysql -u agente -p Agencia
```

Crear la tabla **Autos**
```sql
CREATE TABLE Autos(
id int not null auto_incremet primary key,
Modelo varchar(40),
Anio int,
Foto varchar(100));
```

Crear la tabla **Marcas**

```sql
CREATE TABLE Marcas(
id int not null auto_increment primary key,
Nombre varchar(40),
id_autos int references Autos(id));
```
Insertar datos necesarios
```sql
INSERT INTO Autos (Modelo, Año, Foto) VALUES ('Carrito',2001,'https://www.mifoto.com'),
	('Carrito2', 2002, 'https://www.mifoto2.com'),('Carrito3', 2003, 'https://www.mifoto3.com'),('Carrito4', 2004, 	'https://www.mifoto4.com'),('Carrito5', 2005, 'https://www.mifoto5.com');

INSERT INTO Marcas (Nombre, id_autos) VALUES ('Toyota', 1),('Toyota',2),('Toyota',3),('Tesla',4),('Carrote',5);
```
- - -

