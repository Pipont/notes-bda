# Práctica de Semana 02
## Base de datos avanzadas

### Diagrama ER Simple

```
Autos -> id, Modelo, año, precio, foto
Marcas -> id, Nombre, id_autos
```

Crear la base de datos AgenciaTarea

```sql
CREATE DATABASE AgenciaTarea;
```

Conceder todos los privilegios en la base de datos AgenciaTarea al usuario *agente*

```sql
GRANT ALL PRIVILEGES ON AgenciaTarea.* TO agente@localhost IDENTIFIED BY '999';
```

Actualizar los privilegios para que surtan efecto
```sql
FLUSH PRIVILEGES;
```

Ingresar a la base de datos AgenciaTarea
```
mysql -u agente -p AgenciaTarea
```

Crear las tablas requeridas según Diagrama ER

Crear la tabla Autos
```sql
CREATE TABLE Autos (
    id int not null auto_increment primary key,
    Modelo varchar(40),
    Anio int,
    Foto varchar(100)
);
```

Crear la tabla Marcas con una referencia a la tabla Autos
```sql
CREATE TABLE Marcas (
    id int not null auto_increment primary key,
    Nombre varchar(40),
    id_autos int references Autos(id)
);
```

Insertar datos en la tabla Autos
```sql
INSERT INTO Autos (Modelo, Anio, Foto) VALUES
    ('Carrito', 2001, 'https://www.mifoto.com'),
    ('Carrito2', 2002, 'https://www.mifoto2.com'),
    ('Carrito3', 2003, 'https://www.mifoto3.com'),
    ('Carrito4', 2004, 'https://www.mifoto4.com'),
    ('Carrito5', 2005, 'https://www.mifoto5.com');
```

Insertar datos en la tabla Marcas
```sql
INSERT INTO Marcas (Nombre, id_autos) VALUES
    ('Toyota', 1),
    ('Toyota', 2),
    ('Toyota', 3),
    ('Tesla', 4),
    ('Carrote', 5);
```
