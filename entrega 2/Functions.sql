USE GYM;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Formatear y retornar Dirección Completa de un local con su id
DROP FUNCTION IF EXISTS fn_formato_direccion_local;
DELIMITER //
CREATE FUNCTION  fn_formato_direccion_local(Nro_local INT) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE res VARCHAR(200);
    
    IF NOT EXISTS(SELECT 1 FROM locales WHERE Nro = Nro_local) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El local no existe en el sistema.';
	END IF;
    
    SELECT 
		CONCAT(calle, ' esq. ', esquina, ' #', numero_puerta) INTO res
    FROM locales
    WHERE Nro = Nro_local;
    
    RETURN IFNULL(res, 0);
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Obtener Estado de Membresía
DROP FUNCTION IF EXISTS fn_estado_membresia_de_cliente_por_sala_y_local;
DELIMITER //
CREATE FUNCTION  fn_estado_membresia_de_cliente_por_sala_y_local(cliente INT, local INT, sala INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE res VARCHAR(20);
    
    IF NOT EXISTS(SELECT 1 FROM clientes WHERE Nro_cliente = cliente) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El cliente no existe en el sistema.';
	END IF;
    
	IF NOT EXISTS(SELECT 1 FROM locales WHERE Nro = local) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El local no existe en el sistema.';
	END IF;
    
	IF NOT EXISTS(SELECT 1 FROM salas WHERE ID = sala) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: La sala no existe en el sistema.';
	END IF;
    
	IF NOT EXISTS(SELECT 1 FROM ((clientes C
				JOIN clientes_membresia CM ON CM.Nro_cliente = C.Nro_cliente)
                JOIN membresias M ON M.id = CM.ID_membresia)
                JOIN salas_membresias SM ON SM.ID_membresia = M.ID
                WHERE C.Nro_cliente = cliente AND SM.ID_sala = sala) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El cliente no tiene esa membresia.';
	END IF;
    
	SELECT (
		CASE
			WHEN Dias_acceso_disponible > 5 THEN 'ACTIVO'
            WHEN Dias_acceso_disponible > 0 THEN 'POR VENCER'
            ELSE 'VENCIDO'
		END
	) INTO res
	FROM ((clientes C
	JOIN clientes_membresia CM ON CM.Nro_cliente = C.Nro_cliente)
    JOIN salas_membresias SM ON SM.ID_membresia = CM.ID_membresia)
    JOIN membresias_permiten_locales MPL ON MPL.ID_membresia = CM.ID_membresia
	WHERE C.Nro_cliente = cliente AND SM.ID_sala = sala AND MPL.Nro_local = local;

    RETURN IFNULL(res, 0);
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Validar Acceso a Cliente, true si tiene membresia activa
DROP FUNCTION IF EXISTS fn_validar_acceso_cliente;
DELIMITER //
CREATE FUNCTION  fn_validar_acceso_cliente(id_cliente INT, id_local INT, id_sala INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE res BOOLEAN DEFAULT FALSE;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        RETURN FALSE;
    END;

    IF(fn_estado_membresia_de_cliente_por_sala_y_local(id_cliente, id_local, id_sala) LIKE 'VENCIDO') then
		SELECT FALSE INTO res;
	ELSE
		SELECT TRUE INTO res;
	END IF;
    
    RETURN IFNULL(res, FALSE);
END//
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Calcular edad
DROP FUNCTION IF EXISTS fn_edad_Usuario;
DELIMITER //
CREATE FUNCTION  fn_edad_Usuario(usuario INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE res INT;
    
    IF NOT EXISTS(SELECT 1 FROM usuarios WHERE Nro_usuario = usuario) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El usuario no existe en el sistema.';
	END IF;
    
    SELECT 
		FLOOR(TIMESTAMPDIFF(YEAR, Fecha_nacimiento, CURDATE())) INTO res
    FROM usuarios
    WHERE Nro_usuario = usuario;
    
    RETURN IFNULL(res, 0);
END//
DELIMITER ;