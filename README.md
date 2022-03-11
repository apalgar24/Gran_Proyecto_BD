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
