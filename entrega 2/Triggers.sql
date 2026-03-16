USE GYM;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Tabla para guardar clientes eliminados
DROP TABLE IF EXISTS CLIENTES_ELIMINADOS;
CREATE TABLE IF NOT EXISTS CLIENTES_ELIMINADOS(
	Nro_cliente INT PRIMARY KEY,
    CI CHAR(8) UNIQUE,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Telefono VARCHAR(30),
    Fecha_nacimiento DATE NOT NULL,
	Email VARCHAR(100) NOT NULL,
    Fecha_eliminado DATETIME DEFAULT NOW()
);

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Triger para guardar los clientes eliminados en su tabla correspondiente
DROP TRIGGER IF EXISTS tg_guardar_clientes_eliminados;
DELIMITER //
CREATE TRIGGER tg_guardar_clientes_eliminados
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
	DECLARE Cedula INT;
    DECLARE nom VARCHAR(30);
    DECLARE ape VARCHAR(30);
    DECLARE tel VARCHAR(30);
    DECLARE nac DATE;

	SELECT CI FROM USUARIOS WHERE Nro_usuario = OLD.Nro_cliente INTO Cedula;
    SELECT nombre FROM USUARIOS WHERE Nro_usuario = OLD.Nro_cliente INTO nom;
    SELECT apellido FROM USUARIOS WHERE Nro_usuario = OLD.Nro_cliente INTO ape;
    SELECT telefono FROM USUARIOS WHERE Nro_usuario = OLD.Nro_cliente INTO tel;
    SELECT fecha_nacimiento FROM USUARIOS WHERE Nro_usuario = OLD.Nro_cliente INTO nac;
    
    
	INSERT INTO CLIENTES_ELIMINADOS(Nro_cliente, CI, Nombre, Apellido, Telefono, Fecha_nacimiento, Email, Fecha_eliminado) VALUES(
		OLD.Nro_cliente,
        cedula,
        nom,
        ape,
        tel,
		nac,
        OLD.Email,
		NOW()
    );
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
-- Para registrar un usuario, este tiene que ser mayor de 16 años
DROP TRIGGER IF EXISTS tg_control_edad_usuario;
DELIMITER //
CREATE TRIGGER tg_control_edad_usuario
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
	DECLARE edad INT;
    SELECT FLOOR(TIMESTAMPDIFF(YEAR, NEW.Fecha_nacimiento, CURDATE())) INTO edad;
    
	IF edad < 16 THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: EL usuario debe tener almenos 16 años.';
	END IF;
END //
DELIMITER ;
