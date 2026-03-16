USE GYM;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- ver todos los pagos realizados por clientes en 1 local en particular
DROP PROCEDURE IF EXISTS proc_pagos_cliente_en_local;
DELIMITER //
CREATE PROCEDURE proc_pagos_cliente_en_local(IN local INT)
BEGIN
	SELECT 
		P.Nro_ticket,
        P.Nro_cliente,
        CONCAT(U.nombre, ' ',U.apellido) AS Nombre,
        P.Hora,
        P.Monto_Total,
        P.Metodo_Pago
    FROM (locales L
    JOIN pagos P ON P.Nro_local = L.Nro)
    JOIN Usuarios U ON U.Nro_usuario = Nro_cliente
    WHERE Local = L.Nro;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- ver todos los clientes q tienen permitido asistir a a una sala en particular
DROP PROCEDURE IF EXISTS proc_clientes_permitidos_de_sala;
DELIMITER //
CREATE PROCEDURE proc_clientes_permitidos_de_sala(IN sala INT)
BEGIN
	SELECT 
		S.ID as Nro_de_sala,
        CONCAT('Sala de ',S.nombre) as Sala,
        CM.Nro_cliente,
        CONCAT(U.Nombre, ' ',U.apellido) as Cliente,
        CI,
        M.nombre as Membresia
    FROM (((salas S
    JOIN salas_membresias SM ON SM.ID_sala = S.ID)
    JOIN membresias M ON M.ID = SM.ID_membresia)
    JOIN clientes_membresia CM ON CM.ID_membresia = M.ID)
    JOIN usuarios U ON U.Nro_usuario = CM.Nro_cliente
    WHERE S.ID = sala;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- disminuir dias de acceso a la membreia de un cliente
DROP PROCEDURE IF EXISTS proc_disminuir_dias_acceso_membresia_de_cliente;
DELIMITER //
CREATE PROCEDURE proc_disminuir_dias_acceso_membresia_de_cliente(IN dias INT, IN cliente INT, IN membresia INT)
BEGIN
	DECLARE diasActualizados INT; 
    DECLARE diasActuales INT;
    
	IF NOT EXISTS(SELECT 1 FROM clientes WHERE Nro_cliente = cliente) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El cliente no existe en el sistema.';
	END IF;
    
	IF NOT EXISTS(SELECT 1 FROM clientes_membresia 
                WHERE Nro_cliente = cliente AND ID_membresia = membresia) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El cliente no tiene esa membresia.';
	END IF;
    
	IF ((SELECT Dias_acceso_disponible FROM clientes_membresia CM
		WHERE Nro_cliente = cliente AND CM.ID_membresia = membresia)=0) THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'ERROR: El cliente ya no tiene dias disponibles para esa membresia';
	END IF;
    
    SELECT (SELECT Dias_acceso_disponible FROM clientes_membresia WHERE Nro_cliente = cliente AND ID_membresia = membresia) INTO diasActuales;
    
    IF (diasActuales - dias < 0) THEN
		select 0 into diasActualizados;
	ELSE 
		select (diasActuales - dias) into diasActualizados;
    END IF;
    
	UPDATE clientes_membresia
	SET Dias_acceso_disponible = diasActualizados
    WHERE Nro_cliente = cliente AND ID_membresia = membresia;
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- aumentar dias de acceso a la membreia de un cliente
DROP PROCEDURE IF EXISTS proc_aumentar_dias_acceso_membresia_de_cliente;
DELIMITER //
CREATE PROCEDURE proc_aumentar_dias_acceso_membresia_de_cliente(IN dias INT, IN cliente INT, IN membresia INT)
BEGIN
	DECLARE diasActualizados INT; 
	IF NOT EXISTS(SELECT 1 FROM clientes WHERE Nro_cliente = cliente) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El cliente no existe en el sistema.';
	END IF;
    
	IF NOT EXISTS(SELECT 1 FROM clientes_membresia 
                WHERE Nro_cliente = cliente AND ID_membresia = membresia) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El cliente no tiene esa membresia.';
	END IF;
    
	select (Dias_acceso_disponible + dias) into diasActualizados;
    
	UPDATE clientes_membresia 
	SET Dias_acceso_disponible = diasActualizados
    WHERE Nro_cliente = cliente AND ID_membresia = membresia;
END//
DELIMITER ;



-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- registrar un nuevo pago a una membresia recibiendo los parametros. 
-- Se registra la membresia, y si ya existe una vigente, se suman los dias a los dias ya disponibles.alter




