CREATE TABLE `Marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `Nombre` varchar(50) DEFAULT NULL
);


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


INSERT INTO Marcas (Nombre) VALUES
('Toyota'), ('Honda'), ('Ford'), ('Audi');

INSERT INTO Modelos (Nombre, id_marca) VALUES
('Camry',1), ('Accord',2), ('Bronco',3), ('A8',4);

INSERT INTO Autos (Anio, Precio, id_modelo) VALUES
(2023,750000.00,1),(2023,896000.00,2),(2024,1260000.00,3),(2023,2600000.00,4);