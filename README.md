# Gran_Proyecto_BD

## TABLAS


|                   |          TABLA PRODUCTO            |          |
|-------------------|------------------------------------|----------|
| **CODIGO**            | Cadena de caracteres de 15         | NOT NULL |
| nombre            | Cadena de caracteres de 70         | NOT NULL |
| **gama**             | Cadena de caracteres de 50         | NOT NULL |
| dimensiones       | Cadena de caracteres de 25         | NULL     |
| cantidad_en_stock | Número entero de 6                 | NULL     |
| precio_venta      | Número decimal de 15 y 2 decimales | NOT NULL |
| precio_proveedor  | Número decimal de 15 y 2 decimales | NULL     |


|                   | TABLA GAMA_PRODUCTO    |          |
|-------------------|------------------------|----------|
| **GAMA**              | Cadena de texto de 50  | NOT NULL |
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
| **CODIGO_PEDIDO**  | Número entero de 11       | NOT NULL |
| **codigo_cliente** | Número entero de 11       | NOT NULL |
| **codigo_empleado** | Número entero de 11       | NOT NULL |
| fecha_pedido   | Tipo fecha                | NOT NULL |
| fecha_esperada | Tipo fecha                | NOT NULL |
| fecha_entrega  | Tipo fecha                | NULL     |
| estado         | Cadena de cracteres de 15 | NOT NULL |


|                            | TABLA DE CLIENTES          |          |
|----------------------------|----------------------------|----------|
| **CODIGO_CLIENTE**             | Número entero de 13        | NOT NULL |
| nombre_cliente             | Cadena de caracteres de 50 | NOT NULL |
| nombre_contacto            | Cadena de caracteres de 30 | NULL     |
| apellido_contacto          | Cadena de caracteres de 30 | NULL     |
| telefono                   | Cadena de caracteres de 50 | NOT NULL |
| direccion                  | Cadena de caracteres de 50 | NOT NULL |
| ciudad                     | Cadena de caracteres de 50 | NOT NULL |
| codigo_postal              | Cadena de caracteres de 10 | NULL     |
| **codigo_empleado**              | Cadena de caracteres de 10 | NULL     |
| **codigo_empleado_rep_ventas** | Número entero de 11        | NOT NULL |


|                | TABLA DE PAGO                      |          |
|----------------|------------------------------------|----------|
| **codigo_cliente** | Número entero de 11                | NOT NULL |
| forma_pago     | Cadena de caracteres de 40         | NOT NULL |
| **ID_TRANSICION**  | Cadena de caracteres de 50         | NOT NULL |
| fecha_pago     | Tipo fecha                         | NOT NULL |
| total          | Númeor decimal de 15 y 2 decimales | NOT NULL |


|                 | TABLA DE EMPLEADO           |          |
|-----------------|-----------------------------|----------|
| **CODIGO_EMPLEADO** | Número entero de 11         | NOT NULL |
| nombre          | Cadena de caracteres de 50  | NOT NULL |
| apellido1       | Cadena de caracteres de 50  | NOT NULL |
| apellido2       | Cadena de caracteres de 50  | NULL     |
| email           | Cadena de caracteres de 100 | NOT NULL |
| **codigo_oficina**  | Cadena de caracteres de 10  | NOT NULL |
| **codigo_jefe**     | Número entero de 11         | NOT NULL |
| puesto          | Cadena de caracteres de 50  | NULL     |




## RESTRICCIONES

1. País de la tabla oficina debe ser (España, Francia o Portugal)

2. email de empleado debe tener obligatoriamente la siguiente sintaxis ("texto"@"texto"."texto")

3. forma_pago de la tabla pago, debe ser (tarjeta crédito,paypal o efectivo)

4. estado de la tabla de pedido (Empaquetando,Enviando,En camino,En correos,Llegada a destino)

5. fecha_pedido debe ser a partir del año de 2020 

6. Los nombres y apellidos de los empeleados y los clientes, deben tener la primera letra en mayuscula

7. Añadir la columna salario a la tabla empleado con tipo decimal not null

8. La longitud de descripción_texto de la tabla gamma debe ser de longitud 100 

9. Teléfono de la tabla empelado y cliente debe ser único 

10. codigo:cliente y codigo_empleado deben ser 8 números y un letra al final

11. ELimar la columna ciudad de la tabla cliente

12. Modificar la columna email para que sea único

13. Desactivar la restricción del email 

14. Activar restricción del email
