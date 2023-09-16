# Clase 01 de Semana 04
## Base de datos avanzadas


### Stored Procedures

Un procedimiento almacenado es un código SQL preparado que puede guardar, por lo que el código puede reutilizarse una y otra vez.
Entonces, si tiene una consulta SQL que escribe una y otra vez, guardela como un procedimiento almacenado y luego llámela para ejecutarla

> Un procedimiento almacenado es mayoritariamente utilizado en sistemas transaccionales.

Un stored procedure crea un procedimiento almacenado de tipo Transact-SQL o Common Language Runtime (CLR).

#### Características 

1. Acepta parametros de entrada y devuelve multiples valores en forma de parametros de salida
2. Contiene declaraciones de programacion que van a realizar operaciones en la base de datos, incluida la llamada a otros procedimientos.
3. Devolver un valor de estado a un procedimiento para indicar éxito o falla 

- - -

View

Una View crea una tabla virtual cuyo contenido (columnas y filas) se difne mediante una consulta.

- - -
Triggers

Un trigger es un tipo especial de procedimiento almacenado que se ejecuta automáticamente cuando ocurre un evento en DBMS. Los disparadores DML se ejecutan cuando un usuario intenta modificar datos a através de un evento de lenguaje de manipulación de datos (DML).

> Estos disparadores se ejecutan cuandoo ocurra cualquier evento válido, ya sea que las filas de la tabla se vean afectadas o no.

Está asociado a los CREATE, ALTER, DROP de Transact-SQL

---


