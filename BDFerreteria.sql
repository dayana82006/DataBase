Ferre campus
suministros para el area de la construccion mambosteria
y ventas de elementos electricos 
en la empresa tiene 15 empleados
cada empleado se le paga un sueldo mensual basico
pero para incentivar se le entrega una comision por venta variable, que depende del area especializada de la que se venta el producto
tiene varios proveedores, ubicados a nivel regional y nacional 
En bucaramanga tiene dos sucursales, cada sucursal tiene sus empleados y su administrador,
a futuro deseo expandir la ferreteria a otros departamentos y está haciendo negocio con extranjero para traer suministros de energia solar,
la ferreteria tambien cuenta con servicio especializados, (plomeria, pintura, instalación electrica, mamposteria, cerrajeria) que genera ingrso adicional
y le gustaria que el cliente pudiera realizar la adquisicion de esos servicios en linea (que comente lo que sucede y solicite el serviico)
a nivel de bucaramanga pero se espera ampliar a las otras sucursales 
necesita implementar servicio de pago electronico, que se pueda pagar por tarjeta de credito/debito y en efectivo 
controlar inventario y que el mimso programa le ayude a saber cuando debe hacer pedido 
tienen margenes para manejar y no permitir  que se acaben los productos, tiene stock maximo() y minimo(), 
los productos lo puede vender diferente proveedor, venta al por mayor y detal, 
necesita poder transformar inventario de mayor a unitario, a la venta unitaria va tener un incremento del 20% 
modelo entidad relacion, modelo fisico , normalizado

suministros- 
aeras (construccion, mamposteria, electronica) -
comision
empleados
profesion
proveedores -(nacional, regionl, extranjero )
sucursales 
servicios
pagos_online
clientes
pagos_online
pais
departamento
ciudad
inventario 
movimientos
tipo_inventario

productos N : M proveedor
productos N : 1 aeras
sucursal 1 : N empleados 
sucursal N : 1 empresa
empleados N : M area
empleados N : M profesion
sucursal N : 1 empresa
area 1 : N producto
pais 1 : N departamento
departamento 1 : N ciudad
ciudad 1 : N proveedor
empleados 1 : 1 cuidad
sucursal N : 1  ciudad
sucursal N : M servicios
producto N : M tipo_inventario
tipo_inventario 1 : N movimientos
movimientos 1 : N detalle_mov

-- Tabla Producto
CREATE TABLE producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Tabla Producto
CREATE TABLE producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Tabla Área
CREATE TABLE area (
    id_area INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla Empleado
CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_area INT,
    id_ciudad INT,
    FOREIGN KEY (id_area) REFERENCES area(id_area),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);

-- Tabla Ciudad
CREATE TABLE ciudad (
    id_ciudad INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Tabla Departamento
CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

-- Tabla País
CREATE TABLE pais (
    id_pais INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla Sucursal
CREATE TABLE sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_ciudad INT,
    id_empresa INT,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

-- Tabla Empresa
CREATE TABLE empresa (
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla Profesión
CREATE TABLE profesion (
    id_profesion INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla Servicio
CREATE TABLE servicio (
    id_servicio INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla Tipo Inventario
CREATE TABLE tipo_inventario (
    id_tipo_inventario INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Tabla Movimiento
CREATE TABLE movimiento (
    id_movimiento INT PRIMARY KEY,
    id_tipo_inventario INT,
    fecha DATETIME,
    FOREIGN KEY (id_tipo_inventario) REFERENCES tipo_inventario(id_tipo_inventario)
);

-- Tabla Detalle Movimiento
CREATE TABLE detalle_movimiento (
    id_detalle INT PRIMARY KEY,
    id_movimiento INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_movimiento) REFERENCES movimiento(id_movimiento),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Relación N:M entre Producto y Proveedor
CREATE TABLE producto_proveedor (
    id_producto INT,
    id_proveedor INT,
    PRIMARY KEY (id_producto, id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Relación N:M entre Empleado y Profesión
CREATE TABLE empleado_profesion (
    id_empleado INT,
    id_profesion INT,
    PRIMARY KEY (id_empleado, id_profesion),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_profesion) REFERENCES profesion(id_profesion)
);

-- Relación N:M entre Empleado y Area
CREATE TABLE empleado_area (
    id_empleado INT,
    id_area INT,
    PRIMARY KEY (id_empleado, id_area),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_area) REFERENCES area(id_area)
);

-- Relación N:M entre Sucursal y Servicio
CREATE TABLE sucursal_servicio (
    id_sucursal INT,
    id_servicio INT,
    PRIMARY KEY (id_sucursal, id_servicio),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

-- Relación N:M entre Producto y Tipo Inventario
CREATE TABLE producto_tipo_inventario (
    id_producto INT,
    id_tipo_inventario INT,
    PRIMARY KEY (id_producto, id_tipo_inventario),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_tipo_inventario) REFERENCES tipo_inventario(id_tipo_inventario)
);

