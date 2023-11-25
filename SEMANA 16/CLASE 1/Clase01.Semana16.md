# Clase 01 - Semana 16
## Bases de datos avanzadas

Continuamos con la creación del esquema de la base de datos

```sql
CREATE TABLE Usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apaterno VARCHAR(50),
    amaterno VARCHAR(50)
);

CREATE TABLE Login(
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    contrasenia VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Direcciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    direccion VARCHAR(200) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
);

CREATE TABLE Disponibilidad (
    producto_id INT,
    cantidad INT, 
    disponibilidad BOOLEAN,
    FOREIGN KEY (producto_id) REFERENCES Productos (id)
);

CREATE TABLE Productos_Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT,
    producto_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias (id),
    FOREIGN KEY (producto_id) REFERENCES Productos (id)
);

CREATE TABLE Carritos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

CREATE TABLE Productos_Carritos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (carrito_id) REFERENCES Carritos (id),
    FOREIGN KEY (producto_id) REFERENCES Productos (id)
);

CREATE TABLE Tarjetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    numero_tarjeta VARCHAR(50) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    nombre_titular 
);

CREATE TABLE Transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    fecha DATE,
    FOREIGN KEY (carrito_id) REFERENCES Carritos (id)
);

CREATE TABLE Metodos_Pagos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaccion_id INT,
    tarjeta_id INT,
    FOREIGN KEY (transaccion_id) REFERENCES Transacciones (id),
    FOREIGN KEY (tarjeta_id) REFERENCES Tarjetas (id)
);

CREATE TABLE Precios_producto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    fecha_inicio DATE,
    fecha_final DATE,
    precio DECIMAL (10,2),
    FOREIGN KEY (producto_id) REFERENCES Productos (id)
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    transaccion_id INT,
    direcciones_id INT,
    FOREIGN KEY (carrito_id) REFERENCES Carritos (id),
    FOREIGN KEY (transaccion_id) REFERENCES Transacciones (id),
    FOREIGN KEY (direcciones_id) REFERENCES Direcciones (id)
);

CREATE TABLE Pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaccion_id INT,
    tarjeta_id INT,
    FOREIGN KEY (transaccion_id) REFERENCES Transacciones (id),
    FOREIGN KEY (tarjeta_id) REFERENCES Tarjetas (id)
);

CREATE TABLE Seguimiento_Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    estado ENUM('Procesando', 'Empacando', 'Enviado', 'Recibido', 'Cancelado'),
    fecha_actualizacion_estado DATE,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos (id)
);
```

En principio, debemos de crear el usuario
```sql
CREATE DATABASE Tienda;
GRANT ALL PRIVILEGES ON Tienda.* TO usr_tienda@localhost IDENTIFIED BY '666';
FLUSH PRIVILEGES
```


Lo que se desarrolla es un CMS o Content Management System, así debe de ser seleccionado el Stored Procedures. 
En la Instancia de GCP, se utiliza la app FLASK.

La importancia es no utilizar el SQL Embebido, así no pueda ver las columnas ni el tipo de datos. Por ello, el procedimiento almacenado se encargaba de ello, solo realizaba la ejecución y retornaba.

Se tendrá de ese modo un

| id | usuario_id | email | contrasenia |
|--|--|--|--|
| 1 | 1 | admin@udem.edu| 666
| 2 | 2 | pedro@udem.edu| 123


De este mdoo, se deberá de hacer un Insert a la base de datos.

```sql
INSERT INTO Usuarios (nombre) VALUES ('Administrador');
```

Con ello, se realiza
```sql
INSERT INTO Usuarios (nombre, apaterno, amaterno) VALUES ('Pedro', 'Soto', 'Barboza');
```

```sql
INSERT INTO Login (usuario_id, email, contrasenia) VALUES (1,'admin@udem.edu','666');
INSERT INTO Login (usuario_id, email, contrasenia) VALUES (2,'pedro.soto@udem.edu','123');
```

Ahora deberemos de crear un Procedimiento Almacenado que permita la verificación del usuario en el sistema

Debemos de verificar
```
SELECT COUNT(*) INTO VAR FROM Login WHERE email='admin@udem.edu' AND contrasenia='666';
```

```sql
DELIMITER $$
CREATE PROCEDURE verificar_login(
    IN email VARCHAR(100),
    IN password VARCHAR(100),
    OUT resultado INT
)
BEGIN
    SELECT COUNT(*) INTO resultado FROM Login WHERE email=email AND contrasenia=password;
END $$
DELIMITER ;
```

Para realizar la prueba, se requiere
```sql
CALL verificar_login('admin@udem.edu','666',@resultado)
```

En caso de tener errores, se debe de modificar la lógica
```sql
DELIMITER $$
CREATE PROCEDURE verificar_login(
    IN correo VARCHAR(100),
    IN password VARCHAR(100),
    OUT resultado INT
)
BEGIN
    SELECT COUNT(*) INTO resultado FROM Login WHERE (email=correo AND contrasenia=password);
END $$
DELIMITER ;
```

Para realizar la prueba
```sql
CALL verificar_login('admin@udem.edu','666',@resultado)
```

Al momento de realizar el select
```sql
SELECT @resultado;
```





> Siempre es recomendable crear un usuario administrador, que no sea visible. Dado que, cuando se hace el sistema en un SaaS, así debemos de ser los únicos de utilizarlo en un momento determinado.



 - - -

### Ejercicio

Se debe de crear los procedure en base a las relaciones

```sql
CREATE PROCEDURE registrar(
    IN nombreu VARCHAR(100),
    IN apellidop VARCHAR(100),
    IN apellidom VARCHAR(100),
    IN correo VARCHAR(100),
    IN password VARCHAR(100),
    OUT resultado INT
)
BEGIN
    DECLARE buscar TINYINT DEFAULT 0;
    SELECT 
END $$
DELIMITER ;
```


