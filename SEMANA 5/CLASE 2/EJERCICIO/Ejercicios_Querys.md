## Ejercicios 

Vamos a realizar un procedimiento almacenado que liste el número total de pedidos que se enviaron, cancelaron, resolvieron y disputaron.

Necesitamos un parametro de entrada IN, acepte el numero cliente
Necesitamos un parametro de salida OUT que liste el número total de pedidos y su estatus

```sql
DELIMITER //

CREATE PROCEDURE obtieneOrdenPorCliente(
  IN numeroCliente INT,
  OUT enviado INT,
  OUT cancelado INT,
  OUT resuelto INT,
  OUT disputado INT
)
BEGIN
-- PEDIDO ENVIADO
 SELECT COUNT(*)
 INTO enviado 
 FROM orders 
 WHERE customerNumber = numeroCliente
 AND status = 'Shipped';

-- PEDIDO CANCELADO
 SELECT COUNT(*)
 INTO cancelado
 FROM orders
 WHERE customerNumber = numeroCliente
 AND status = 'Cancelled';

-- PEDIDO RESUELTO
 SELECT COUNT(*)
 INTO resuelto
 FROM orders
 WHERE customerNumber = numeroCliente
 AND status = 'Resolved';

-- PEDIDO DISPUTA
 SELECT COUNT(*)
 INTO disputado
 FROM orders
 WHERE customerNumber = numeroCliente
 AND status = 'Disputed';

END //

DELIMITER ;
```
Para realizar el llamado se utiliza

```sql
CALL obtieneOrdenPorCliente(201,@enviado,@cancelado,@resuelto,@disputa);
```
Seleccionando las variables de sesion utilizadas

```sql
SELECT @enviado AS 'PEDIDOS ENVIADOS', @cancelado AS 'CANCELADOS', @disputa AS 'CON PROBLEMAS', ,@resuelto AS 'RESUELTOS';
```
- - -
###  USO DE CICLOS 

#### CICLO - LOOP


Ingreso al usuario
```shell
mysql -u autos_user -p LoteAutos
```

Ejemplificación de un ciclo utilizando el LOOP
```sql
DELIMITER //
CREATE PROCEDURE usoDeCiclo()
BEGIN
   --Se declara el x como variable
   DECLARE x INT; 
   -- Se declara la variable cadena
   DECLARE cadena VARCHAR(200); 
   --Se inicializa la variable 
   SET x = 1;
   --Se inicializa la cadena
   SET cadena = ''; 
  --Esta palabra reservada LOOP
  etiqueta_loop: LOOP 
     IF x > 10 THEN
      LEAVE etiqueta_loop;
     END IF;
   
     SET x = x + 1;
     IF (x mod 2) THEN
       ITERATE etiqueta_loop;
     ELSE
       SET cadena = CONCAT(cadena,x,',');
     END IF;
  END LOOP;
  SELECT cadena;
END //
DELIMITER ;
```
Se realiza el llamado al procedimiento

```sql
CALL usoDeCiclo();
```
Obteniendo de resultado
```
+-------------+
| cadena      |
+-------------+
| 2,4,6,8,10, |
+-------------+
```

