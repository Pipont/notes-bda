# Clase 01 - Semana 15
## Bases de datos avanzadas

Ahora realizaremos la creación de las tablas correspondientes. De este modo, utilizaremos la instancia en Google Cloud Platform.

```sql
---- ROOT ----
CREATE DATABASE Tienda_Linea;
GRANT ALL PRIVILEGES ON Tienda_Linea.* TO usr_linea@localhost IDENTIFIED BY '666';
FLUSH PRIVILEGES;
--------------

CREATE TABLE Categorias(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Productos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Descripcion TEXT NOT NULL,
    Cantidad INT(20),
    Disponibilidad BOOLEAN NOT NULL DEFAULT 1,
    Categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias (id)
);

CREATE TABLE Usuarios(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Appaterno VARCHAR(50),
    Apmaterno VARCHAR(50),
    Email VARCHAR(100),
    Direccion TEXT,
    Password VARCHAR(100)
);

CREATE TABLE Carritos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
);

CREATE TABLE Productos_Carritos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT NOT NULL,
    producto_id INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    FOREIGN KEY (carrito_id) REFERENCES Carritos (id),
    FOREIGN KEY (producto_id) REFERENCES Productos (id)
);

CREATE TABLE Transacciones(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Direccion_envio TEXT,
    FOREIGN KEY (carrito_id) REFERENCES Carritos(id)
);

CREATE TABLE Pagos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Numero_Tarjeta VARCHAR(50) NOT NULL,
    Fecha_Vencimiento VARCHAR(100) NOT NULL,
    Nombre_Titular VARCHAR(100) NOT NULL,
    transacciones_id INT NOT NULL,
    FOREIGN KEY (transacciones_id) REFERENCES Transacciones (id)
);

CREATE TABLE Seguimiento_Pedidos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transacciones_id INT NOT NULL,
    Estado VARCHAR(50),
    Fecha_actualizacion_estado DATETIME NOT NULL,
    FOREIGN KEY (transacciones_id) REFERENCES Transacciones (id)
);
```
