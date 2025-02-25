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









 (CREATE TABLE Historial_Inventario (
    id_historial INT PRIMARY KEY,
    id_producto INT,
    fecha_movimiento DATE,
    cantidad INT,
    tipo_movimiento ENUM('entrada', 'salida'),
    FOREIGN KEY (id_producto) REFERENCES Inventario(id_producto)
);)