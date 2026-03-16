USE GYM;

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- Ver ingresos Totales por locales en el mes actual y anteror
DROP VIEW IF EXISTS vw_ventas_mensuales_por_local;
CREATE VIEW vw_ventas_mensuales_por_local AS
SELECT 
	Nro as 'Nro de Local', 
	concat(l.calle, ' esquina ',l.Esquina,' ' ,l.Numero_puerta) as Direccion,
	IFNULL((
			SELECT SUM(pa.monto_total)
			FROM PAGOS pa 
			WHERE pa.Nro_local = l.Nro
			  AND MONTH(pa.fecha) = MONTH(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)) 
			  AND YEAR(pa.fecha) = YEAR(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH))
			), 0)  AS ingresos_mes_anterior,
	IFNULL(
			SUM(CASE 
					WHEN MONTH(p.fecha) = MONTH(CURRENT_DATE()) 
						AND YEAR(p.fecha) = YEAR(CURRENT_DATE()) 
						THEN p.monto_total ELSE 0 END)
			, 0) AS ingresos_mes_actual
FROM LOCALES l
LEFT JOIN PAGOS p ON l.Nro = p.Nro_local
GROUP BY l.Nro;

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- Ver variaciones de ingresos en pesos y Porcentuales por locales en el mes actual vs al anterior
DROP VIEW IF EXISTS vw_rendimiento_ventas_mes_actual_vs_anterior;
CREATE VIEW vw_rendimiento_ventas_mes_actual_vs_anterior AS
SELECT 
	*,
    (ingresos_mes_actual - ingresos_mes_anterior) as Diferencia,
    (CASE 
		WHEN ingresos_mes_anterior = 0 THEN NULL
		ELSE ROUND((ingresos_mes_actual - ingresos_mes_anterior / ingresos_mes_anterior) * 100, 2)
	END) as 'Variacion %'
FROM  vw_ventas_mensuales_por_local;


-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- ver Clientes que tienen una membresia vigente junto con Informacion de dicha membresia.
DROP VIEW IF EXISTS vw_membresias_vigentes_de_clientes;
CREATE VIEW vw_membresias_vigentes_de_clientes AS
SELECT 
	C.Nro_cliente,
    CONCAT(U.Nombre, ' ', U.Apellido) as Nombre_completo,
    Email,
    Telefono,
    CI, 
    Dias_acceso_disponible,
    ID_membresia,
    M.nombre as Membresia
FROM 
((Usuarios U JOIN Clientes C on U.Nro_usuario = C.Nro_cliente)
JOIN clientes_membresia CM ON C.Nro_cliente = CM.Nro_cliente)
jOIN membresias M ON M.ID = ID_membresia
WHERE Dias_acceso_disponible > 0
ORDER BY C.Nro_cliente;



-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- ver Clientes que tienen una membresia proxima a venserse en 5 dias
DROP VIEW IF EXISTS vw_membresias_proximas_a_vencimiento_5_dias;
CREATE VIEW vw_membresias_proximas_a_vencimiento_5_dias AS
SELECT 
	*
FROM vw_membresias_vigentes_de_clientes
WHERE Dias_acceso_disponible > 5;


-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- ver Clientes que cumplen año en el mes actua
DROP VIEW IF EXISTS vw_membresias_proximas_a_vencimiento_5_dias;
CREATE VIEW vw_membresias_proximas_a_vencimiento_5_dias AS
SELECT 
	Nro_cliente,
    CONCAT(U.nombre, ' ',U.apellido) as Nombre_completo,
    CI,
    Email,
    Fecha_nacimiento,
    Telefono
FROM usuarios U
RIGHT JOIN clientes C ON U.Nro_usuario = C.Nro_cliente
WHERE MONTH(Fecha_nacimiento) LIKE MONTH(CURRENT_DATE());

