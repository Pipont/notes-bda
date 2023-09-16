# Práctica Clase 02 de Semana 03
## Base de datos avanzadas


1. MOSTRAR, MARCA DE AUTO, NOMBRE DE MODELO, PRECIO Y AÑO DE LOS AUTOS

```sql
DELIMITER //
CREATE PROCEDURE mostrarDatosVehiculo()
BEGIN
SELECT Marcas.Nombre AS Marca, Modelos.Nombre AS Modelo, Autos.Precio, Autos.Anio FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id JOIN Marcas ON Modelos.id_marca = Marcas.id;
END //
DELIMITER ;
```


2. MOSTRAR Modelos, Años fabricados en el 2023
```sql
DELIMITER //
CREATE PROCEDURE autosFabricados()
BEGIN
    SELECT Modelos.Nombre AS Modelo, Autos.Anio AS Año 
    FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id 
    WHERE Anio = 2023;
END //
DELIMITER ;
```

3. Mostrar las marcas y la cantidad de modelos que tienen
```sql
DELIMITER //
CREATE PROCEDURE cantidadVehiculos()
BEGIN
    SELECT Marcas.Nombre AS Marca, Count(Modelos.id) AS Cantidad 
    FROM Modelos JOIN Marcas ON Modelos.id_marca = Marcas.id 
    GROUP BY Marcas.Nombre;
END //
DELIMITER ;
``` 