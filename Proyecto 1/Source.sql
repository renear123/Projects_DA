
---------- Creación de tablas y atributos -----------------

CREATE TABLE IF NOT EXISTS Clientes(
	id_cliente int PRIMARY KEY NOT NULL,
	nombre VARCHAR(250) NOT NULL,
	edad VARCHAR(2),
	telefono VARCHAR(9),
	direccion VARCHAR(250),
	correo VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS Tiendas(
	id_tienda int PRIMARY KEY NOT NULL,
	nombre_tienda VARCHAR(250) NOT NULL,
	ubicacion_tienda VARCHAR(20) NOT NULL,
	tipo_tienda VARCHAR(20) NOT NULL,
	telefono_tienda VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pagos(
	id_pago int PRIMARY KEY NOT NULL,
	metodo_pago VARCHAR(250) NOT NULL,
	banco VARCHAR(250),
	franquicia VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS Fact_Ventas(
	id_venta int PRIMARY KEY NOT NULL,
	id_cliente int NOT NULL,
	id_tienda int NOT NULL,
	id_pagos int NOT NULL,
	fecha_creacion TIMESTAMP NOT NULL,
	total_venta NUMERIC(10,2) NOT  NULL,
	descuento_venta NUMERIC(10,2) NOT  NULL,
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY(id_tienda) REFERENCES tiendas(id_tienda),
	FOREIGN KEY(id_pagos) REFERENCES pagos(id_pago)
);

CREATE TABLE IF NOT EXISTS Proveedores(
	id_proveedor int PRIMARY KEY NOT NULL,
	representante VARCHAR(250) NOT NULL,
	empresa VARCHAR(250) NOT NULL,
	direccion_proveedor VARCHAR(250) NOT NULL,
	telefono_proveedor VARCHAR(9) NOT NULL,
	correo_proveedor VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS P_Departamentos(
	id_departamento int PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Categoria(
	id_categoria int PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	id_departamento int NOT NULL,
	FOREIGN KEY(id_departamento) REFERENCES P_Departamentos(id_departamento)
);


CREATE TABLE IF NOT EXISTS Productos(
	id_producto int PRIMARY KEY NOT NULL,
	nombre_producto VARCHAR(250) NOT NULL,
	fecha_creacion DATE NOT NULL,
	fecha_expiracion DATE NOT NULL,
	marca VARCHAR(250) NOT NULL,
	precio_regular NUMERIC(10,2) NOT NULL,
	costo NUMERIC(10,2) NOT NULL,
	id_proveedor int NOT NULL,
	id_categoria int NOT NULL,
	FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor),
	FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE IF NOT EXISTS fact_inventario(
	id_inventario int PRIMARY KEY NOT NULL,
	id_producto int NOT NULL,
	fecha_ingreso DATE NOT NULL,
	fecha_rotacion DATE NOT NULL,
	stock int NOT NULL,
	FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS Fact_Campanias(
	id_campania int PRIMARY KEY NOT NULL,
	nombre VARCHAR(250) NOT NULL,
	descripcion_campania VARCHAR(250) NOT NULL,
	tipo VARCHAR(250) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	medio VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS Promociones(
	id_promocion int PRIMARY KEY NOT NULL,
	descuento NUMERIC(10,2),
	tipo_promocion VARCHAR(250) NOT NULL,
	descripcion VARCHAR(250),
	estado BOOL,
	id_campania int NOT NULL,
	FOREIGN KEY(id_campania) REFERENCES Fact_Campanias(id_campania)
);

CREATE TABLE IF NOT EXISTS detalles_ventas(
	id_Dventa int PRIMARY KEY NOT NULL,
	id_producto int NOT NULL,
	id_venta int NOT NULL,
	cantidad int NOT NULL,
	precio_final NUMERIC(10,2) NOT NULL,
	des_producto NUMERIC(10,2) NOT NULL,
	id_promocion int,
	FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
	FOREIGN KEY(id_venta) REFERENCES fact_ventas(id_venta),
	FOREIGN KEY(id_promocion) REFERENCES promociones(id_promocion)
);

SELECT * FROM clientes



DELETE FROM clientes
WHERE nombre = 'Katy';

--- Insertar datos de clientes ---

insert into Clientes (id_cliente, nombre, edad, telefono, direccion, correo)
 values (685456696,'rene',25, 61988363, 'santa tecla', 'rene.cardoza098@gmail.com'),
 		(658456696,'Juan',22, 61988163, 'santa ana', 'juanj099@gmail.com'),
		(685432326,'Rodrigo',19, 619218363, 'san salvador', 'rodrigomor@hotmail.com'),
 		(687545696,'Elmer',17, 61988345, 'la libertad', 'elmera8@outlook.com'),
		(698752322,'Jefferson',25, 75188363, 'san miguel', 'jeffcanjurat@gmail.com'),
 		(632626521,'Miguel',35, 62588363, 'cuscatlan', 'miguelrmr@hotmail.com'),
		(686332268,'Raul',21, 61932363, 'sonsonte', 'raulezeq56@gmail.com'),
 		(657121004,'Luis',33, 61955363, 'ahuachapan', 'llramirez@gmail.com'),
		(698556563,'Norma',25, 61858363, 'san salvador', 'normacamp312@gmail.com'),
 		(684852362,'Katy',23, 61982563, 'cabañas', 'katyrivera45@outlook.com')	

insert into Tiendas (id_tienda, nombre_tienda, ubicacion_tienda, tipo_tienda, telefono_tienda)
 values (25468,'tienda-ST', 'santa tecla', 'fisica', 22558863),
 		(24689,'tienda-SA', 'santa ana', 'fisica', 22558864),
		(25546,'tienda-SS', 'san salvador', 'fisica', 22558865),
 		(28469,'tienda-LL', 'la libertad', 'en linea', 22558866),
		(25686,'tienda-SM', 'san miguel', 'fisica', 22558867),
 		(25668,'tienda-CC', 'cabañas', 'en linea', 22558868),
		(25689,'tienda-SO', 'sonsonate', 'fisica', 22558869),
 		(26989,'tienda-AH', 'ahuachapan', 'fisica', 22558870),
		(26896,'tienda-EL', 'san salvador', 'en linea', 22558800),
 		(25876,'tienda-CA', 'cabañas', 'fisica', 22558871)	

insert into Pagos(id_Pago,Metodo_Pago,Banco,Franquicia)
values	(1,'Efectivo','No aplica','No aplica'),
		(2,'Debito a tarjeta','Cuscatlan','VISA'),
		(3,'Credito a tarjeta','Cuscatlan','VISA'),
		(4,'Pago por puntos','Cuscatlan','VISA'),
		(5,'Debito a tarjeta','Agricola','VISA'),
		(6,'Credito a tarjeta','Agricola','VISA'),
		(7,'Pago por puntos','Agricola','VISA'),
		(8,'Debito a tarjeta','Cuscatlan','MASTER CARD'),
		(9,'Credito a tarjeta','Cuscatlan','MASTER CARD'),
		(10,'Pago por puntos','Cuscatlan','MASTER CARD'),
		(11,'Debito a tarjeta','Agricola','MASTER CARD'),
		(12,'Credito a tarjeta','Agricola','MASTER CARD'),
		(13,'Pago por puntos','Agricola','MASTER CARD')   
		
insert into Fact_Ventas (id_venta, id_cliente, id_tienda, id_pagos, fecha_creacion, total_venta, descuento_venta)
 values (52356,657121004,25468, 5, '2023/07/17', 46.32,0.15),
 		(56869,685456696,26896, 8, '2023/05/30', 21.02,0.10),
		(58796,687545696,26989, 1, '2023/06/02', 10.65,0.20),
 		(52486,685432326,28469, 2, '2022/12/10', 22.04,0.10),
		(56898,698556563,26989, 1, '2023/07/25', 19.25,0.05),
 		(59862,657121004,28469, 12, '2023/04/15', 25.21,0.10),
		(59871,687545696,26989, 7, '2023/03/20', 5.49,0.25),
 		(59878,657121004,25686, 3, '2023/03/08', 68.25,0.30),
		(59893,685432326,28469, 10, '2023/02/09', 36.39,0.10),
 		(59892,687545696,25546, 2, '2023/01/16', 15.48,0.15)
		
insert into Proveedores (id_proveedor, representante, empresa, direccion_proveedor, telefono_proveedor, correo_proveedor)
 values (1,'Carlos Perez','Empresa NA SA de CV','San Salvador, Apopa','6598-9898','Empresa_NA@gmail.com'),
		(2,'Marlon Bonilla','Repuesto y Mas NA SA de CV','Sonsonate, Acajutla','6999-5665','Repuesto_Y_Mas@gmail.com'),
		(3,'Matias Pintin','Estrellados SA de CV','Soyapango, Soyapango','7898-0202','Estrellados@gmail.com')
		
		
insert into P_Departamentos (id_Departamento, nombre)
values (1,'Alimentos'),
	   (2,'Bebidas'),
	   (3,'Limpieza'),
	   (4,'Cuidado Personal'),
	   (5,'Electronicos')

insert into Categoria (id_Categoria,nombre, id_departamento)
values (12051,'Frutas y Verduras', 1),
	   (98982,'Lácteos y embutidos', 1),
	   (12145,'Cereales y Granos', 1),
	   (13564,'Panadería y Repostería', 1),
	   (36568,'Bebidas Energeticas', 2),
	   (78988,'Bebidas Alcoholicas', 2),
	   (12356,'Jugos y Bebidas de Frutas', 2),
	   (13569,'Utensilios de Limpieza', 3),
	   (56897,'Detergentes y Suavizantes', 3),
	   (59789,'Cuidado del Cabello', 4),
	   (12346,'Perfumes y Fragancias', 4),
	   (10345,'Audio y Altavoces', 5),
	   (12224,'Teléfonos y Accesorios', 5)

insert into Productos (id_producto, nombre_producto, fecha_creacion, fecha_expiracion, marca, precio_regular, costo, id_proveedor, id_categoria)
 values (78956,'Manzana Roja','2023/02/25', '2023/09/15', 'Del campo',1.75,1.15,3,12051),
 		(78423,'Cereal Zucaritas 300G','2022/09/11', '2023/12/25', 'Kellogs',3.80,2.95,3,12145),
		(73658,'Vino Cabernet Sauvignon','2022/02/12', '2024/07/25', 'Frontera',6.35,5.15, 1, 78988),
 		(79623,'Suavizante Suavitel 2.8L','2020/08/25', '2026/12/16', 'Suavitel',10.20,8.15, 1, 56897),
		(79612,'Pan de caja blanco familiar','2023/06/15', '2023/09/25', 'Bimbo',2.80,1.85, 3, 13564),
 		(75469,'Shampoo limpieza profunda','2020/01/30', '2026/07/14', 'Head & Shoulders',7.56,5.21, 1, 78988),
		(79356,'Cerveza lata 335ml','2022/11/12', '2023/12/15', 'Pilsener',1.20,0.70, 1, 78988),
 		(74569,'Queso Izalqueño 200G','2023/03/16', '2023/09/23', 'San Julian',2.96,1.82, 3, 98982),
		(79343,'Leche entera 946ml','2022/05/26', '2023/12/22', 'Sula',1.70,1.10, 1, 98982),
 		(79843,'Jamon de pavo 290Grs','2023/04/05', '2023/09/29', 'Fud',2.97,1.95, 3, 98982)

 insert into Fact_Inventario (id_inventario, id_producto, fecha_ingreso, fecha_rotacion, stock)
 values (87954,78423,'2023/07/25', '2023/12/25', 121),
 		(85231,75469,'2023/05/04', '2023/09/14', 51),
		(89753,74569,'2023/03/12', '2023/06/12', 10),
 		(81112,79356,'2023/05/22', '2023/10/30', 63),
		(86655,78423,'2023/06/15', '2023/12/25', 22),
 		(88896,79623,'2023/05/11', '2023/11/19', 16),
		(87455,79612,'2023/08/12', '2023/09/24', 215),
 		(89553,78423,'2023/08/15', '2023/09/16', 71),
		(87445,79623,'2023/02/06', '2023/08/21', 32),
 		(83325,75469,'2023/04/03', '2023/10/15', 11)
			
insert into Fact_Campanias (id_campania, nombre, descripcion_campania, tipo, fecha_inicio, fecha_fin, medio)
values  (98753,'Campaña BAC y CUSCA','Productos en descuento al pagar con tarjetas de credito BAC y Cuscatlan','metodo de pago','30/08/2023', '06/09/2023', 'Facebook'),
 		(99263,'Campaña de navidad','Productos en descuento en congelados','descuentos productos varios','15/12/2022', '25/12/2022', 'Periodico'),
		(97586,'Campaña de licores','Productos en descuento en departamento de licores','descuentos productos varios','18/07/2023', '31/07/2023', 'Televisión'),
 		(97885,'Campaña Detergentes','Productos en descuento en toda la categoria Detergentes y suavizantes','descuentos por categoria','20/03/2023', '26/03/2023', 'Instagram'),
		(97663,'Campaña futboleros','Productos en descuento en boquitas','descuentos productos varios','12/11/2022', '18/11/2022', 'Twitter/X'),
 		(98665,'Campaña 2x1 en bebidas','Bebidas seleccionadas al 2x1','el segundo producto es gratis','04/05/2023', '06/05/2023', 'Valla publicitaria'),
		(99987,'Campaña de fin de año','Productos varios en descuento de fin de año','descuentos productos varios','18/12/2022', '31/12/2022', 'Bolantes'),
 		(99365,'Campaña de San Valentín','Chocolates en promoción','Descuento en chocolates','10/02/2023', '14/02/2023', 'Facebook'),
		(99745,'Campaña de semana Santa','Productos en descuento en bebidas, panadería y carnes','descuentos productos varios','24/03/2023', '30/03/2023', 'Pagina web'),
 		(99782,'Campaña del Día de la madre','Quesos y vinos en promoción','descuentos productos varios','25/04/2023', '10/05/2023', 'Correo electronico')

insert into Promociones (id_promocion, descuento, tipo_promocion, descripcion, estado, id_campania)
values  (45879,0.5,'Productos 2x1', 'Leche Sula al 2x1', TRUE , 98665),
 		(98753,0.2,'Productos con descuento', 'Jamón de Pavo en promoción', FALSE, 99263),
		(41558,0.15,'Metodo de pago', 'Productos en descuento al pagar con tarjeta de credito BAC', TRUE, 98753),
 		(47899,0.10,'Productos en descuento', 'Vino Cabernet Sauvignon Frontera en descuento', FALSE, 99782),
		(45662,0.2,'Productos 2x1', 'Vino Cabernet Sauvignon Frontera en descuento', TRUE, 98665),
 		(45887,0.5,'Productos 2x1', 'Cerveza Pilsener lata 335ml al 2x1', TRUE , 98665),
		(47896,0.1,'Metodo de pago', 'Productos en descuento al pagar con tarjeta de credito CUSCA', TRUE, 98753),
 		(42336,0.15,'Productos con descuento', 'Queso Izalqueño San Julian 200G en descuento', FALSE, 99782),
		(46998,0.10,'Categoria con descuento', 'Suavizante Suavitel 2.8L', TRUE, 97885),
 		(47895,0.20,'Productos en descuento en varias categorias','Pan de caja blanco familiar Bimbo', FALSE, 99745)
		
insert into Detalles_Ventas (id_dventa, id_producto, id_venta, cantidad, precio_final, des_producto, id_promocion)
values  (12395,73658,52356, 2, 5.72, 0.10, 47899),
 		(12396,79343,52356, 2, 0.85, 0.5, 45879),
		(12397,75469,52356, 4, 7.56, 0,null),
 		(12963,79343,59893, 5, 1.53, 0.10, 47896),
		(12784,75469,59892, 2, 6.43, 0.15, 41558),
 		(12336,79843,56898, 1, 2.38, 0.20, 98753),
		(12665,75469,59893, 1, 7.56, 0,null),
 		(12554,79612,59871, 2, 2.24, 0.20, 47895),
		(12449,75469,59892, 5, 6.43, 0.15, 41558),
 		(12887,73658,59893, 9, 5.72, 0.10, 47896)
		
DELETE FROM Detalles_Ventas


----- Consultas generales -----

SELECT * FROM clientes
SELECT * FROM tiendas
SELECT * FROM pagos
SELECT * FROM fact_ventas
SELECT * FROM Proveedores
SELECT * FROM P_Departamentos
SELECT * FROM Categoria
SELECT * FROM Productos
SELECT * FROM fact_inventario
SELECT * FROM fact_campanias
SELECT * FROM Promociones
SELECT * FROM Detalles_Ventas

--- Consulta de ejemplo ---

/*Consulta sobre campania con mayor ticket promedio*/
SELECT distinct ON (fv.id_venta) fv.id_venta, fc.id_campania as Codigo_Campania, fc.nombre , fc.descripcion_campania as Descripcion_Campania, pm.descripcion as Promocion, fv.total_venta
FROM Detalles_Ventas as dv
INNER JOIN Fact_Ventas as fv
ON dv.id_venta = fv.id_venta
INNER JOIN Promociones as pm
ON dv.id_Promocion = pm.id_promocion
INNER JOIN Fact_campanias as fc
ON fc.id_campania = pm.id_campania
GROUP BY fv.id_venta

---- Mis consultas ---

/*Consulta 1: Consulta sobre el impacto en ventas de nuestras campañas de marketing en las ventas.
Sobre campania con mayor facturación
Un id_venta puede tener varias campañas segun promocion-producto en detalles de venta
Se muestra el summary de cantidad de info de la campaña, cantidad de productos vendidos (combinados)
y total de la venta correspondiente a la campaña*/

CREATE VIEW ventas_por_campania AS
SELECT   fc.id_campania as Codigo_Campania, fc.nombre, fc.tipo, fc.descripcion_campania as Descripcion_Campania, SUM(dv.cantidad) as Cantidad_productos, SUM(dv.cantidad*dv.precio_final) as venta_campania 
FROM Fact_campanias as fc
INNER JOIN Promociones as pm
ON fc.id_campania = pm.id_campania
INNER JOIN Detalles_Ventas as dv
ON pm.id_promocion = dv.id_promocion
GROUP BY fc.id_campania

/*Consulta 2:
Consulta sobre que productos se estan vendiendo más y a que tipo de clientes*/

/*Consulta sobre que productos se estan vendiendo más */

CREATE VIEW producto_mas_vendido AS
SELECT   p.nombre_producto as Producto, dv.id_producto, SUM(dv.cantidad) as cantidad
FROM Detalles_ventas as dv
INNER JOIN Productos as p
ON dv.id_producto = p.id_producto
GROUP BY p.nombre_producto, dv.id_producto
ORDER BY cantidad DESC


/*Consulta 3:
Consulta sobre que productos se estan vendiendo más y a que tipo de clientes*/
/*Consulta a que tipo de clientes*/

CREATE VIEW Tipo_de_cliente AS
SELECT   p.nombre_producto as Producto, dv.id_producto, fv.id_cliente as DUI, c.nombre as Nombre_cliente, c.edad, c.direccion as Ubicacion
FROM Detalles_ventas as dv
INNER JOIN Productos as p
ON dv.id_producto = p.id_producto
INNER JOIN Fact_Ventas as fv
ON dv.id_venta = fv.id_venta
INNER JOIN Clientes as c
ON fv.id_cliente = c.id_cliente
ORDER BY P.nombre_producto DESC

/*Consulta 4:
Consulta sobre productos que se estan agotando y los que tienen bajo nivel de rotacion*/

CREATE VIEW rotacion_stock AS
SELECT   p.nombre_producto as Producto, fi.id_producto, fi.stock, 
CASE WHEN stock < 20 
THEN 'Low inventory' 
ELSE 'In Stock' 
END AS nivel_de_inventario, 
fi.fecha_ingreso, fi.fecha_rotacion, fi.fecha_rotacion-fi.fecha_ingreso  as dias_duracion,
CASE WHEN (fi.fecha_rotacion-fi.fecha_ingreso) >= 150
THEN 'Bajo nivel de rotación'
WHEN (fi.fecha_rotacion-fi.fecha_ingreso) > 100 AND (fi.fecha_rotacion-fi.fecha_ingreso) < 150
THEN 'Rotación intermedia'
ELSE 'Alto nivel de rotación' END AS Rotacion
FROM Fact_Inventario as fi
INNER JOIN Productos as p
ON fi.id_producto = p.id_producto

SELECT * FROM fact_inventario

/*Consulta sobre fecha con mayor cantidad de ventas*/


/*Metodo favorito de pago y facturación total con ese metodo*/

/*Descripcion de venta resumen*/
CREATE VIEW resumen_ticket AS
SELECT fv.id_venta, fv.id_cliente, fv.id_tienda, fv.total_venta, STRING_AGG(p.nombre_producto, ', ') as productos_venta
FROM Fact_Ventas as fv
INNER JOIN Detalles_ventas as dv
ON fv.id_venta = dv.id_venta
INNER JOIN productos as p
ON dv.id_producto = p.id_producto
GROUP BY fv.id_venta


/* Consulta de vistas */
SELECT * FROM ventas_por_campania;
SELECT * FROM tipo_de_cliente;
SELECT * FROM producto_mas_vendido;
SELECT * FROM rotacion_stock;
SELECT * FROM resumen_ticket;
