# Clase 01 - Semana 13
## Bases de datos avanzadas

### Normalización

Se refiere al diseño de la base de datos de forma que se pueda garantizar el crecimiento de manera aproximada y duradera.


El proceso de normalización de bases de datos consiste en aplicar una serie de rega a las relaciones obtenidas tras el paso del modelo entidad-relación al modelo relacional


Las bases de datos relaciones se normalizan para:
1. Evitar la redundancia de los datos
2. Evitar problemas de actualización de los datos en las tablas
3. Proteger la integridad de los datos


El creador de estas 3 primeras formas normales fue Edgar *F. Codd*.

El hecho de que al insertar un solo elemento haya que repetir tuplas en una tabla para variar unos pocos datos.

Las formas normales se corresponde a una teoría de normalización iniciada por el propio Codd y continua por otros autores.
Codd definió en 1970 la primera forma normal, desde ese momento aparecieron la segunda, tercera, la cuarta y quinta forma normal.

### Formas Normales

Una tabla puede encontrarse en primera forma normal y no en segunda forma normal, pero no al contrario. Es decir los números altos de formas normales son más restrictivos (la quinta forma normal cumple todas las anteriores)

### Integridades

* Integridad de dominio: limita el conjunto de datos posibles en una columna
* Integridad de entidad: cada fila debe de ser única, garantizar la unicidad de la fila con respecto a las demás
* Integridad referencial: cuando un atributo hace referencia a otro de otra tabla


## Primera Forma Normal

Una tabla esta en primera forma normal si cumple las siguientes restricciones:

* Las celdas o campos deben tener valores singulares
* Sus atributos deben de ser de la misma clase
* Cada columna debe tener un nombre único
* Dos filas o tuplas no pueden ser iguales
* Los atributos deben ser atómicos
* El orden no debe ser relevante

**Solución**: Se establece una llave primaria

> Un atributo es atómico si los elementos del dominio son simples e indivisibles. No debe existir variación en el número de columnas. Los campos no clave deben identificarse por la clave (dependencia funcional)

### Ejemplo

Una tabla se encuentra en primera forma normal si impide que un atributo de una tupla pueda tomar más de un valor.

La tabla:

| RFC | Nombre | Departamento |
|-----|--------|--------------|
| 1231 | Andrés | Mantenimiento |
| 1232 | Andrea | Dirección Gestión

Visualmente es una tabla, pero no una tabla relaciona. No cumple la primera forma normal.

| RFC | Nombre | Departamento |
| -----|--------|---------------|
| 1231 | Andrés | Mantnimiento |
| 1232 | Andrea | Dirección |
| 1232 | Andre | Gestión |

Toda tabla debe de usar un nombre en plurales

## Segunda Forma Normal

Todo atributo no clave depende de un atributo clave. "Eliminar dependencias parciales a la clave primaria de una tabla."
Todas deben guardar relación directa con sus llaves

Una relación está en **2FN** si está en **1FN** y si los atributos que no forman parte de ninguna clave dependen de forma completa de la clave principal.

Es decir que no existen dependencias parciales. Todos los atributos que no son clave principal deben depender únicamente de la clave principal. Entonces esa parte de la clave y esos atributos formarán otra tabla.

### Ejemplo

Suponiendo que la matrícula y el número de curso formen una clave principal para esta tabla, sólo la nota tiene dependencia funcional completa. El nombre y los apellidos dependen de forma completa de la matrícula. La tabla no es 2FN


| Matricula | CodCurso | Nombre | Apellidos | Nota
|----|---|----|-----|-------|
| 12121219A | 34 | Pedro | Valiente | 9
| 12121219A | 25 | Pedro | Valiente | 8


Para arreglarlo:

**Alumnos**
| Matricula | Nombre | Apellido |
| ---------|----------|-----------|
| 12121219A | Pedro | Valiente
| 3457775G | Ana | Fernández
| 5674378J | Sara | Crespo

**Notas**
| Matricula | CodCurso | Nota |
| ------- |---------- |---------|
| 12121219A | 34 | 9 |
| 12121219A | 25 | 8 |
| 3457775G | 34 | 6 |
| 5674378J | 25 | 6 |


Sin embargo, se puede tener una *Segunda Forma Normal Compuesta*


**Empleado**
| Empleado | Habilidad | Lugar de Trabajo
| -------- |------------| ---------------
| 12121212A | Tallado | Mantenimiento
| 12345435G | Mecánico | Dirección
| 12345345G | Computo | Gestión


Con ello, se tienen

**Empleado**
| Empleado | Lugar de Trabajo |
| ------ |---------------| 
| 12121212A | Mantenimiento |
| 12345345G | Dirección |


**Empleado habilidad**
| Habilidad | Lugar de trabajo |
| ------- | ----------------- |
| Tallado | Mantenimiento


## Tercera Forma Normal


Una relación está en tercera forma normal si está en segunda forma normal y tiene dependencia transitiva *dependencia transitiva*

Ocurre cuando una tabla está en **2FN** y además ningún atributo que no sea clave depende transtiviamente de las claves de la tabla. Es decir no ocurre cuando algún atributo depende funcionalmente de atributos que no son clave

| Matrícula | Nombre | Apellido | Cod Municipio | Municipio
| -------- |-------------| ------------ |----------- |------------ |
| 12121349A | Salvador | 34 | MTY
| 1212129A | Pedro | Valiente | 34 | MTY


Para solucionarlo

| Matricula | Nombre | Apellido | Cod Municipio |
| --- |--- |---- |---|
| 1212349A | Salvador | Velasco | 34
| 12121219A | Pedro | Valiente | 34


**Municipios**

| Cod Municipio | Municipio
| --------- |-------------
34 | MTY



------------

## Normalización - Ejercicio 1

Construya la siguiente tabla y normalice hasta 3FN. Indique su resultado

| ID_ORDEN | FECHA | ID_CLIENTE | NOM_CLIENTE | ESTADO | NUM_ITEM | DESC_ITEM | CANT | PRECIO
|--|--|--|--|--|--|--|--|--|
| 2301 | 2/23/03 | 101 | MARTI | CA | 3786 | RED | 3 | 35
| 2301 | 2/23/03 | 101 | MARTI | CA | 4011 | RAQUETEA | 6 | 65
| 2301 | 2/23/03 | 101 | MARTI | CA | 9132 | PAQ-3 | 8 | 4.75
| 2302 | 2/25/03 | 107 | HERMAN | WI | 5794 | PAQ-6 | 4 | 5
| 2303 | 2/27/03 | 110 | WE-SPORTS | MI | 4011 | RAQUETA | 2 | 65
| 2303 | 2/27/03 | 110 | WE-SPORTS | MI | 3141 | FUNDA | 2 | 10


**Clientes**
| ID_CLIENTE | NOM_CLIENTE | ESTADO |
| --- | --- |----
| 2301 | MARTI | CA
| 2302 | HERMAN | WI
| 2303 | WE-SPORTS | MI

**Ordenes**
| ID_ORDEN | FECHA |
| --- | --- |



**OrdenDetalles**
| ID_ORDEN | NUM_ITEM | CANTIDAD
| --- |--- |--


**Productos**
| NUM_ITEM | DESC_ITEM | PRECIO
| --- | --- |--- 



En el diseño de las bases de datos, se tienden a considerar nombres de campos raros o en sus casos particulares por los diseñadores. Por ende, es importante mantener un principio de un diccionario de datos que permita realizar un escrito con el tipo de dato, los campos y descripción.

Estos diccionarios de datos son ampliamente utilizados en el campo de Data Science y Machine Learning, considerando el ETL *EXTRACT, TRANSFORM, LOAD*. 


---- 

## Normalización - Creación de tablas

```sql
CREATE TABLE clientes(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nom_cliente VARCHAR(50),
    id_estado INT NOT NULL,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY (id_estado) REFERENCES estados (id_estado)
);
```

```sql
CREATE TABLE ordenes (
  id_orden INT NOT NULL AUTO_INCREMENT,
  fecha DATE,
  id_cliente INT NOT NULL
  PRIMARY KEY (id_orden)
  FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);
```

```sql
CREATE TABLE estados(
    id_estado INT NOT NULL AUTO_INCREMENT,
    estado VARCHAR(50)
    PRIMARY KEY (id_estado)
);
```

```sql
CREATE TABLE articulos_ordenes(
    id_orden INT NOT NULL,
    num_item INT NOT NULL,
    cant INT
    PRIMARY KEY (id_orden, num_item)
    FOREIGN KEY (id_orden) REFERENCES ordenes (id_orden)
    FOREIGN KEY (num_item) REFERENCES productos (num_item)
);
```


```sql
CREATE TABLE articulos(
    num_item INT NOT NULL AUTO_INCREMENT,
    desc_item VARCHAR(100),
    precio DOUBLE(10,2)
    PRIMARY KEY (num_item)
);
```
