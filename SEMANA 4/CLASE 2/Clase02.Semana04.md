# Clase 02 de Semana 04
## Base de datos avanzadas

### Continuando la práctica

Ingresar a la base de datos
```shell
mysql -u autos_user -p LoteAutos
```


Crear un Stored Procedure que encuentre todas las oficinas que se ubican en un país especificado, utilizando el pase de parámetros countryName.
```sql
DELIMITER $$
CREATE PROCEDURE obtenerOficinaPorPais(
	IN countryName VARCHAR(255)
)
BEGIN
SELECT * FROM offices WHERE country = countryName;
END $$
DELIMITER ;
```

Obtener la Direccion de las oficinas por país especificado

```sql
DELIMITER $$
CREATE PROCEDURE obtenerDireccionOficinasPorPais(
	IN countryName VARCHAR(255)
)
BEGIN
SELECT city, addressLine1, addressLine2 FROM offices WHERE country= countryName;
END $$
DELIMITER ;
```

Obtener Información de las oficinas por país especificado
```sql
DELIMITER $$
CREATE PROCEDURE obtenerInformacionOficinasPorPais(
	IN countryName VARCHAR(255)
)
BEGIN
SELECT city, state, country, territory FROM offices WHERE country= countryName;
END $$
DELIMITER ;
```

Ejemplo del atributo **IN** y **OUT**. Devolvamos el número de pedidos por estado del pedido

```sql
DELIMITER //
CREATE PROCEDURE obtenerNumeroDePedidosPorEstatus(
	IN estatus varchar(15),
	OUT total int	
)
BEGIN
	SELECT COUNT(orderNumber) 
	INTO total
	FROM orders 
	WHERE status = estatus;
END //
DELIMITER ;
```

> OUT --> El select count inserta el valor en el output **total**

Ver procedimientos almacenados
```sql
SHOW PROCEDURE STATUS WHERE db=LoteAutos
```

Stored Procedure para obtener pedidos según estatus

```sql
DELIMITER //
CREATE PROCEDURE obtenerNumeroDePedidosPorEstatus(
	IN estatus varchar(15),
)
BEGIN
	SELECT COUNT(orderNumber) 
	AS total
	FROM orders 
	WHERE status = estatus;
END //
DELIMITER ;
```


**Usar variable de sesion** 

> El resultado del query y procedure se almacena en la variable de sesion.
 Estas variables de sesion solo son utilizadas por el momento, no se almacenan.

Llamar al Store Procedure con una variable de sesión
```sql
CALL obtenerNumeroDePedidosPorEstatus('On Hold', @total);
```
Seleccionar la variable de sesión
```sql
SELECT @total;
```
- - -

Simulación de contador para comprender el uso de INOUT e IN

Stored Procedure que realiza un incremento al primer parámetro de ingreso.

```sql
DELIMITER //
CREATE PROCEDURE contador(
  INOUT cont INT,
  IN inc INT
)
BEGIN
  SET cont = cont + inc;
END //
DELIMITER ;
```

Inicializar la variable de sesión
```sql
SET @contador = 1;
```
Realizar el llamado al Stored Procedure
```sql
CALL contador(@contador, 10);
```
Verificar
```sql
SELECT @contador;
```
Nuevamente realizar el incremento
```sql
SET @contador = 3;

CALL contador(@contador, 6);

SELECT @contador;
```
Resultado
```sql
+-----------+
| @contador |
+-----------+
|        11 |
+-----------+
```
> El OUT reescribe la variable de sesión.

---
