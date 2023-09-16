# Práctica Clase 01 de Semana 03
## Base de datos avanzadas

5. Encontrar los modelos de vehículos que cuestan más del millón de pesos mexicanos

```sql
-- Esta consulta busca los nombres de los modelos de vehículos cuyo precio es mayor a un millón de pesos mexicanos
SELECT Modelos.Nombre FROM Modelos JOIN Autos ON Modelos.id = Autos.id_modelo WHERE Autos.Precio > 1000000;
```

6. Mostrar las marcas y la cantidad de modelos que tienen
```sql
-- Esta consulta muestra los nombres de las marcas y la cantidad de modelos asociados a cada marca
SELECT Marcas.Nombre, Count(Modelos.id) AS Cantidad FROM Marcas JOIN Modelos ON Marcas.id = Modelos.id_marca GROUP BY Marcas.Nombre;
```

7. Mostrar los modelos de vehículos de la marca Honda
```sql
-- Esta consulta muestra los nombres de los modelos de vehículos de la marca "Honda"
SELECT Modelos.Nombre FROM Autos JOIN Modelos ON Autos.id_modelo = Modelos.id JOIN Marcas ON Marcas.id = Modelos.id_marca WHERE Marcas.Nombre = 'Honda';
```

8. Mostrar los modelos de vehículos ordenados alfabéticamente
```sql
-- Esta consulta muestra los nombres de los modelos de vehículos ordenados alfabéticamente
SELECT Nombre FROM Modelos ORDER BY Nombre ASC;
```

9. Mostrar el vehículo más antiguo y el más reciente de la tabla Autos
```sql
-- Esta consulta muestra el año del vehículo más antiguo y el año del vehículo más reciente en la tabla "Autos"
SELECT MIN(Anio) As Año_Más_Antiguo, MAX(Anio) As Año_Más_Reciente FROM Autos;
```

10. Mostrar todos los vehículos con su modelo y marca correspondiente
```sql
-- Esta consulta muestra los identificadores de los vehículos, los nombres de los modelos y los nombres de las marcas a las que pertenecen
SELECT Autos.id AS 'ID del Vehículo', Modelos.Nombre AS 'Modelo', Marcas.Nombre AS 'Marca' FROM Modelos JOIN Autos ON Modelos.id = Autos.id_modelo JOIN Marcas ON Marcas.id = Modelos.id_marca;
```
