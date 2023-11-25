# Clase 02 - Semana 15
## Bases de datos avanzadas


Ahora separamos las tablas con sus respectivos campos

```
Usuarios: id, nombre, apaterno, amaterno
Login: id, usuario_id, email
Categorias: id, nombre
Direcciones: id, usuario_id, direccion
Productos: id, nombre, descripcion
Productos_Categorias: id, categoria_id, producto_id
Disponibilidad: producto_id, cantidad, disponibilidad
Carritos: id, usuario_id
Productos_Carritos: id, categoria_id, producto_id, cantidad
Metodos_Pago: id, transaccion_id, tarjeta_id
Precios_producto: id, producto_id, fecha_inicio, fecha_final, precio
Transacciones: id, carrito_id, fecha
Pedidos: id, carrito_id, transaccion_id, direcciones_id
Pagos: id, transaccion_id, direcciones_id
Seguimiento_Pedidos: id, pedido_id, estado, fecha_actualizacion_estado
Tarjetas: id, usuario_id, numero_tarjeta, fecha_vencimiento, nombre_titular
```


Ahora empezamos a crear las tablas con las sentencias SQL
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
    contrasenia VARCHAR(100) NOT NULL
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
    FOREIGN KEY (usuario_id) REFERENCES Usuarios (id)
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
