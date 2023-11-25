# Clase 02 - Semana 13
## Bases de datos avanzadas

Realizamos el desarrollo del segundo ejercicio de normalización.

En la primera forma normal, realizamos una atomicidad de las tablas

En la segunda forma normal, dividimos y eliminamos las dependencias creando otra tabla



Ahora se debe de realizar la creación de la base de datos
```sql
CREATE DATABASE ENormalizacion01;

GRANT ALL PRIVILEGES ON ENormalizacion01.* TO usr_n@localhost IDENTIFIED BY '666';

FLUSH PRIVILEGES;

CREATE TABLE Faculties(
    fid INT NOT NULL AUTO_INCREMENT,
    f_name CHAR(50),
    f_phone INT NOT NULL,
    PRIMARY KEY (fid)
);

CREATE TABLE Courses(
    cid VARCHAR(20),
    c_name CHAR(50) NOT NULL,
    fid INT NOT NULL,
    PRIMARY KEY (cid),
    FOREIGN KEY (fid) REFERENCES Faculties (fid)
);


CREATE TABLE Students(
    sid INT NOT NULL AUTO_INCREMENT,
    s_name VARCHAR(50),
    PRIMARY KEY (sid)
);

CREATE TABLE Courses_Grades(
    sid INT NOT NULL,
    cid VARCHAR(20),
    grade int,
    PRIMARY KEY (sid,cid),
    FOREIGN KEY (sid) REFERENCES Students (sid),
    FOREIGN KEY (cid) REFERENCES Courses (cid)
);
```

> Insertar datos
