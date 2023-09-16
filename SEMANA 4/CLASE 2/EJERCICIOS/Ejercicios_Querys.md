## Ejercicios 


1.- Obtener el nombre de de todos los vehículos cuyo año de fabricación sea dado por el usuario, incluyendo el cliente y el monto pagado.
```sql
DELIMITER //
CREATE PROCEDURE obtenerVehiculosPorAñoYCliente(
  IN anio INT(4),
  IN customer varchar(255)
)
BEGIN
  SELECT products.productName AS Vehiculo, customers.customerName AS Cliente, products.buyprice As Monto
  FROM products 
    JOIN orderdetails ON products.productCode = orderdetails.productCode
    JOIN orders ON orderdetails.orderNumber = orders.orderNumber
    JOIN customers ON orders.customerNumber = customers.customerNumber
  WHERE 
    products.productName LIKE CONCAT(anio, '%') AND
    customers.customerName = customer;
END //
DELIMITER ; 
```

2. Obtener el nombre de de todos los vehículos cuyo año de fabricación sea dado por el usuario

```sql
DELIMITER //
CREATE PROCEDURE obtenerVehiculosPorAño(
  IN anio INT(4)
)
BEGIN
  SELECT products.productName AS Vehiculo, customers.customerName AS Cliente, products.buyprice As Monto
  FROM products 
    JOIN orderdetails ON products.productCode = orderdetails.productCode
    JOIN orders ON orderdetails.orderNumber = orders.orderNumber
    JOIN customers ON orders.customerNumber = customers.customerNumber
  WHERE 
    products.productName LIKE CONCAT(anio, '%');
END //
DELIMITER ; 
```

2.- Obtener todos los detalles sobre los empleados cuyo nombre comienza con la letra 'B' pedir al usuario la letra a letra o letras a buscar en el nombre.
```sql
DELIMITER //
CREATE PROCEDURE obtenerEmpleadosPorLetras(
  IN letras VARCHAR(10)
)
BEGIN
  SELECT *
  FROM employees
  WHERE firstName LIKE CONCAT(letras, '%');
END //
DELIMITER ;
```