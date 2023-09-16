## Ejercicios 

### Uso de estructura de control IF

Se realizará un SP para categorizar a los clientes, vamos a crear un query pensando como usar un IF si un cliente tiene un crédito superior a 50,000, y definimos su categoría

Verificar el query para utilizarlo en el Store Procedure 

```sql
SELECT customerNumber, customerName, creditLimit FROM customers WHERE creditLimit > 50000 ORDER BY creditLimit ASC;
```
Resultado 
```
+----------------+------------------------------------+-------------+
| customerNumber | customerName                       | creditLimit |
+----------------+------------------------------------+-------------+
|            333 | Australian Gift Network, Co        |    51600.00 |
|            144 | Volvo Model Replicas, Co           |    53100.00 |
|            209 | Mini Caravy                        |    53800.00 |
|            475 | West Coast Collectables Co.        |    55400.00 |
|            347 | Men 'R' US Retailers, Ltd.         |    57700.00 |
|            211 | King Kong Collectables, Co.        |    58600.00 |
|            344 | CAF Imports                        |    59600.00 |
|            128 | Blauer See Auto, Co.               |    59700.00 |
|            471 | Australian Collectables, Ltd       |    60300.00 |
|            216 | Enaco Distributors                 |    60300.00 |
|            487 | Signal Collectibles Ltd.           |    60300.00 |
|            242 | Alpha Cognac                       |    61100.00 |
|            129 | Mini Wheels Co.                    |    64600.00 |
|            350 | Marseille Mini Autos               |    65000.00 |
|            484 | Iberia Gift Imports, Corp.         |    65700.00 |
|            424 | Classic Legends Inc.               |    67500.00 |
|            250 | Lyon Souveniers                    |    68100.00 |
|            204 | Online Mini Collectables           |    68700.00 |
|            189 | Clover Collections, Co.            |    69400.00 |
|            379 | Collectables For Less Inc.         |    70700.00 |
|            382 | Salzburg Collectables              |    71700.00 |
|            112 | Signal Gift Stores                 |    71800.00 |
|            486 | Motor Mint Distributors Inc.       |    72600.00 |
|            181 | Vitachrome Inc.                    |    76400.00 |
|            415 | Bavarian Collectables Imports, Co. |    77000.00 |
|            324 | Stylish Desk Decors, Co.           |    77000.00 |
|            450 | The Sharp Gifts Warehouse          |    77600.00 |
|            357 | GiftsForHim.com                    |    77700.00 |
|            256 | Auto Associés & Cie.               |    77900.00 |
|            314 | Petit Auto                         |    79900.00 |
|            353 | Reims Collectables                 |    81100.00 |
|            339 | Classic Gift Ideas, Inc            |    81100.00 |
|            177 | Osaka Souveniers Co.               |    81200.00 |
|            385 | Cruz & Sons Co.                    |    81500.00 |
|            121 | Baane Mini Imports                 |    81700.00 |
|            171 | Daedalus Designs Imports           |    82900.00 |
|            145 | Danish Wholesale Imports           |    83400.00 |
|            175 | Gift Depot Inc.                    |    84300.00 |
|            172 | La Corne D'abondance, Co.          |    84300.00 |
|            161 | Technics Stores Inc.               |    84600.00 |
|            495 | Diecast Collectables               |    85100.00 |
|            462 | FunGiftIdeas.com                   |    85800.00 |
|            412 | Extreme Desk Decorations, Ltd      |    86800.00 |
|            323 | Down Under Souveniers, Inc         |    88000.00 |
|            260 | Royal Canadian Collectables, Ltd.  |    89600.00 |
|            202 | Canadian Gift Exchange Network     |    90300.00 |
|            311 | Oulu Toy Supplies, Inc.            |    90500.00 |
|            205 | Toys4GrownUps.com                  |    90700.00 |
|            201 | UK Collectables, Ltd.              |    92700.00 |
|            282 | Souveniers And Things Co.          |    93300.00 |
|            240 | giftsbymail.co.uk                  |    93900.00 |
|            398 | Tokyo Collectables, Ltd            |    94400.00 |
|            320 | Mini Creations Ltd.                |    94500.00 |
|            406 | Auto Canal+ Petit                  |    95000.00 |
|            299 | Norway Gifts By Mail, Co.          |    95100.00 |
|            455 | Super Scale Inc.                   |    95400.00 |
|            186 | Toys of Finland, Co.               |    96500.00 |
|            167 | Herkku Gifts                       |    96800.00 |
|            166 | Handji Gifts& Co                   |    97900.00 |
|            334 | Suominen Souveniers                |    98800.00 |
|            157 | Diecast Classics Inc.              |   100600.00 |
|            319 | Mini Classics                      |   102700.00 |
|            148 | Dragon Souveniers, Ltd.            |   103800.00 |
|            458 | Corrida Auto Replicas, Ltd         |   104600.00 |
|            239 | Collectable Mini Designs Co.       |   105000.00 |
|            321 | Corporate Gift Ideas Co.           |   105000.00 |
|            276 | Anna's Decorations, Ltd            |   107800.00 |
|            496 | Kelly's Gift Shop                  |   110000.00 |
|            249 | Amica Models & Co.                 |   113000.00 |
|            363 | Online Diecast Creations Co.       |   114200.00 |
|            131 | Land of Toys Inc.                  |   114900.00 |
|            448 | Scandinavian Gift Ideas            |   116400.00 |
|            114 | Australian Collectors, Co.         |   117300.00 |
|            119 | La Rochelle Gifts                  |   118200.00 |
|            278 | Rovelli Gifts                      |   119600.00 |
|            259 | Toms Spezialitäten, Ltd            |   120400.00 |
|            227 | Heintze Collectables               |   120800.00 |
|            386 | L'ordine Souveniers                |   121400.00 |
|            286 | Marta's Replicas Co.               |   123700.00 |
|            146 | Saveley & Henriot, Co.             |   123900.00 |
|            187 | AV Stores, Co.                     |   136800.00 |
|            151 | Muscle Machine Inc                 |   138500.00 |
|            298 | Vida Sport, Ltd                    |   141300.00 |
|            124 | Mini Gifts Distributors Ltd.       |   210500.00 |
|            141 | Euro+ Shopping Channel             |   227600.00 |
+----------------+------------------------------------+-------------+
```

Realizar el Store Procedure que categoriza al cliente según su limite de crédito
```sql
DELIMITER //
CREATE PROCEDURE creaNivelCliente(
  IN numeroCliente INT,
  OUT nivelCliente VARCHAR(100)
)
BEGIN
-- Se debe de seleccionar e inicializar en 0 para evitar problemas
  DECLARE credito DECIMAL(10,2) DEFAULT 0;
-- Se selecciona el creditLimit del cliente
  SELECT creditLimit

  INTO credito
  FROM customers
  WHERE customerNumber = numeroCliente;
  
-- Si el credito es mayor, crea el nivelCliente con un nombre de 'Plata'
  IF credito > 50000 THEN 
     SET nivelCliente = 'Plata';
  END IF;
END //
DELIMITER ;
```
Llamar al Stored Procedure para categorizar 
al cliente con una variable de sesión

```sql
CALL creaNivelCliente(141, @categoria);
```
Verificar la variable de sesión

```sql
SELECT @categoria AS 'Categoria';
```
Resultado

```
+-----------+
| Categoria |
+-----------+
| Plata     |
+-----------+
```

Ahora realizar un Stored Procedure crear un nivel para quienes no cumplen el limite de crédito

```sql
DELIMITER //
CREATE PROCEDURE creaNivelCliente(
  IN numeroCliente INT,
  OUT nivelCliente VARCHAR(100)
)
BEGIN
-- Se debe de seleccionar e inicializar en 0 para evitar problemas
  DECLARE credito DECIMAL(10,2) DEFAULT 0;
-- Se selecciona el creditLimit del cliente
  SELECT creditLimit

  INTO credito
  FROM customers
  WHERE customerNumber = numeroCliente;
  
-- Si el credito es mayor, crea el nivelCliente con un nombre de 'Plata'
  IF credito > 50000 THEN 
     SET nivelCliente = 'Plata';
  ELSE
     SET nivelCliente = 'No es Plata';
  END IF;
END //
DELIMITER ;
```
Resultado
```
+-------------+
| Categoria   |
+-------------+
| No es Plata |
+-------------+
```

Ahora generar diferentes niveles para cada categoría según el limite de crédito
```sql
DELIMITER //
CREATE PROCEDURE creaNivelCliente(
  IN numeroCliente INT,
  OUT nivelCliente VARCHAR(100)
)
BEGIN
-- Se debe de seleccionar e inicializar en 0 para evitar problemas
  DECLARE credito DECIMAL(10,2) DEFAULT 0;
-- Se selecciona el creditLimit del cliente
  SELECT creditLimit

  INTO credito
  FROM customers
  WHERE customerNumber = numeroCliente;
  
-- Si el credito es mayor, crea el nivelCliente con un nombre de 'Plata'
  IF credito < 50000 THEN 
     SET nivelCliente = 'Plata';
  END IF;
-- Se puede usar el ELSEIF
  IF credito >= 50000 AND credito <= 100000 THEN
     SET nivelCliente = 'Oro';
  END IF;
  IF credito > 100000 THEN
     SET nivelCliente = 'Black';
  END IF;
END //
DELIMITER ;
```

Resultados:
```
ID 151:
+-----------+
| Categoria |
+-----------+
| Black     |
+-----------+

ID 333:
+-----------+
| Categoria |
+-----------+
| Oro       |
+-----------+

ID 103:
+-----------+
| Categoria |
+-----------+
| Plata     |
+-----------+
```

### Uso de CASE
Realizar un SP para obtener el tiempo de envio al cliente
```sql
DELIMITER //
CREATE PROCEDURE obtenerTiempoEnvioCliente(
  IN numeroCliente INT,
  OUT envios VARCHAR(100)
)
BEGIN
  DECLARE paisDelCliente VARCHAR(100);
  
  SELECT country
  INTO paisDelCliente
  FROM customers
  WHERE customerNumber = numeroCliente;

  CASE paisDelCliente
  WHEN 'USA' THEN 
      SET envios = '2 días de envío';
  WHEN 'Australia' THEN
      SET envios = '2 meses de envío por barco';
  ELSE
      SET envios = 'Se va a demorar mucho';
  END CASE;
END//
DELIMITER ;
```
Resultado
```shell
+-----------------------+
| Tiempo de Envio       |
+-----------------------+
| Se va a demorar mucho |
+-----------------------+
```





