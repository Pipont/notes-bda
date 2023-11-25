CREATE DATABASE Hotel;


GRANT ALL PRIVILEGES ON Hotel.* TO hotel_user@localhost IDENTIFIED BY '123';

FLUSH PRIVILEGES;

USE Hotel;

CREATE TABLE Habitaciones(
  habitacion_id int not null auto_increment primary key,
  numero_habitacion varchar(100),
  camas_habitacion int,
  categoria_habitacion varchar(100),
  costo_habitacion decimal(10,2)
);

CREATE TABLE Usuarios(
  usuario_id int not null auto_increment primary key,
  usuario_nombre varchar(100),
  usuario_apellido varchar(100),
  usuario_identificacion varchar(10)
);

CREATE TABLE HabitacionReservas(
  habitacion_id int,
  usuario_id int,
  fecha_reserva date,
  fecha_fin date,
  costo_reserva decimal(10,2),
  PRIMARY KEY (habitacion_id, usuario_id),
  FOREIGN KEY (habitacion_id) REFERENCES Habitaciones(habitacion_id),
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);


-- Insertar datos en la tabla Habitaciones
INSERT INTO Habitaciones (numero_habitacion, camas_habitacion, categoria_habitacion, costo_habitacion)
VALUES
  ('101', 2, 'Standard', 100.00),
  ('201', 3, 'Deluxe', 150.00),
  ('301', 1, 'Económica', 75.00);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (usuario_nombre, usuario_apellido, usuario_identificacion)
VALUES
  ('Juan', 'Pérez', '1234567890'),
  ('María', 'Gómez', '0987654321'),
  ('Carlos', 'López', '5678901234');

-- Insertar datos en la tabla HabitacionReservas
INSERT INTO HabitacionReservas (habitacion_id, usuario_id, fecha_reserva, fecha_fin, costo_reserva)
VALUES
  (1, 1, '2023-10-10', '2023-10-15', 500.00),
  (2, 2, '2023-11-05', '2023-11-10', 750.00),
  (3, 3, '2023-12-20', '2023-12-25', 375.00);
