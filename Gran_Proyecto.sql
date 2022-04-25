--- Creación de base de datos jardinería;
CREATE DATABASE jardineria CHARACTER SET utf8mb4;
usuario: granprojecto
passwd: granprojecto
USE jardineria;

--- Creación de tablas;


CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  dimensiones VARCHAR(25) NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  precio_proveedor NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_producto)
);


CREATE TABLE empleado (
  codigo_empleado VARCHAR(9) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_jefe VARCHAR(9) DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado(codigo_empleado),
  CONSTRAINT ch_email CHECK(email REGEXP '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
  CONSTRAINT ch_nombre_empleado CHECK (nombre REGEXP '^[A-Z]*'),
  CONSTRAINT ch_codigo_empleado CHECK (codigo_empleado REGEXP '^[0-9]{8}[A-Z]$')
);


CREATE TABLE cliente (
  codigo_cliente VARCHAR(9) NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL UNIQUE,
  direccion VARCHAR(50) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  codigo_empleado varchar(9) DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado),
  CONSTRAINT ch_nombre_cliente CHECK (nombre_cliente REGEXP '^[A-Z]*'),
  CONSTRAINT ch_codigo_cliente CHECK (codigo_cliente REGEXP '^[0-9]{8}[A-Z]$')
);



CREATE TABLE pago (
  codigo_cliente VARCHAR(9) NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente),
  CONSTRAINT ch_forma_pago CHECK (forma_pago IN ('Tarjeta Credito','Paypal','Efectivo'))
);


CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  codigo_cliente VARCHAR(9) NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente),
  CONSTRAINT ch_estado CHECK(estado IN ('Empaquetando','Enviando','En camino','En correos','Llegada a su destino')),    
  CONSTRAINT ch_fecha_pedido check (fecha_pedido >= '2020-1-1')
);

CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

--- MOdificar Tablas

ALTER TABLE empleado ADD salario decimal (4,2) NOT NULL;

ALTER TABLE cliente drop column ciudad;

ALTER TABLE empleado MODIFY  email VARCHAR(100) NOT NULL UNIQUE;

ALTER TABLE empleado DROP CONSTRAINT ch_email;

ALTER TABLE empleado ADD CONSTRAINT ch_email CHECK(email REGEXP '^[^@\s]+@[^@\s]+\.[^@\s]+$');



--- INSERTAR DATOS

INSERT INTO producto VALUES ('1001','caja de flores','2x2x0.5',12,20.99,10.00);
INSERT INTO producto VALUES ('1002','regadera','2x2x0.5',22,10.00,2.00);
INSERT INTO producto VALUES ('1003','corta cesped','4x4x2',32,1999.99,300.00);
INSERT INTO producto VALUES ('1004','manguera','2x2x0.5',8,15.00,5.00);

INSERT INTO empleado VALUES ('12345678J','Juan','Pérez','Roldán','juan123@hotmail.com',NULL,'dependiente');
INSERT INTO empleado VALUES ('87654321M','José','García','García','josegarcia@hotmail.es',2,'jefe');
INSERT INTO empleado VALUES ('27484284M','María','García','Pérez','mariagp@hotmail.com',NULL,'dependiente');