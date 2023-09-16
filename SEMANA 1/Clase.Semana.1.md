# Clases de Semana 1
## Base de datos avanzadas

Inicializar el servicio WAMP

- - -

Ingresar a la cuenta de usuario

```
mysql -u root -p;
```

Crear la base de datos DBPrueba
```sql
CREATE DATABASE DBprueba;
```
Crear un usuario con privilegios en la base de datos

```sql
GRANT ALL PRIVILEGES ON DBprueba.* TO db_user@localhost IDENTIFIED BY '666';
```

```sql
FLUSH PRIVILEGES;  
```
 
> SE INGRESA CON EL NUEVO USUARIO DISEÑADO

```sql
mysql -u db_user -p;
```
Se debe de visualizar las bases de datos a las que tiene acceso el usuario
```sql
SHOW DATABASES;
```


 
