
--- MOSTRAR, MARCA DE AUTO, NOMBRE DE MODELO, PRECIO Y AÑO DE LOS AUTOS
DELIMITER //
CREATE PROCEDURE mostrarDatosVehiculo()
BEGIN
SELECT Marcas.Nombre AS Marca, Modelos.Nombre AS Modelo, Autos.Precio, Autos.Anio FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id JOIN Marcas ON Modelos.id_marca = Marcas.id;
END //
DELIMITER ;


--- MOSTRAR Modelos, Años fabricados en el 2023
DELIMITER //
CREATE PROCEDURE autosFabricados()
BEGIN
    SELECT Modelos.Nombre AS Modelo, Autos.Anio AS Año 
    FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id 
    WHERE Anio = 2023;
END //
DELIMITER ;

    -- Descripción: Este procedimiento selecciona los modelos de vehículos fabricados en el año 2023.
    -- Utiliza un JOIN entre las tablas Autos y Modelos para obtener los detalles correspondientes.
    -- Los resultados se muestran con los nombres de los modelos y los años en una estructura legible.


--- Mostrar las marcas y la cantidad de modelos que tienen 
DELIMITER //
CREATE PROCEDURE cantidadVehiculos()
BEGIN
    SELECT Marcas.Nombre AS Marca, Count(Modelos.id) AS Cantidad 
    FROM Modelos JOIN Marcas ON Modelos.id_marca = Marcas.id 
    GROUP BY Marcas.Nombre;
END //
DELIMITER ;

    -- Descripción: Este procedimiento muestra la cantidad de modelos de vehículos por marca.
    -- Utiliza un JOIN entre las tablas Modelos y Marcas, agrupados por el nombre de la marca.
    -- La cantidad de modelos se cuenta y se muestra en conjunto con el nombre de la marca.

