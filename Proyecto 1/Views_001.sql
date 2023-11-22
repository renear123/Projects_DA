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
