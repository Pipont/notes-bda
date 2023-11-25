# Clase 01 - Semana 14
## Bases de datos avanzadas


Se realiza el desarrollo del ejercicio 3 referente a la normalización


Una vez que está realizado la normalización de datos, se debe de realizar la creación de las tablas correspondientes 

```sql
CREATE DATABASE Tiendita;

USE Tiendita;

CREATE TABLE customers(
    cid int not null,
    c_name VARCHAR(50),
    c_state CHAR(3),
    PRIMARY KEY (cid)
);

CREATE TABLE products(
    pid int not null auto_increment,
    p_desc VARCHAR(50),
    p_price DECIMAL(10,2),
    PRIMARY KEY (pid)
);

CREATE TABLE orders(
    oid int not null auto_increment,
    o_date date not null,
    cid int not null,
    PRIMARY KEY (oid),
    FOREIGN KEY (cid) REFERENCES customers (cid)
);

CREATE TABLE orders_details(
    oid int not null,
    pid int not null,
    qty int not null,
    PRIMARY KEY (oid),
    FOREIGN KEY (pid) REFERENCES products (pid)
);
```

Para sacar solo el SCHEMA de la base de datos se utiliza el siguiente comando
```sh
mysqldump --user=root --password --no-data Agencia > esquemaAgencia.sql
```

En el caso de buscar solo la inserción de datos se deberá de utilizar el siguiente comando
```sh
mysqldump --user=root --password --no-create-info Agencia > datosAgencia.sql
```

Al colocar el

```sql
SET FOREIGN KEY = 0;
```
Se deshabilita el requerir el principio de las dependencias para poder realizar la inserción necesaria.

```sql  
SET FOREIGN KEY = 1;
```

