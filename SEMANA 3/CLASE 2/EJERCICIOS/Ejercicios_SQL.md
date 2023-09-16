

1.- Mostrar Marca de auto, Nombre de ModeLO, Precio y año de los vehiculos
```sql
DELIMITER //
CREATE PROCEDURE mostrarDatosVehiculo()
BEGIN
SELECT Marcas.Nombre AS Marca, Modelos.Nombre AS Modelo, Autos.Precio, Autos.Anio FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id JOIN Marcas ON Modelos.id_marca = Marcas.id;
END //
DELIMITER ;
```
