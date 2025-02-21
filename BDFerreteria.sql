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

proveedores
clintes
servicio_online
inventario 
servicios especializados
sucursales
city
region
pais 
pago electronico 
pedidios
ventas
empleados
categoria_producto
historial_inventario
comisiones 
tarifas de servicios
ubicaciones
precios



Proveedores: Necesaria para almacenar información sobre los proveedores de los productos.
Clientes: Necesaria para almacenar información sobre los clientes, tanto para ventas como para solicitudes de servicio.
Servicio_Online: Si te refieres a las solicitudes de servicios online, esta tabla puede ser necesaria para registrar qué servicios son solicitados y cuándo.
Inventario: Esencial para controlar el stock de productos y gestionar las ventas.
Servicios Especializados: Es crucial para registrar los diferentes tipos de servicios que ofreces, como plomería, electricidad, etc.
Sucursales: Necesaria para gestionar las diferentes ubicaciones de la empresa.
Ciudad, Región, País: Pueden estar relacionadas con las sucursales y los clientes, ayudando a gestionar la localización geográfica.
Pago Electrónico: Necesaria para registrar los pagos por tarjeta de crédito/débito y en efectivo.
Pedidos: Fundamental para hacer pedidos de inventario a los proveedores.
Ventas: Necesaria para registrar todas las ventas realizadas, tanto al por mayor como al por menor.
Empleados: Esencial para gestionar la información de los empleados, incluyendo las comisiones por ventas.
Método_de_Pago: Necesaria para identificar qué tipo de pagos se realizaron en cada venta.
Venta_por_Mayor: Esta tabla puede ser innecesaria por separado si ya tienes la capacidad de manejar las ventas al por mayor a través de la tabla de ventas. Podrías agregar un campo adicional en la tabla de ventas para distinguir entre ventas al por mayor y al por menor.
Venta_detal: Similar a la tabla anterior, podría integrarse en la tabla de ventas.
Categoría_Producto: Es útil para clasificar los productos según su tipo (e.g., herramientas, electricidad, etc.).
Historial_Inventario: Necesaria para registrar los movimientos de inventario (entradas y salidas).
Pedidos-Proveedores: Puede ser útil si deseas un control adicional de las relaciones entre los pedidos y los proveedores, aunque puede integrarse en la tabla de pedidos.
Clasificación_Servicio: Puede ser útil si deseas clasificar los servicios especializados (e.g., plomería, cerrajería).
Historial_Comisiones: Necesaria para registrar las comisiones de los empleados a lo largo del tiempo.
Comisiones: Relacionada con el cálculo de comisiones por ventas, esencial para incentivar a los empleados.
Proveedores_Energía_Solar: Si tienes proveedores especializados en energía solar, esta tabla puede ser útil.
Productos_Energía_Solar: Si planeas ofrecer productos de energía solar, esta tabla es esencial.
Solicitudes_de_Servicios_en_Línea: Necesaria para manejar las solicitudes de servicios en línea.
Tarifas_de_Servicios: Importante para gestionar los costos de los servicios especializados.
Ubicaciones: Si no está relacionada directamente con las sucursales o proveedores, podrías agregarla en la tabla de sucursales o clientes.
















historial_inventario (CREATE TABLE Historial_Inventario (
    id_historial INT PRIMARY KEY,
    id_producto INT,
    fecha_movimiento DATE,
    cantidad INT,
    tipo_movimiento ENUM('entrada', 'salida'),
    FOREIGN KEY (id_producto) REFERENCES Inventario(id_producto)
);)