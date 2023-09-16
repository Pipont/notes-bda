# Clase 01 de Semana 02
## Base de datos avanzadas

OBJETIVOS:
1. IMPLEMENTACIÓN DE DBMS
2. HERRAMIENTAS GRÁFICAS DE ADMINISTRACIÓN
3. FACTORES A TOMAR EN CONSIDERACIONES EN WIDNOWS, LINUX Y CLOUD
4. REPASO DE SQL

- - -

> El **DBMS** (Sistema de Gestión de Base de Datos) se encarga de administrar los espacios para almacenar los datos, los que se denominan bases de datos. El DBMS es solo el administrador de los datos entrantes, los organiza y proporciona formas para que los usuarios modifiquen o extraigan los datos.

Las bases de datos también conocidos como schemas, las tablas comprendidas con metadatos que son columnas.

A través del SQL se podrá realizar acciones sobre el espacio que administra el DBMS. 

Ejemplos de DBMS son: 

* Redis (Bases de datos en memoria, la más rápida del mercado, diseñado exclusivamente para almacenar datos para ser recuperados al instante -> Sesiones de usuario)

* MySQL

* PostgreSQL

* Oracle

* FirebirsSQL,

* SQLite,

* Microsoft Access

* SQL Server

* DB2 -> IBM

* BigQuery -> Google, puede hacer queries de millones de terabytes, utilizado para BigData

* MongoDB -> Base de datos no relacional

* Atlas -> Versión en la nube de MOngo DB

* Neo4j -> Focalizada para grafos

* Kafka -> Basado en la base de la nube

* ScyllaDB

* Cassandra,

* DynamoDB

* OrientDB


> Debemos de ser capaces de manejar SQL en cualquiera de los ámbitos, dependiendo del DBMS.

En el intermedio para la comunicación con esas aplicaciones es ODBC es el Driver que permite conectarme en el DBMS y realizar queries a las bases de datos. Asimismo, permitirá conectar al lenguaje de programación que permitirá realizar el código para la consulta de datos.

---
## Herramientas de administración

MariaDB es un DBMS que está escrito en C y C++

##

Ingresar como usuario root a MariaDB
```
mysql -u root -p
```
Verificar las bases de datos existentes

```sql
SHOW DATABASES
```
Seleccionar la base de datos de mysql

```sql
USE mysql;
```

Verificar los usuarios y contraseñas
```sql
SELECT User, Password FROM user;
```

> Encriptar no existe, se le llama CIFRAR. De acuerdo a la Real Academia Española, la palabra encriptar no existe.

Verificar la contraseña
```sql
(SELECT PASWORD ('666'))
```

```
SELECT MD5
```
```
SELECT SHA1
```
Actualizar la contraseña de un usuario según su nombre

```sql
UPDATE user SET Password = password('666') WHERE User = 'agente';
```

- - -

## Creación Backup de la base de datos

Tablas existentes 

- Marcas --> Id, Nombre

- Autos --> Id, Nombre, Id_marca

- Modelos --> Id, Nombre, Anio, id_auto;

```sql
mysqldump --user=agente --password Agencia > Agencia.sql
```
Ingresar como el usuario

```
mysql -u agente -p
```
Verificar las tablas existentes
```sql
USE Agencia;

SHOW TABLES;
```

Eliminar tabla Marcas

```sql
DROP TABLE Marcas;
```


Se debe de editar el archivo a través de un editor de texto

Eliminar los comentarios que no son necesarios

Este codigo
```sql
DROP TABLE IF EXISTS `Marcas`;
```

Se refiere a eliminarlo si existia, pero se elimina porque no existe.

En el editor de texto se debe de realizar lo siguiente, acá se edita el SQL generado en el backup:

``` sql
CREATE TABLE Modelos (
  id int auto_increment primary key,
  Nombre varchar(255), 
  id_marca int, 
  foreign key (id_marca) references Marcas(id)
);

CREATE TABLE Autos (
  id int auto_increment primary key,
  Anio int,
  Precio decimal(10,2),
  id_modelo int,
  foreign key (id_modelo) references Modelos(id)
);

 -- Asimismo, la tabla MARCAS se debe de editar de la siguiente manera:

CREATE TABLE `Marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
)
```


> Si decido no colocar el primary key se vuelve una entidad débil. Con ello, se tendría problema de persistencia de datos.

- - -
## Restauración de base de datos
Para realizar la restauración
```sql
mysql --user=agente --passowrd Agencia < Agencia.sql
```
Verificar las tablas
```sql
SHOW TABLES
```

- - -
## Consultas a las tablas

Ejecucion de queries

1.- Mostrar todas las marcas
```sql
SELECT * FROM Marcas;
```

2.- Mostrar los nombres de todos los modelos
```sql
SELECT * FROM Modelos;
```

3.- Contar cuántos vehículos hay
```sql
SELECT COUNT(*) AS 'Total de vehiculos' FROM Autos;
```

4.- Mostrar los modelos y los años de los vehículos fabricados en el 2024
```sql
SELECT Modelos.Nombre, Autos.Anio FROM Modelos JOIN Autos ON Modelos.id = Autos.id_modelo WHERE Autos.anio = 2024;
```


5.- Encontrar los modelos de vehículos que cuestan más del millon de pesos mexicanos
```sql
SELECT Modelos.Nombre FROM Modelos Join Autos ON Modelos.id = Autos.id WHERE Autos.Precio > 1000000;
```

6.- Mostrar las marcas y la cantidad de modelos que tienen
```sql
SELECT Marcas.Nombre, Count(Modelos.id) AS Cantidad FROM Marcas JOIN Modelos ON Marcas.id = Modelos.id_marca GROUP BY Marcas.Nombre;
```

7.- Mostrar los modelos de vehículos de la marca Honda
```sql
SELECT Modelos.Nombre FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id JOIN Marcas ON Marcas.id = Modelos.id_marca WHERE Marcas.Nombre = 'Honda';
```

8.- Mostrar los modelos de vehículos ordenados alfabéticamente
```sql
SELECT Nombre FROM Modelos ORDER BY Nombre ASC;
```

9.- Mostrar el vehículo más antiguo y el más reciente de la tabla Autos 
```sql
-- No es correcto totalmente
SELECT MIN(Anio) As Minimo, MAX(Anio) As Maximo FROM Autos;
```
10.- Mostrar todos los vehículos con su modelo y marca correspondiente
```sql
 SELECT Autos.id, Modelos.Nombre, Marcas.Nombre FROM Modelos JOIN Autos ON Modelos.id = Autos.id_modelo JOIN Marcas ON Marcas.id = Modelos.id_marca;
```

