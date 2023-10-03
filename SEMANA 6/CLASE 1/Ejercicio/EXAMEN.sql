-- EXAMEN

-- Desarrolla un Stored Procedure que muestre los pagos totales por fecha dada

DELIMITER //
CREATE PROCEDURE pagosTotalesPorFechaDada(
 IN fechaPago DATE 
)
BEGIN
 SELECT paymentDate AS 'Fecha', SUM(amount) AS 'Pago Total'
 FROM payments
 WHERE paymentDate = fechaPago;
END //
DELIMITER ;


-- Desarrolla un Stored Procedure que muestre el nombre y la ciudad de los clientes que no tienen representantes de ventas.
DELIMITER //
CREATE PROCEDURE mostrarClientesSinRepresentanteVentas(
  OUT clientes TEXT
)
BEGIN
 SELECT GROUP_CONCAT(customerName, ',', city, '')
 INTO clientes
 FROM customers
 WHERE salesRepEmployeeNumber IS NULL; 
END //
DELIMITER ;

-- Crea un Stored Procedure que obtenga los nombres de empleados con su título.
DELIMITER //
CREATE PROCEDURE obtenerEmpleadosConTitulo(
 IN titulo VARCHAR(50)
)
BEGIN
  SELECT lastName AS 'Apellido', firstName AS 'Nombre', jobTitle AS 'Titulo'
  FROM employees
  WHERE jobTitle = titulo;
END //
DELIMITER ;


-- Crea un Stored Procedure que obtenga los nombres de los clientes en una lista de IDs.
DELIMITER //
CREATE PROCEDURE obtenerNombreClientesEnListaID(
 IN lista_ids TEXT,
 OUT nombres VARCHAR(12)
)
BEGIN
  SELECT customerName
  INTO nombres
  FROM customers
  WHERE FIND_IN_SET(customerNumber,lista_ids);
END //
DELIMITER ;

-- Desarrolla un Stored Procedure que verifique si un cliente tiene pagos pendientes.
DELIMITER //
CREATE PROCEDURE verificarClientePagosPendientes(
   IN numeroCliente INT,
   OUT pagosPendientes VARCHAR(50)
)
BEGIN
   DECLARE estado VARCHAR(50);
   SELECT customers.customerName
   INTO estado
   FROM customers
   JOIN orders
   ON customers.customerNumber = orders.customerNumber
   WHERE orders.shippedDate IS NULL
   AND orders.status = 'In Process'
   AND customers.customerNumber = numeroCliente;
   
   IF estado IS NULL THEN
     SET pagosPendientes = 'Cliente No Tiene Pagos Pendientes';
   ELSE
     SET pagosPendientes = 'Cliente Tiene Pagos Pendientes';
   END IF;
END //
DELIMITER ;