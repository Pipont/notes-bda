# Clase 02 - Semana 14
## Bases de datos avanzadas

Objetivo principal:

* Empezar el proceso de normalización como en casos de la vida real prácticos.

* Diseñar a una base de datos de acuerdo a cómo consideremos mejor nuestra base de datos




- - - 

### Ejercicio

Se necesita desarrollar un sistema de compras en línea. El sistema ofrecerá productos de diferentes categorías, como electrónica, ropa, artículos deportivo, entre otros. Los usuarios podrán registrarse y agregar productos a su carrito de compras. Además, podrán realizar pagos en línea y realizar un seguimiento del estado de sus pedidos.

Los productos tendrán atributos como nombre, descripción, precio, categoría y disponibilidad. Los usuarios tendrán atributos como nombre, dirección de correo electrónico, dirección de envío y contraseña. El carrito de compras de cada usuario deberá mantenerse actualizado en todo momento y se debe permitir a los usuarios eliminar productos del carrito o modificar la cantidad de productos que desean comprar.


El sistema deberá de contar con un registro de transacciones para llevar un registro de todos los pedidos realizados, incluyendo el nombre del producto, la cantidad, el precio, la dirección de envío y la fecha de compra. Los pagos se procesarán a través de una pasarela de pagos, por lo que se necesitará un registro de pagos que incluya el número de tarjeta de credito, la fecha de vencimiento y el nombre del titular de la tarjeta.

Por último, se necesitará realizar el seguimiento de pedidos que permita a los usuarios verificar el estado de su pedido en línea. El sistema deberá actualizar automáticamente el estado del pedido a medida que se procesa y se envía.

---


De este modo, se identifican las siguientes tablas
```
Categorias (id, nombre)
Usuarios (id, nombre, email, direccion, )
Productos (id, nombre, descripcion, precio, dispo)
Carritos (id, usuario_id)
Productos_Carritos (id, carrito_id, producto_id, cantidad)
Transacciones (id, carrito_id, fecha, dire_envio)
Pagos (id, transaction_id, #tarjeta, fe_ven, nom_titular)
Seguimiento_pedidos (id, pedido_id, estado, fecha_activa_estado)
Pedidos (id, carrito_id, transaccion_id, direccion_id)
Tarjetas (id, usuario_id, numero_tarjeta, fecha_vencimiento, nombre_titular)
Metodos_Pagos (id, transaccion_id, tarjeta_id)
Precios_producto (id, producto_id, fecha_inicio, fecha_final, precio)
```




