# Clase 01 de Semana 05
## Base de datos avanzadas

### STORED PROCEDURE

El carácter delimitador puede constar de un solo cáracter o de verios caracteres
```sql
DELIMITER delimiter_character
```

Por ejemplo, la siguiente declaración cambia el delimitador actual a //
```sql
DELIMITER //
```

Se pueden abordar varios queries utilizando el delimitador

Para cambiar el delimitador, se utiliza lo mismo
```sql
DELIMITER ;
```

Para borrar un procedimiento almacenado, se utiliza DROP PROCEDURE
```sql
DROP PROCEDURE [IF EXISTS] stored_procedure_name;
```


Un procedimiento almacenado puede tener cualquier STATEMENT ligado a los CRUD, esto se guardará en el DBMS, dentro del caché se importará ya datos preliminares agilizando las invocaciones y resultados.

> No utilizar los queries directamente, se deben de utilizar procedimientos almacenados

