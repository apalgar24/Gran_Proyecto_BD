--- Creación de base de datos jardinería;
CREATE DATABASE jardineria CHARACTER SET utf8mb4;
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
  codigo_empleado INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado),
  CONSTRAINT ch_email CHECK(email REGEXP '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
   CONSTRAINT chech ch_nombre_empleado CHECK (nombre REGEXP '^[A-Z]*')
);


CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL UNIQUE,
  direccion VARCHAR(50) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  codigo_empleado INTEGER DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado),
  CONSTRAINT chech ch_nombre_cliente CHECK (nombre_cliente REGEXP '^[A-Z]*')
);



CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
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
  codigo_cliente INTEGER NOT NULL,
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

