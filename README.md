# Gran_Proyecto_BD

|                   |          TABLA PRODUCTO            |          |
|-------------------|------------------------------------|----------|
| **codigo**            | Cadena de caracteres de 15         | NOT NULL |
| nombre            | Cadena de caracteres de 70         | NOT NULL |
| **gama**             | Cadena de caracteres de 50         | NOT NULL |
| dimensiones       | Cadena de caracteres de 25         | NULL     |
| cantidad_en_stock | Número entero de 6                 | NULL     |
| precio_venta      | Número decimal de 15 y 2 decimales | NOT NULL |
| precio_proveedor  | Número decimal de 15 y 2 decimales | NULL     |


|                   | TABLA GAMA_PRODUCTO    |          |
|-------------------|------------------------|----------|
| **gama**              | Cadena de texto de 50  | NOT NULL |
| descripcion_texto | Cadena de texto de 250 | NULL     |
| descripción_html  | Cadena de texto de 250 | NULL     |



|                 | TABLA DETALLE DEL PEDIDO    |          |
|-----------------|-----------------------------|----------|
| **codigo_pedido**   | Número entero de 11         | NOT NULL |
| **codigo_producto** | Cadena de caracteres de 15  | NOT NULL |
| cantidad        | Número entero de 11         | NOT NULL |
| preio_unidad    | Decimal de 15 y 2 decimales | NOT NULL |


|                | TABLA DE PEDIDOS          |          |
|----------------|---------------------------|----------|
| **codigo_pedido**  | Número entero de 11       | NOT NULL |
| **codigo_cliente** | Número entero de 11       | NOT NULL |
| fecha_pedido   | Tipo fecha                | NOT NULL |
| fecha_esperada | Tipo fecha                | NOT NULL |
| fecha_entrega  | Tipo fecha                | NULL     |
| estado         | Cadena de cracteres de 15 | NOT NULL |


|                            | TABLA DE CLIENTES          |          |
|----------------------------|----------------------------|----------|
| **codigo_cliente**             | Número entero de 13        | NOT NULL |
| nombre_cliente             | Cadena de caracteres de 50 | NOT NULL |
| nombre_contacto            | Cadena de caracteres de 30 | NULL     |
| apellido_contacto          | Cadena de caracteres de 30 | NULL     |
| telefono                   | Cadena de caracteres de 50 | NOT NULL |
| direccion                  | Cadena de caracteres de 50 | NOT NULL |
| ciudad                     | Cadena de caracteres de 50 | NOT NULL |
| codigo_postal              | Cadena de caracteres de 10 | NULL     |
| **codigo_empleado_rep_ventas** | Número entero de 11        | NOT NULL |


|                | TABLA DE PAGO                      |          |
|----------------|------------------------------------|----------|
| **codigo_cliente** | Número entero de 11                | NOT NULL |
| forma_pago     | Cadena de caracteres de 40         | NOT NULL |
| **id_transición**  | Cadena de caracteres de 50         | NOT NULL |
| fecha_pago     | Tipo fecha                         | NOT NULL |
| total          | Númeor decimal de 15 y 2 decimales | NOT NULL |


|                 | TABLA DE EMPLEADO           |          |
|-----------------|-----------------------------|----------|
| **codigo_empleado** | Número entero de 11         | NOT NULL |
| nombre          | Cadena de caracteres de 50  | NOT NULL |
| apellido1       | Cadena de caracteres de 50  | NOT NULL |
| apellido2       | Cadena de caracteres de 50  | NULL     |
| email           | Cadena de caracteres de 100 | NOT NULL |
| **codigo_oficina**  | Cadena de caracteres de 10  | NOT NULL |
| **codigo_jefe**     | Número entero de 11         | NOT NULL |
| puesto          | Cadena de caracteres de 50  | NULL     |


|                | TABLA DE OFICINA           |          |
|----------------|----------------------------|----------|
| **codigo_oficina** | Cadena de caracteres de 10 | NOT NULL |
| ciudad         | Cadena de caracteres de 30 | NOT NULL |
| pais           | Cadena de caracteres de 50 | NOT NULL |
| codigo_postal  | Cadena de caracteres de 10 | NT NULL  |
| telefono       | Cadena de caracteres de 10 | NOT NULL |
| direccion      | Cadena de caracteres de 50 | NOT NULL |
