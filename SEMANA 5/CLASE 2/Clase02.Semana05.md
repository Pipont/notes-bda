# Clase 01 de Semana 05
## Base de datos avanzadas
### STORED PROCEDURES

VENTAJAS

1. Reduce el tráfico de red:
Los Stored Procedure ayudan a reducir el tráfico de red entre las aplicaciones y el DBMS, porque en lugar de enviar múltiples instrucciones SQL largas, las aplicaciones deben enviar solo el nombre y los parámetros de los procedimientos.

2. Centraliza la lógica empresarial en la base de datos: Puede utilizar los Stored Procedure para implementar la lógica empresarial que varias aplicaciones pueden reutilizar, los Stored Procedure ayudan a reducir los esfuerzos de duplicar la misma lógica en muchas aplicaciones y hacen que su base de datos sea más consistente.

3. Hace la base de datos más segura: Ela dministrador de la base de datos puede otorgar los privilegios apropiados a las aplicaciones que solo acceden a procedimientos almacenados específicos sin otorgar privilegios sobre las tablas subyacentes.


DESVENTAJAS

1. Uso de recursos:
Si usamos muchos Stored Procedures, el uso de memoria de cada conexion aumentará sustancialmente. Además, el uso excesivo de una gran cantidad de operaciones lógicas en los procedimientos almacenados aumentará el uso de la CPU porque el DBMS no está bien diseñado para operaciones lógicas.

2. Solución de problemas:
Es dificil depurar los Stored Procedures. Desafortunadamente, MariaDB o MySQL no proporcionan ninguna instalación para depurar procedimientos almacenados.

3. Mantenimientos: Desarrollar y mantener procedimientos almacenados a menudo requiere un conjunto de habilidades especializadas que no todos los desarrolladores de aplicaciones poseen. Esto puede generar problemas tanto en el desarrollo como el mantenimiento de la aplicación de datos empresariales como Oracle y SQL Server.

> Nota: Si un usuario no deja bien documentado el procedimiento, este se convierte en una caja negra.



---

