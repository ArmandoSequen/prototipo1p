DROP DATABASE proveedores;
CREATE DATABASE proveedores;
USE proveedores;
CREATE TABLE bodegas
(
	codigo_bodega VARCHAR(25) PRIMARY KEY,
    nombre_bodega VARCHAR(25),
    estatus_bodega VARCHAR(25)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


CREATE TABLE marcas
(
	codigo_marca VARCHAR(25) PRIMARY KEY,
    nombre_marca VARCHAR(25),
    estatus_marca VARCHAR(25)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE productos
(
	codigo_producto VARCHAR(25) PRIMARY KEY,
    nombre_producto VARCHAR(25),
    codigo_marca VARCHAR(25),
    existencia_producto FLOAT(10,2),
    estatus_producto VARCHAR(25)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE existencias
(
	codigo_bodega VARCHAR(25),
    codigo_producto VARCHAR(25),
    saldo_existencia FLOAT(10,2),
    PRIMARY KEY (codigo_bodega, codigo_producto),
	FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE vendedores
(
	codigo_vendedor VARCHAR(25) PRIMARY KEY,
    nombre_vendedor VARCHAR(25),
    direccion_vendedor VARCHAR(25),
    telefono_vendedor VARCHAR(25),
    nit_vendedor VARCHAR(25),
    estatus_vendedor VARCHAR(25)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE clientes
(
	codigo_cliente VARCHAR(25) PRIMARY KEY,
    nombre_cliente VARCHAR(25),
    direccion_cliente VARCHAR(25),
    nit_cliente VARCHAR(25),
    telefono_cliente VARCHAR(25),
    codigo_vendedor VARCHAR(25),
    estatus_cliente VARCHAR(25),
    FOREIGN KEY (codigo_vendedor) REFERENCES vendedores(codigo_vendedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE proveedores
(
	codigo_proveedor VARCHAR(25) PRIMARY KEY,
    nombre_proveedor VARCHAR(25),
    direccion_proveedor VARCHAR(25),
    telefono_proveedor VARCHAR(25),
    nit_proveedor VARCHAR(25),
    estatus_proveedor VARCHAR(25)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE compras_encabezado
(
	documento_compraenca VARCHAR(25) PRIMARY KEY,
    codigo_proveedor VARCHAR(25),
    fecha_compraenca DATE,
	total_compraenca FLOAT(10,2),
    estatus_compraenca VARCHAR(25),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedores(codigo_proveedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE compras_detalle
(
	documento_compraenca VARCHAR(25),
    codigo_producto VARCHAR(25),
    cantidad_compradet FLOAT(10,2),
    costo_compradet FLOAT(10,2),
	codigo_bodega VARCHAR(25),
    PRIMARY KEY (documento_compraenca, codigo_producto),
    FOREIGN KEY (documento_compraenca) REFERENCES compras_encabezado(documento_compraenca),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE ventas_encabezado
(
	documento_ventaenca VARCHAR(25) PRIMARY KEY,
    codigo_cliente VARCHAR(25),
    fecha_ventaenca DATE,
    total_ventaenca FLOAT(10,2),
    estatus_ventaenca VARCHAR(25),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE ventas_detalle
(
	documento_ventaenca VARCHAR(25),
    codigo_producto VARCHAR(25),
    cantidad_ventadet FLOAT(10,2),
    costo_ventadet FLOAT(10,2),
    precio_ventadet FLOAT(10,2),
    codigo_bodega VARCHAR(25),
    PRIMARY KEY (documento_ventaenca, codigo_producto),
    FOREIGN KEY (documento_ventaenca) REFERENCES ventas_encabezado(documento_ventaenca),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
    