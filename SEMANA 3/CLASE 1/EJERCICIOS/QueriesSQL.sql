1.- Mostrar todas las marcas

SELECT * FROM Marcas;

2.- Mostrar los nombres de todos los modelos

SELECT * FROM Modelos;

3.- Contar cuántos vehículos hay

SELECT COUNT(*) AS 'Total de vehiculos' FROM Autos;

4.- Mostrar los modelos y los años de los vehículos fabricados en el 2024

SELECT Modelos.Nombre, Autos.Anio FROM Modelos JOIN Autos ON Modelos.id = Autos.id_modelo WHERE Autos.anio = 2024;
