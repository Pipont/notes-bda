USE Tienda;



DELIMITER $$

CREATE PROCEDURE registrar(
    IN nombreu VARCHAR(100),
    IN apellidop VARCHAR(100),
    IN apellidom VARCHAR(100),
    IN correo VARCHAR(100),
    IN password VARCHAR(100),
    OUT resultado INT
)
BEGIN
    DECLARE buscar TINYINT DEFAULT 0;
    SELECT COUNT(*) INTO buscar FROM Usuarios WHERE email = correo;
    
    IF buscar > 0 THEN
        SET resultado = 0; -- User already exists
    ELSE
        INSERT INTO Usuarios (nombre, apaterno, amaterno) VALUES (nombreu, apellidop, apellidom);
        SET @usuario_id = LAST_INSERT_ID();
        INSERT INTO Login (usuario_id, email, contrasenia) VALUES (@usuario_id, correo, password);
        SET resultado = 1; -- User registered successfully
    END IF;
END $$
DELIMITER ;