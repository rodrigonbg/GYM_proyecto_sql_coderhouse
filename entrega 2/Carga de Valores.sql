USE GYM;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE CLIENTES_RUTINAS;
TRUNCATE TABLE CLIENTES_MEMBRESIA;
TRUNCATE TABLE EQUIPAMIENTOS_RUTINAS;
TRUNCATE TABLE PAGOS_MEMBRESIA;
TRUNCATE TABLE SALAS_EQUIPAMIENTOS;
TRUNCATE TABLE SALAS_MEMBRESIAS;
TRUNCATE TABLE LOCALES_SALAS;
TRUNCATE TABLE DIAS_LOCALES;
TRUNCATE TABLE DIAS_CLIENTES_RUTINAS;
TRUNCATE TABLE DIAS_TRABAJO_STAFF;
TRUNCATE TABLE MEMBRESIAS_PERMITEN_LOCALES;
TRUNCATE TABLE LOCALES_OFRECEN_MEMBRESIAS;
TRUNCATE TABLE RUTINAS;
TRUNCATE TABLE PAGOS;
TRUNCATE TABLE STAFF;
TRUNCATE TABLE CLIENTES;
TRUNCATE TABLE USUARIOS;
TRUNCATE TABLE ROLES;
TRUNCATE TABLE LOCALES;
TRUNCATE TABLE SALAS;
TRUNCATE TABLE EQUIPAMIENTOS;
TRUNCATE TABLE MEMBRESIAS;
TRUNCATE TABLE METODOS_PAGO;
TRUNCATE TABLE DIAS;

SET SQL_SAFE_UPDATES =1;
SET FOREIGN_KEY_CHECKS = 1;



-- ----------------------------------------------------------------------------
-- ------------------------ CARGA DE DATOS DE TABLAS --------------------------
-- ----------------------------------------------------------------------------

-- CARGA DE USUARIOS
INSERT INTO USUARIOS (CI, Nombre, Apellido, Telefono, Fecha_nacimiento) VALUES
-- Empleados Local 1
('44332211', 'Marcos', 'Texeira', '099441122', '1985-04-10'),
('50099887', 'Luciana', 'Ferreira', '098552233', '1992-09-21'), 
('32211445', 'Roberto', 'Dutra', '097663344', '1980-11-30'),
('41155667', 'Estefanía', 'Pintos', '096774455', '1995-02-14'),
('52288776', 'Alejandro', 'Varela', '095885566', '1988-07-05'),
('51234567', 'Juan', 'Pérez', '099123456', '1990-05-15'),
('42345678', 'María', 'García', '098234567', '1985-08-22'),
('33456789', 'Carlos', 'Rodríguez', '097345678', '1995-02-10'),
('54567890', 'Ana', 'Martínez', '096456789', '1988-11-30'),
('45678901', 'Luis', 'Sánchez', '095567890', '2000-01-05'), -- ID 10
('39944551', 'Rodrigo', 'Sosa', '094112233', '1993-12-12'),
('47733220', 'Natalia', 'Olivera', '093223344', '1990-05-25'),
('51166778', 'Facundo', 'Espino', '092334455', '1997-08-18'),
('36789012', 'Laura', 'López', '094678901', '1992-07-18'),
-- Empleados Local 2
('57890123', 'Diego', 'González', '093789012', '1983-04-25'),
('48901234', 'Elena', 'Fernández', '092890123', '1997-09-12'),
('39012345', 'Pablo', 'Romero', '091901234', '1991-12-01'),
('50123456', 'Sofía', 'Álvarez', '090012345', '1994-06-20'),
('40077889', 'Agustina', 'Riba', '091445566', '1994-01-30'),
('35511223', 'Gonzalo', 'Paz', '090556677', '1983-06-14'), -- ID 20
('54422334', 'Micaela', 'Duarte', '099667788', '1998-10-09'),
('42299001', 'Enzo', 'Caballero', '098778899', '1991-03-22'),
('38844332', 'Carolina', 'Guerra', '097889900', '1989-11-11'),
('41238822', 'Ricardo', 'Díaz', '099888777', '1987-03-12'),
('53321144', 'Valentina', 'Silva', '098111222', '1999-11-05'),
('39988776', 'Andrés', 'Castro', '097333444', '1993-06-25'),
('45566778', 'Camila', 'Sosa', '096555666', '1996-01-14'),
('52233445', 'Mateo', 'Pereira', '095777888', '2002-09-30'),
-- Empleados Local 3
('38877665', 'Lucía', 'Morales', '094999000', '1984-12-21'),
('47766554', 'Gabriel', 'Herrera', '093222333', '1991-05-08'), -- ID 30
('51122334', 'Florencia', 'Suárez', '092444555', '1998-07-19'),
('40011223', 'Santiago', 'Blanco', '091666777', '1989-10-02'),
('36655443', 'Martina', 'Méndez', '090888999', '1995-04-11'),
('48899001', 'Joaquín', 'Ramos', '099101112', '1990-08-27'),
('50011229', 'Victoria', 'Domínguez', '098131415', '1997-02-14'),
('35544332', 'Nicolás', 'Giménez', '097161718', '1982-11-22'),
('42233110', 'Paula', 'Acosta', '096192021', '2001-03-05'),
-- clientes
('54455667', 'Felipe', 'Ruiz', '095222324', '1994-12-09'), -- ID 38
('37788990', 'Julieta', 'Medina', '094252627', '1986-06-17'),
('46677889', 'Bruno', 'Ortega', '093282930', '1992-01-29'), -- ID 40
('52211002', 'Abril', 'Villalba', '092313233', '2003-05-20'),
('34455661', 'Ignacio', 'Cardozo', '091343536', '1980-09-13'),
('43322115', 'Delfina', 'Correa', '090373839', '1999-08-04'),
('46611223', 'Renzo', 'Fagúndez', '096112200', '2004-02-28'),
('53344556', 'Maite', 'Benítez', '095223311', '2001-05-15'),
('31122334', 'Oscar', 'Borges', '094334422', '1975-08-04'),
('48855667', 'Zoe', 'Navarro', '093445533', '1999-12-20'),
('51188990', 'Bautista', 'Cabrera', '092556644', '2005-01-10'),
('42277889', 'Tatiana', 'Russo', '091667755', '1996-09-03'),
('39911002', 'Emiliano', 'Costa', '090778866', '1982-04-19'), -- ID 50
('45511223', 'Valentino', 'Rinaldi', '099887766', '1992-03-12'),
('38899001', 'Lucía', 'Guerra', '098112233', '1987-11-25'),
('51133445', 'Joaquín', 'Méndez', '097445566', '2000-05-30'),
('42266778', 'Mariana', 'López', '096778899', '1994-08-14'),
('33355667', 'Gustavo', 'Díaz', '095001122', '1978-12-05'),
('49922334', 'Ximena', 'Rojas', '094334455', '1996-02-28'),
('52200112', 'Facundo', 'Suárez', '093667788', '2002-10-10'),
('41144556', 'Camila', 'Silva', '092990011', '1991-07-22'),
('37711223', 'Federico', 'Paz', '091223344', '1984-04-19'),
('50088776', 'Martina', 'Fernández', '090556677', '1998-01-05'), -- ID 60
('46633445', 'Bruno', 'Pereira', '099663322', '1993-09-13'),
('34499887', 'Elena', 'González', '098332211', '1981-11-11'),
('43377665', 'Renzo', 'Vargas', '097110099', '1999-06-25'),
('54411002', 'Sofía', 'Cabrera', '096447788', '2004-12-01'),
('39922110', 'Andrés', 'Morales', '095778899', '1988-03-08'),
('47755664', 'Victoria', 'Olivera', '094112244', '1995-10-17'),
('51199880', 'Enzo', 'Duarte', '093225566', '2001-02-14'),
('32244556', 'Beatriz', 'Pintos', '092558877', '1976-08-30'),
('48811009', 'Thiago', 'Sosa', '091887766', '1997-05-22'),
('40033221', 'Jazmín', 'Blanco', '099001133', '1994-11-09'); -- ID 70

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- Variables con los IDs de los roles
-- Local 1
SET @L1_Musculacion_Marcos = (SELECT Nro_usuario FROM USUARIOS WHERE CI='44332211');
SET @L1_Musculacion_Luciana = (SELECT Nro_usuario FROM USUARIOS WHERE CI='50099887');
SET @L1_Crossfit_Roberto = (SELECT Nro_usuario FROM USUARIOS WHERE CI='32211445');
SET @L1_Crossfit_Estefania = (SELECT Nro_usuario FROM USUARIOS WHERE CI='41155667');
SET @L1_Boxeo_Alejandro = (SELECT Nro_usuario FROM USUARIOS WHERE CI='52288776');
SET @L1_Boxeo_Juan = (SELECT Nro_usuario FROM USUARIOS WHERE CI='51234567');
SET @L1_Natacion_Maria = (SELECT Nro_usuario FROM USUARIOS WHERE CI='42345678');
SET @L1_Natacion_Carlos = (SELECT Nro_usuario FROM USUARIOS WHERE CI='33456789');
SET @L1_Zumba_Ana = (SELECT Nro_usuario FROM USUARIOS WHERE CI='54567890');
SET @L1_Recepcionista_Luis = (SELECT Nro_usuario FROM USUARIOS WHERE CI='45678901');
SET @L1_Recepcionista_Rodrigo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='39944551');
SET @L1_Limpieza_Natalia = (SELECT Nro_usuario FROM USUARIOS WHERE CI='47733220');
SET @L1_Nutricionista_Facundo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='51166778');
SET @L1_Gerente_Laura = (SELECT Nro_usuario FROM USUARIOS WHERE CI='36789012');
-- Local 2
SET @L2_Musculacion_Diego = (SELECT Nro_usuario FROM USUARIOS WHERE CI='57890123');
SET @L2_Musculacion_Elena = (SELECT Nro_usuario FROM USUARIOS WHERE CI='48901234');
SET @L2_Crossfit_Pablo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='39012345');
SET @L2_Crossfit_Sofia = (SELECT Nro_usuario FROM USUARIOS WHERE CI='50123456');
SET @L2_Zumba_Agustina = (SELECT Nro_usuario FROM USUARIOS WHERE CI='40077889');
SET @L2_Recepcionista_Gonzalo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='35511223');
SET @L2_Nutricionista_Micaela = (SELECT Nro_usuario FROM USUARIOS WHERE CI='54422334');
SET @L2_Limpieza_Enzo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='42299001');
SET @L2_Gerente_Carolina = (SELECT Nro_usuario FROM USUARIOS WHERE CI='38844332');
-- Local 3
SET @L3_Musculacion_Ricardo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='41238822');
SET @L3_Musculacion_Valentina = (SELECT Nro_usuario FROM USUARIOS WHERE CI='53321144');
SET @L3_Crossfit_Andres = (SELECT Nro_usuario FROM USUARIOS WHERE CI='39988776');
SET @L3_Crossfit_Camila = (SELECT Nro_usuario FROM USUARIOS WHERE CI='45566778');
SET @L3_Boxeo_Mateo = (SELECT Nro_usuario FROM USUARIOS WHERE CI='52233445');
SET @L3_Boxeo_Lucia = (SELECT Nro_usuario FROM USUARIOS WHERE CI='38877665');
SET @L3_Natacion_Gabriel = (SELECT Nro_usuario FROM USUARIOS WHERE CI='47766554');
SET @L3_Natacion_Florencia = (SELECT Nro_usuario FROM USUARIOS WHERE CI='51122334');
SET @L3_Zumba_Santiago = (SELECT Nro_usuario FROM USUARIOS WHERE CI='40011223');
SET @L3_Recepcionista_Martina = (SELECT Nro_usuario FROM USUARIOS WHERE CI='36655443');
SET @L3_Recepcionista_Joaquin = (SELECT Nro_usuario FROM USUARIOS WHERE CI='48899001');
SET @L3_Limpieza_Victoria = (SELECT Nro_usuario FROM USUARIOS WHERE CI='50011229');
SET @L3_Nutricionista_Nicolas = (SELECT Nro_usuario FROM USUARIOS WHERE CI='35544332');
SET @L3_Gerente_Paula = (SELECT Nro_usuario FROM USUARIOS WHERE CI='42233110');
-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE ROLES
INSERT INTO ROLES (Nombre, Sueldo) VALUES
('Instructor de musculación', 35000), -- ID 1
('Instructor de crossfit', 35000), -- ID 2
('Instructor de boxeo', 35000), -- ID 3
('Instructor de natación', 35000), -- ID 4
('Instructor de zumba', 27000), -- ID 5
('Recepcionista', 27000), -- ID 6
('Limpieza', 27000), -- ID 7
('Gerente', 55000), -- ID 8
('Nutricionista', 43000); -- ID 9

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE LOCALES
INSERT INTO LOCALES (calle, Esquina, Numero_puerta, Telefono) VALUES
('Bvar. Artigas', 'Rivera', '1234', '27002222'), -- Local 1 (musculacion, crossfit, boxeo, natacion y zumba)
('18 de Julio', 'Ejido', '980', '29003333'), -- Local 2 (musculacion, crossfit y zumba)
('8 de Octubre', 'Garibaldi', '2100', '24006666'); -- Local 3 (musculacion, crossfit, boxeo, natacion y zumba)

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE STAFF
INSERT INTO STAFF (Nro_staff, Fecha_contratacion, ID_rol, Nro_local) VALUES
-- LOCAL 1
(@L1_Musculacion_Marcos, '2022-02-10', 1, 1), -- Marcos (Instructor Musculación)
(@L1_Musculacion_Luciana, '2022-02-10', 1, 1), -- Luciana (Instructor Musculación)
(@L1_Crossfit_Roberto, '2022-02-10', 2, 1), -- Roberto (Instructor Crossfit)
(@L1_Crossfit_Estefania, '2022-02-10', 2, 1), -- Estefanía (Instructor Crossfit)
(@L1_Boxeo_Alejandro, '2022-02-10', 3, 1), -- Alejandro (Instructor Boxeo)
(@L1_Boxeo_Juan, '2022-02-10', 3, 1), -- Juan (Instructor Boxeo)
(@L1_Natacion_Maria, '2022-02-10', 4, 1), -- María (Instructor Natación)
(@L1_Natacion_Carlos, '2022-02-10', 4, 1), -- Carlos (Instructor Natación)
(@L1_Zumba_Ana, '2022-03-15', 5, 1), -- Ana (Instructor Zumba)
(@L1_Recepcionista_Luis, '2022-02-11', 6, 1), -- Luis (Recepcionista)
(@L1_Recepcionista_Rodrigo, '2022-02-11', 6, 1), -- Rodrigo (Recepcionista)
(@L1_Limpieza_Natalia, '2022-02-10', 7, 1), -- Natalia (Limpieza)
(@L1_Nutricionista_Facundo, '2022-02-10', 9, 1), -- Facundo (Nutricionista)
(@L1_Gerente_Laura, '2022-01-10', 8, 1), -- Laura (Gerente)
-- LOCAL 2
(@L2_Musculacion_Diego, '2023-03-05', 1, 2), -- Diego (Instructor Musculación)
(@L2_Musculacion_Elena, '2023-03-05', 1, 2), -- Elena (Instructor Musculación)
(@L2_Crossfit_Pablo, '2023-03-05', 2, 2), -- Pablo (Instructor Crossfit)
(@L2_Crossfit_Sofia, '2023-03-05', 2, 2), -- Sofía (Instructor Crossfit)
(@L2_Zumba_Agustina, '2023-03-05', 5, 2), -- Agustina (Instructor Zumba)
(@L2_Recepcionista_Gonzalo, '2023-03-05', 6, 2), -- Gonzalo (Recepcionista)
(@L2_Nutricionista_Micaela, '2023-03-05', 9, 2), -- Micaela (Nutricionista)
(@L2_Limpieza_Enzo, '2023-03-08', 7, 2), -- Enzo (Limpieza)
(@L2_Gerente_Carolina, '2023-02-10', 8, 2), -- Carolina (Gerente)
-- LOCAL 3
(@L3_Musculacion_Ricardo, '2024-08-05', 1, 3), -- Ricardo (Instructor Musculación)
(@L3_Musculacion_Valentina, '2024-08-06', 1, 3), -- Valentina (Instructor Musculación)
(@L3_Crossfit_Andres, '2024-08-06', 2, 3), -- Andrés (Instructor Crossfit)
(@L3_Crossfit_Camila, '2024-08-05', 2, 3), -- Camila (Instructor Crossfit)
(@L3_Boxeo_Mateo, '2024-08-10', 3, 3), -- Mateo (Instructor Boxeo)
(@L3_Boxeo_Lucia, '2024-08-10', 3, 3), -- Lucía (Instructor Boxeo)
(@L3_Natacion_Gabriel, '2024-08-11', 4, 3), -- Gabriel (Instructor Natación)
(@L3_Natacion_Florencia, '2024-08-11', 4, 3), -- Florencia (Instructor Natación)
(@L3_Zumba_Santiago, '2024-08-16', 5, 3), -- Santiago (Instructor Zumba)
(@L3_Recepcionista_Martina, '2024-08-07', 6, 3), -- Martina (Recepcionista)
(@L3_Recepcionista_Joaquin, '2024-08-07', 6, 3), -- Joaquín (Recepcionista)
(@L3_Limpieza_Victoria, '2024-08-07', 7, 3), -- Victoria (Limpieza)
(@L3_Nutricionista_Nicolas, '2024-08-15', 9, 3), -- Nicolás (Nutricionista)
(@L3_Gerente_Paula, '2024-07-10', 8, 3); -- Paula (Gerente)
-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE CLIENTES (Todos los que no son staff)
INSERT INTO CLIENTES (Nro_cliente, Email)
SELECT Nro_usuario, LOWER(CONCAT(Nombre, '.', Apellido, '@gmail.com'))
FROM USUARIOS
WHERE Nro_usuario NOT IN(SELECT Nro_staff FROM STAFF);
-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE SALAS
INSERT INTO SALAS (Nombre, Capacidad) VALUES
('Musculación', 100),
('Crossfit', 35),
('Boxeo', 15),
('Piscina', 40),
('Zumba', 40);
-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE EQUIPAMIENTOS
INSERT INTO EQUIPAMIENTOS (Nombre, Descripcion) VALUES
-- para musculación
('Banco Plano', 'Ajustable 3 posiciones'),
('Prensa de Piernas 45°', 'Plataforma de empuje con carga de discos'),
('Polea Alta (Lat Pulldown)', 'Sistema de cables para dorsales y tríceps'),
('Máquina de Peck Deck', 'Aperturas para pecho y deltoides posterior'),
('Extensión de Cuádriceps', 'Máquina de palanca con rodillo acolchado'),
-- para crossfit
('Kettlebell 16kg', 'Pesa rusa de hierro fundido con base plana'),
('Cajón Pliométrico 3 en 1', 'Madera reforzada con alturas 50cm, 60cm y 75cm'),
('Balón Medicinale (Wall Ball)', 'Cuero reforzado de 9kg para lanzamientos a muro'),
-- para musculacion y crossfit
('Barra Olímpica 20kg', 'Acero cromado con rodamientos para levantamiento'),
('Mancuernas', 'Par de mancuernas de hierro de diferentes pesos.'),
('Rack de Sentadillas', 'Estructura de acero con soportes ajustables'),
('Discos para barra', 'Discos de diferentes pesos para barra olimpica y maquinas'),
-- para sala de boxeo
('Saco de Boxeo 1.2m', 'Relleno de tela compactada con cadena de acero'),
('Pera de Velocidad', 'Cuero sintético con soporte giratorio rápido'),
('Escudo de Golpeo (Thai Pad)', 'Acolchado de alta densidad para entrenamiento de pateo'),
('Cuerda de Saltar Pro', 'Cable de acero recubierto con rulemanes de velocidad'),
-- para piscina 
('Tabla de Flotación', 'Goma EVA ergonómica para entrenamiento de patada'),
('Pull Buoy', 'Flotador de piernas para aislamiento de brazada'),
('Aletas de Natación Cortas', 'Silicona de alta resistencia para potencia hidrodinámica'),
-- para sala de zumba
('Step de Aeróbic Profesional', 'Plataforma antideslizante con 3 niveles de altura ajustable'),
('Bandas Elásticas de Resistencia', 'Set de bandas de látex para ejercicios de tonificación rítmica');

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE RUTINAS
INSERT INTO RUTINAS (Nombre, Notas, Nro_staff) VALUES
-- HIPERTROFIA: PRINCIPIANTE
('Hipertrofia Principiante: Empuje', '4 ejercicios, 3 series de 12-15 reps. Duración: 45 min.', @L1_Musculacion_Marcos),
('Hipertrofia Principiante: Tracción', '4 ejercicios, 3 series de 12-15 reps. Duración: 45 min.', @L1_Musculacion_Marcos),
('Hipertrofia Principiante: Piernas', '3 ejercicios, 3 series de 15 reps. Duración: 40 min.', @L1_Musculacion_Marcos),
-- HIPERTROFIA: MEDIO
('Hipertrofia Intermedia: Pecho/Espalda', '6 ejercicios, 4 series de 10-12 reps. Duración: 60 min.', @L1_Musculacion_Marcos),
('Hipertrofia Intermedia: Pierna Completa', '6 ejercicios, 4 series de 10-12 reps. Duración: 70 min.', @L1_Musculacion_Marcos),
('Hipertrofia Intermedia: Brazos/Hombros', '5 ejercicios, 4 series de 12 reps. Duración: 50 min.', @L1_Musculacion_Marcos),
-- HIPERTROFIA: AVANZADO
('Hipertrofia Avanzada: Full Body', '8 ejercicios, 4 series con fallos técnicos. Duración: 90 min.', @L2_Musculacion_Diego),
('Hipertrofia Avanzada: Énfasis Superior', '7 ejercicios, Técnicas de alta intensidad (Dropsets). Duración: 80 min.', @L2_Musculacion_Diego),
('Hipertrofia Avanzada: Énfasis Inferior', '7 ejercicios, Tiempo bajo tensión (TUT). Duración: 80 min.', @L2_Musculacion_Diego),
-- CARDIO Y RESISTENCIA
('Cardio HIIT: Intensidad Alta', 'Intervalos 1:1. 10 ciclos de alta intensidad. Duración: 20 min.', @L2_Musculacion_Elena),
('Cardio LISS: Quema de Grasa', 'Intensidad constante al 60-70% FCM. Duración: 45-60 min.', @L3_Musculacion_Valentina),
('Acondicionamiento Metabólico', 'Circuito de 6 estaciones, 3 vueltas sin descanso. Duración: 30 min.', @L3_Musculacion_Valentina),

-- BOXEO
('Boxeo: Resistencia Aeróbica', '10 rounds de 3 min con 1 de descanso. Trabajo de saco y cuerda. Duración: 45 min.', @L3_Boxeo_Mateo),
('Boxeo: Técnica y Coordinación', 'Ejercicios de sombra y desplazamientos. 8 rounds técnicos. Duración: 40 min.', @L3_Boxeo_Mateo),
('Boxeo: Potencia de Golpeo', '6 rounds de costal pesado con ráfagas de 10 segundos al 100%. Duración: 30 min.', @L1_Boxeo_Juan),
-- CROSSFIT
('Crossfit: WOD de Potencia', 'Entrenamiento basado en movimientos olímpicos y fuerza explosiva. Duración: 40 min.', @L2_Crossfit_Sofia),
('Crossfit: AMRAP Metabolic', 'Máximas vueltas posibles de circuito funcional. Duración: 35 min.', @L2_Crossfit_Sofia),
('Crossfit: EMOM Skill', 'Trabajo de técnica bajo fatiga cada minuto. Duración: 45 min.', @L2_Crossfit_Pablo),
-- PISCINA
('Piscina: Resistencia Muscular', 'Entrenamiento de volumen (800-1200 metros). Ritmo moderado. Duración: 50 min.', @L1_Natacion_Carlos),
('Piscina: Velocidad Crítica', 'Series cortas de 25m y 50m con descanso completo. Duración: 40 min.', @L3_Natacion_Gabriel),
('Piscina: Técnica y Drills', 'Ejercicios de patada y recobro con accesorios. Duración: 45 min.', @L3_Natacion_Florencia),
-- PLANES DE ALIMENTACIÓN
('Alimentación: Superávit Calórico', 'Dieta hipercalórica: 5 comidas diarias con alta carga de hidratos.', @L3_Nutricionista_Nicolas),
('Alimentación: Déficit Estricto', 'Dieta hipocalórica: 4 comidas, restricción de grasas saturadas.', @L3_Nutricionista_Nicolas),
('Alimentación: Recomposición', 'Mantenimiento: Ciclo de carbohidratos según entrenamiento.', @L2_Nutricionista_Micaela),
('Alimentación: Desintoxicación', 'Plan de 7 días basado en alimentos naturales y mucha hidratación.', @L2_Nutricionista_Micaela);

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE MEMBRESIAS
INSERT INTO MEMBRESIAS (Nombre, Precio) VALUES
-- Mensuales (valor del dia * 1mes)
('Musculacion mensual', 40*31), -- ID1
('Crossfit mensual', 40*31), -- ID2
('Boxeo mensual', 40*31), -- ID3
('Natacion mensual', 40*31), -- ID4
('Zumba mensual', 25*31), -- ID5
('Full mensual', 130*31), -- ID6

-- Semestral (valor del dia * 6meses * 90%)
('Musculacion semestral', 40*31*6*0.90), -- ID7
('Crossfit semestral', 40*31*6*0.90), -- ID8
('Boxeo semestral', 40*31*6*0.90), -- ID9
('Natacion semestral', 40*31*6*0.90), -- ID10
('Zumba semestral', 25*31*6*0.90), -- ID11
('Full semestral', 130*31*6*0.90), -- ID12

-- Anual (valor del dia * 12meses * 75%)
('Musculacion anual', 40*31*12*0.75), -- ID13
('Crossfit anual', 40*31*12*0.75), -- ID14
('Boxeo anual', 40*31*12*0.75), -- ID15
('Natacion anual', 40*31*12*0.75), -- ID16
('Zumba anual', 25*31*12*0.75), -- ID17
('Full anual', 130*31*12*0.75), -- ID18

('Diario', 150); -- ID10

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE METODOS_PAGO
INSERT INTO METODOS_PAGO (Nombre_metodo) VALUES
('Efectivo'), ('Tarjeta de Débito'), ('Tarjeta de Crédito'), ('Transferencia'), ('Mercado Pago');

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE DIAS
INSERT INTO DIAS (Nombre_dia) VALUES
('Lunes'), ('Martes'), ('Miércoles'), ('Jueves'), ('Viernes'), ('Sábado'), ('Domingo');


-- -----------------------------------------------------------------------------------------
-- ------------------------ CARGA DE DATOS DE TABLAS RELACIONALES --------------------------
-- -----------------------------------------------------------------------------------------
INSERT INTO CLIENTES_MEMBRESIA (Nro_cliente, ID_membresia, Dias_acceso_disponible) VALUES
-- Clientes con membresías FULL
(38, 6, 31),    -- Felipe: Full mensual
(39, 12, 31*6),  -- Julieta: Full semestral
(40, 18, 31*12),  -- Bruno: Full anual
(41, 6, 31),    -- Abril: Full mensual
(42, 12, 31*6),  -- Ignacio: Full semestral
(43, 12, 31*6), -- Delfina: Full semestral
(44, 12, 31*6), -- Renzo: Full semestral
(45, 6, 31), -- Maite: Full mensual
-- Clientes con COMBINACIONES (Tienen 2 o más membresías)
(46, 1, 31), (46, 15, 31*12),    -- Oscar: Musculación mensual + Boxeo anual
(47, 1, 31), (47, 15, 31*12),    -- Zoe: Musculación mensual + Boxeo anual
(48, 7, 31*6), (48, 9, 31*6),    -- Bautista: Musculación semestral + Boxeo semestral
(49, 8, 31*6), (49, 16, 31*12),  -- Tatiana: Crossfit semestral + natacion anual
(50, 8, 31*6), (50, 16, 31*12),  -- Emiliano: Crossfit semestral + natacion anual
(51, 8, 31*6), (51, 16, 31*12),  -- Valentino: Crossfit semestral + natacion anual
(52, 14, 31*12), (52, 9, 31*6),  -- Lucía Guerra: Crossfit anual + Boxeo semestral  
(53, 14, 31*12), (53, 16, 31*12), -- Joaquín Méndez: Crossfit anual + natacion anual
-- Clientes de BOXEO
(54, 3, 31),    -- Mariana: Mensual
(55, 9, 31*6),   -- Gustavo: Semestral
(56, 15, 31*12),  -- Ximena: Anual
-- Clientes de NATACIÓN
(57, 4, 31),    -- Facundo Suárez: Mensual
(58, 10, 31*6),  -- Camila Silva: Semestral
(59, 16, 31*12),  -- Federico: Anual
-- Clientes de ZUMBA
(60, 5, 31),    -- Martina Fernández: Mensual
(61, 11, 31*6),  -- Bruno Pereira: Semestral
(62, 17, 31*12),  -- Elena González: Anual
-- Clientes de MUSCULACIÓN (Solo una disciplina)
(63, 1, 31),    -- Renzo Vargas: Musculación mensual
(64, 1, 31),    -- Sofía Cabrera: Musculación mensual
(65, 1, 31),   -- Andrés Morales: Musculación mensual
(66, 13, 31*12),   -- Victoria Olivera: Musculación anual
-- Clientes de CROSSFIT
(67, 2, 31),    -- Enzo Duarte: Crossfit mensual
(68, 2, 31),   -- Beatriz: Crossfit mensual
(69, 8, 31*6),  -- Thiago: Crossfit semestral
-- Pase DIARIO
(70, 19, 1);    -- Jazmín Blanco: Pase Diario

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE PAGOS
-- para local 1
INSERT INTO PAGOS (Fecha, Hora, Monto_Total, Metodo_Pago, Nro_cliente, Nro_local) 
SELECT 
    '2026-03-01' AS Fecha,
    '10:00:00' AS Hora,
    (
        SELECT SUM(memb.Precio) 
        FROM MEMBRESIAS memb
        JOIN CLIENTES_MEMBRESIA cli_memb ON memb.ID = cli_memb.ID_membresia
        WHERE cli_memb.Nro_cliente = cli.Nro_cliente
    ) AS Monto_Total,
    1 AS Metodo_Pago,
    cli.Nro_cliente, 
    1 AS Nro_local
FROM CLIENTES cli
WHERE cli.Nro_cliente BETWEEN 38 AND 50;
-- para local 2
INSERT INTO PAGOS (Fecha, Hora, Monto_Total, Metodo_Pago, Nro_cliente, Nro_local) 
SELECT 
    '2026-03-06' AS Fecha,
    '10:00:00' AS Hora,
    (
        SELECT SUM(memb.Precio) 
        FROM MEMBRESIAS memb
        JOIN CLIENTES_MEMBRESIA cli_memb ON memb.ID = cli_memb.ID_membresia
        WHERE cli_memb.Nro_cliente = cli.Nro_cliente
    ) AS Monto_Total,
    3 AS Metodo_Pago,
    cli.Nro_cliente, 
    2 AS Nro_local
FROM CLIENTES cli
WHERE cli.Nro_cliente BETWEEN 51 AND 60;
-- para local 3
INSERT INTO PAGOS (Fecha, Hora, Monto_Total, Metodo_Pago, Nro_cliente, Nro_local) 
SELECT 
    '2026-02-04' AS Fecha,
    '10:00:00' AS Hora,
    (
        SELECT SUM(memb.Precio) 
        FROM MEMBRESIAS memb
        JOIN CLIENTES_MEMBRESIA cli_memb ON memb.ID = cli_memb.ID_membresia
        WHERE cli_memb.Nro_cliente = cli.Nro_cliente
    ) AS Monto_Total,
    4 AS Metodo_Pago,
    cli.Nro_cliente, 
    3 AS Nro_local
FROM CLIENTES cli
WHERE cli.Nro_cliente BETWEEN 61 AND 70;

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE PAGOS_MEMBRESIA
INSERT INTO PAGOS_MEMBRESIA (Nro_pago, ID_membresia)
SELECT p.Nro_ticket, cm.ID_membresia 
FROM PAGOS p 
join CLIENTES_MEMBRESIA cm on p.Nro_cliente = cm.Nro_cliente;

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE SALAS_MEMBRESIA
INSERT INTO SALAS_MEMBRESIAS (ID_sala, ID_membresia) VALUES
-- Musculación ID 1
(1,1),
(1,6),
(1,7),
(1,12),
(1,13),
(1,18),
(1,19),
-- Crossfit ID 2
(2, 2),
(2, 6),
(2, 8),
(2,12),
(2,14),
(2,18),
(2,19),
-- Boxeo ID 3
(3, 3),
(3, 6),
(3, 9),
(3,12),
(3,15),
(3,18),
(3,19),
-- Piscina ID 4
(4, 4),
(4, 6),
(4, 10),
(4,12),
(4,16),
(4,18),
(4,19),
-- Zumba ID 5
(5, 5),
(5, 6),
(5, 11),
(5,12),
(5,17),
(5,18),
(5,19);

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE SALAS_EQUIPAMIENTOS
INSERT INTO SALAS_EQUIPAMIENTOS (ID_sala, Nro_equipamiento) VALUES
-- Musculación ID 1
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 20),
(1, 21),
-- Crossfit ID 2
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 20),
(2, 21),
-- Boxeo ID 3
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 20),
(3, 21),
-- Piscina ID 4
(4, 17),
(4, 18),
(4, 19),
-- Zumba ID 5
(5, 20),
(5, 21);

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE MEMBRESIAS_PERMITEN_LOCALES
-- local 1 : Todas las membresias me permiten acceder al local 1
INSERT INTO MEMBRESIAS_PERMITEN_LOCALES (Nro_local, ID_membresia) 
SELECT  1 as Nro_local, ID as ID_membresia 
FROM MEMBRESIAS;

-- Local 2: solo membresias que no sean antacion y boxeo
INSERT INTO MEMBRESIAS_PERMITEN_LOCALES (Nro_local, ID_membresia) 
SELECT  2 as Nro_local, ID as ID_membresia 
FROM MEMBRESIAS
WHERE Nombre NOT LIKE '%Boxeo%' AND Nombre NOT LIKE '%Natacion%';

-- local 3 : Todas las membresias me permiten acceder al local 3
INSERT INTO MEMBRESIAS_PERMITEN_LOCALES (Nro_local, ID_membresia) 
SELECT  3 as Nro_local, ID as ID_membresia 
FROM MEMBRESIAS;

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE LOCALES_OFRECEN_MEMBRESIAS
-- Local 1: ofrece todas las membresias
INSERT INTO LOCALES_OFRECEN_MEMBRESIAS (Nro_local, ID_membresia)
SELECT  1 as Nro_local, ID as ID_membresia 
FROM MEMBRESIAS;

-- Local 2: ofrece solo membresias que no sean antacion y boxeo
INSERT INTO LOCALES_OFRECEN_MEMBRESIAS (Nro_local, ID_membresia)
SELECT  2 as Nro_local, ID as ID_membresia 
FROM MEMBRESIAS
WHERE Nombre NOT LIKE '%Boxeo%' AND Nombre NOT LIKE '%Natacion%';

-- Local 3: ofrece todas las membresias
INSERT INTO LOCALES_OFRECEN_MEMBRESIAS (Nro_local, ID_membresia)
SELECT  3 as Nro_local, ID as ID_membresia 
FROM MEMBRESIAS;

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE LOCALES_SALAS
INSERT INTO LOCALES_SALAS (Nro_local, ID_sala) VALUES
-- Local 1
(1,1), (1,2), (1,3), (1,4), (1,5),
-- Local 2
(2,1), (2,2), (2,5),
-- Local 3
(3,1), (3,2), (3,3), (3,4), (3,5);
-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE EQUIPAMIENTOS_RUTINAS
INSERT INTO EQUIPAMIENTOS_RUTINAS (ID_rutina, Nro_equipamiento) VALUES
-- Hipertrofia Principiante: Empuje (Pecho/Tríceps)
(1, 1), (1, 10), (1, 12),
-- Hipertrofia Principiante: Tracción (Espalda/Bíceps)
(2, 3), (2, 10), (2, 12),
-- Hipertrofia Principiante: Piernas
(3, 5), (3, 2), (3, 12),
-- Hipertrofia Intermedia: Pecho/Espalda
(4, 1), (4, 3), (4, 4), (4, 9), (4, 12),
-- Hipertrofia Intermedia: Pierna Completa
(5, 2), (5, 5), (5, 11), (5, 12),
-- Hipertrofia Intermedia: Brazos/Hombros
(6, 3), (6, 10), (6, 12),
-- Hipertrofia Avanzada: Full Body
(7, 1), (7, 2), (7, 3), (7, 9), (7, 11), (7, 12),
-- Hipertrofia Avanzada: Énfasis Superior
(8, 1), (8, 4), (8, 9), (8, 10), (8, 12),
-- Hipertrofia Avanzada: Énfasis Inferior
(9, 2), (9, 5), (9, 11), (9, 12),
-- Cardio HIIT
(10, 7), (10, 16), (10, 20),
-- Cardio LISS
(11, 16), (11, 20),
-- Acondicionamiento Metabólico
(12, 6), (12, 7), (12, 8), (12, 16), (12, 21),
-- Boxeo: Resistencia Aeróbica
(13, 13), (13, 16),
-- Boxeo: Técnica y Coordinación
(14, 14), (14, 16),
-- Boxeo: Potencia de Golpeo
(15, 13), (15, 15),
-- Crossfit: WOD de Potencia
(16, 9), (16, 11), (16, 12),
-- Crossfit: AMRAP Metabolic
(17, 6), (17, 7), (17, 8),
-- Crossfit: EMOM Skill
(18, 6), (18, 9), (18, 11),
-- Piscina: Resistencia Muscular
(19, 18),
-- Piscina: Velocidad Crítica
(20, 19),
-- Piscina: Técnica y Drills
(21, 17), (21, 18), (21, 19);

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE DIAS_TRABAJO_STAFF
INSERT INTO DIAS_TRABAJO_STAFF (Nro_dia, Nro_staff, Hora_entrada, Horario_salida) VALUES
-- STAFF LOCAL 1
(1, @L1_Musculacion_Marcos, '06:00:00', '14:00:00'), (2, @L1_Musculacion_Marcos, '06:00:00', '14:00:00'), (3, @L1_Musculacion_Marcos, '06:00:00', '14:00:00'), 
(4, @L1_Musculacion_Marcos, '06:00:00', '14:00:00'), (5, @L1_Musculacion_Marcos, '06:00:00', '14:00:00'), (6, @L1_Musculacion_Marcos, '07:00:00', '13:00:00'),
--
(1, @L1_Musculacion_Luciana, '15:00:00', '23:00:00'), (2, @L1_Musculacion_Luciana, '15:00:00', '23:00:00'), (3, @L1_Musculacion_Luciana, '15:00:00', '23:00:00'), 
(4, @L1_Musculacion_Luciana, '15:00:00', '23:00:00'), (5, @L1_Musculacion_Luciana, '15:00:00', '23:00:00'), (6, @L1_Musculacion_Luciana, '07:00:00', '13:00:00'),
--
(1, @L1_Crossfit_Roberto, '06:00:00', '14:00:00'), (3, @L1_Crossfit_Roberto, '06:00:00', '14:00:00'), (5, @L1_Crossfit_Roberto, '06:00:00', '14:00:00'),
--
(2, @L1_Crossfit_Estefania, '15:00:00', '23:00:00'), (4, @L1_Crossfit_Estefania, '15:00:00', '23:00:00'), (6, @L1_Crossfit_Estefania, '08:00:00', '13:00:00'),
--
(1, @L1_Boxeo_Alejandro, '18:00:00', '22:00:00'), (3, @L1_Boxeo_Alejandro, '18:00:00', '22:00:00'), (5, @L1_Boxeo_Alejandro, '18:00:00', '22:00:00'),
--
(2, @L1_Boxeo_Juan, '08:00:00', '12:00:00'), (4, @L1_Boxeo_Juan, '08:00:00', '12:00:00'), (6, @L1_Boxeo_Juan, '09:00:00', '13:00:00'),
--
(1, @L1_Natacion_Maria, '07:00:00', '13:00:00'), (3, @L1_Natacion_Maria, '07:00:00', '13:00:00'), (5, @L1_Natacion_Maria, '07:00:00', '13:00:00'),
--
(2, @L1_Natacion_Carlos, '15:00:00', '21:00:00'), (4, @L1_Natacion_Carlos, '15:00:00', '21:00:00'), (6, @L1_Natacion_Carlos, '08:00:00', '12:00:00'),
--
(1, @L1_Zumba_Ana, '18:00:00', '20:00:00'), (3, @L1_Zumba_Ana, '18:00:00', '20:00:00'), (5, @L1_Zumba_Ana, '18:00:00', '20:00:00'),
--
(1, @L1_Recepcionista_Luis, '06:00:00', '14:00:00'), (2, @L1_Recepcionista_Luis, '06:00:00', '14:00:00'), (3, @L1_Recepcionista_Luis, '06:00:00', '14:00:00'), 
(4, @L1_Recepcionista_Luis, '06:00:00', '14:00:00'), (5, @L1_Recepcionista_Luis, '06:00:00', '14:00:00'), (6, @L1_Recepcionista_Luis, '07:00:00', '13:00:00'),
--
(1, @L1_Recepcionista_Rodrigo, '15:00:00', '23:00:00'), (2, @L1_Recepcionista_Rodrigo, '15:00:00', '23:00:00'), (3, @L1_Recepcionista_Rodrigo, '15:00:00', '23:00:00'), 
(4, @L1_Recepcionista_Rodrigo, '15:00:00', '23:00:00'), (5, @L1_Recepcionista_Rodrigo, '15:00:00', '23:00:00'),
--
(1, @L1_Limpieza_Natalia, '06:00:00', '14:00:00'), (2, @L1_Limpieza_Natalia, '06:00:00', '14:00:00'), (3, @L1_Limpieza_Natalia, '06:00:00', '14:00:00'), 
(4, @L1_Limpieza_Natalia, '06:00:00', '14:00:00'), (5, @L1_Limpieza_Natalia, '06:00:00', '14:00:00'), (6, @L1_Limpieza_Natalia, '06:00:00', '11:00:00'),
--
(2, @L1_Nutricionista_Facundo, '09:00:00', '17:00:00'), (4, @L1_Nutricionista_Facundo, '09:00:00', '17:00:00'),
--
(1, @L1_Gerente_Laura, '09:00:00', '17:00:00'), (2, @L1_Gerente_Laura, '09:00:00', '17:00:00'), (3, @L1_Gerente_Laura, '09:00:00', '17:00:00'), 
(4, @L1_Gerente_Laura, '09:00:00', '17:00:00'), (5, @L1_Gerente_Laura, '09:00:00', '17:00:00'), (6, @L1_Gerente_Laura, '08:00:00', '12:00:00'),

-- STAFF LOCAL 2
(1, @L2_Musculacion_Diego, '06:00:00', '14:00:00'), (2, @L2_Musculacion_Diego, '06:00:00', '14:00:00'), (3, @L2_Musculacion_Diego, '06:00:00', '14:00:00'), 
(4, @L2_Musculacion_Diego, '06:00:00', '14:00:00'), (5, @L2_Musculacion_Diego, '06:00:00', '14:00:00'),
--
(1, @L2_Musculacion_Elena, '15:00:00', '23:00:00'), (2, @L2_Musculacion_Elena, '15:00:00', '23:00:00'), (3, @L2_Musculacion_Elena, '15:00:00', '23:00:00'), 
(4, @L2_Musculacion_Elena, '15:00:00', '23:00:00'), (5, @L2_Musculacion_Elena, '15:00:00', '23:00:00'), (6, @L2_Musculacion_Elena, '07:00:00', '13:00:00'),
--
(1, @L2_Crossfit_Pablo, '07:00:00', '13:00:00'), (3, @L2_Crossfit_Pablo, '07:00:00', '13:00:00'), (5, @L2_Crossfit_Pablo, '07:00:00', '13:00:00'),
--
(2, @L2_Crossfit_Sofia, '16:00:00', '22:00:00'), (4, @L2_Crossfit_Sofia, '16:00:00', '22:00:00'), (6, @L2_Crossfit_Sofia, '08:00:00', '13:00:00'),
--
(1, @L2_Zumba_Agustina, '18:00:00', '20:00:00'), (3, @L2_Zumba_Agustina, '18:00:00', '20:00:00'), (5, @L2_Zumba_Agustina, '18:00:00', '20:00:00'),
--
(1, @L2_Recepcionista_Gonzalo, '08:00:00', '16:00:00'), (2, @L2_Recepcionista_Gonzalo, '08:00:00', '16:00:00'), (3, @L2_Recepcionista_Gonzalo, '08:00:00', '16:00:00'), 
(4, @L2_Recepcionista_Gonzalo, '08:00:00', '16:00:00'), (5, @L2_Recepcionista_Gonzalo, '08:00:00', '16:00:00'), (6, @L2_Recepcionista_Gonzalo, '07:00:00', '13:00:00'),
--
(1, @L2_Nutricionista_Micaela, '10:00:00', '18:00:00'), (3, @L2_Nutricionista_Micaela, '10:00:00', '18:00:00'),
--
(1, @L2_Limpieza_Enzo, '06:00:00', '14:00:00'), (2, @L2_Limpieza_Enzo, '06:00:00', '14:00:00'), (3, @L2_Limpieza_Enzo, '06:00:00', '14:00:00'), 
(4, @L2_Limpieza_Enzo, '06:00:00', '14:00:00'), (5, @L2_Limpieza_Enzo, '06:00:00', '14:00:00'), (6, @L2_Limpieza_Enzo, '06:00:00', '12:00:00'),
--
(1, @L2_Gerente_Carolina, '09:00:00', '17:00:00'), (2, @L2_Gerente_Carolina, '09:00:00', '17:00:00'), (3, @L2_Gerente_Carolina, '09:00:00', '17:00:00'), 
(4, @L2_Gerente_Carolina, '09:00:00', '17:00:00'), (5, @L2_Gerente_Carolina, '09:00:00', '17:00:00'),

-- STAFF LOCAL 3
(1, @L3_Musculacion_Ricardo, '06:00:00', '14:00:00'), (2, @L3_Musculacion_Ricardo, '06:00:00', '14:00:00'), (3, @L3_Musculacion_Ricardo, '06:00:00', '14:00:00'), 
(4, @L3_Musculacion_Ricardo, '06:00:00', '14:00:00'), (5, @L3_Musculacion_Ricardo, '06:00:00', '14:00:00'),
--
(1, @L3_Musculacion_Valentina, '15:00:00', '23:00:00'), (2, @L3_Musculacion_Valentina, '15:00:00', '23:00:00'), (3, @L3_Musculacion_Valentina, '15:00:00', '23:00:00'), 
(4, @L3_Musculacion_Valentina, '15:00:00', '23:00:00'), (5, @L3_Musculacion_Valentina, '15:00:00', '23:00:00'), (6, @L3_Musculacion_Valentina, '07:00:00', '13:00:00'),
--
(1, @L3_Crossfit_Andres, '06:00:00', '12:00:00'), (3, @L3_Crossfit_Andres, '06:00:00', '12:00:00'), (5, @L3_Crossfit_Andres, '06:00:00', '12:00:00'),
--
(2, @L3_Crossfit_Camila, '16:00:00', '22:00:00'), (4, @L3_Crossfit_Camila, '16:00:00', '22:00:00'), (6, @L3_Crossfit_Camila, '08:00:00', '13:00:00'),
--
(1, @L3_Boxeo_Mateo, '15:00:00', '19:00:00'), (3, @L3_Boxeo_Mateo, '15:00:00', '19:00:00'), (5, @L3_Boxeo_Mateo, '15:00:00', '19:00:00'),
--
(2, @L3_Boxeo_Lucia, '19:00:00', '23:00:00'), (4, @L3_Boxeo_Lucia, '19:00:00', '23:00:00'),
--
(1, @L3_Natacion_Gabriel, '06:00:00', '12:00:00'), (3, @L3_Natacion_Gabriel, '06:00:00', '12:00:00'), (5, @L3_Natacion_Gabriel, '06:00:00', '12:00:00'),
--
(2, @L3_Natacion_Florencia, '14:00:00', '20:00:00'), (4, @L3_Natacion_Florencia, '14:00:00', '20:00:00'), (6, @L3_Natacion_Florencia, '08:00:00', '12:00:00'),
--
(2, @L3_Zumba_Santiago, '19:00:00', '21:00:00'), (4, @L3_Zumba_Santiago, '19:00:00', '21:00:00'), (5, @L3_Zumba_Santiago, '19:00:00', '21:00:00'),
--
(1, @L3_Recepcionista_Martina, '06:00:00', '14:00:00'), (2, @L3_Recepcionista_Martina, '06:00:00', '14:00:00'), (3, @L3_Recepcionista_Martina, '06:00:00', '14:00:00'), 
(4, @L3_Recepcionista_Martina, '06:00:00', '14:00:00'), (5, @L3_Recepcionista_Martina, '06:00:00', '14:00:00'),
--
(1, @L3_Recepcionista_Joaquin, '15:00:00', '23:00:00'), (2, @L3_Recepcionista_Joaquin, '15:00:00', '23:00:00'), (3, @L3_Recepcionista_Joaquin, '15:00:00', '23:00:00'), 
(4, @L3_Recepcionista_Joaquin, '15:00:00', '23:00:00'), (5, @L3_Recepcionista_Joaquin, '15:00:00', '23:00:00'), (6, @L3_Recepcionista_Joaquin, '07:00:00', '13:00:00'),
--
(1, @L3_Limpieza_Victoria, '06:00:00', '14:00:00'), (2, @L3_Limpieza_Victoria, '06:00:00', '14:00:00'), (3, @L3_Limpieza_Victoria, '06:00:00', '14:00:00'), 
(4, @L3_Limpieza_Victoria, '06:00:00', '14:00:00'), (5, @L3_Limpieza_Victoria, '06:00:00', '14:00:00'), (6, @L3_Limpieza_Victoria, '07:00:00', '13:00:00'),
--
(1, @L3_Nutricionista_Nicolas, '09:00:00', '17:00:00'), (3, @L3_Nutricionista_Nicolas, '09:00:00', '17:00:00'), (5, @L3_Nutricionista_Nicolas, '09:00:00', '17:00:00'),
--
(1, @L3_Gerente_Paula, '08:00:00', '16:00:00'), (2, @L3_Gerente_Paula, '08:00:00', '16:00:00'), (3, @L3_Gerente_Paula, '08:00:00', '16:00:00'), 
(4, @L3_Gerente_Paula, '08:00:00', '16:00:00'), (5, @L3_Gerente_Paula, '08:00:00', '16:00:00');

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE DIAS_LOCALES
INSERT INTO DIAS_LOCALES (Nro_dia, Nro_local, Hora_apertura, Hora_cierre) VALUES
-- Local 1
(1,1, '06:00:00', '23:00:00'), 
(2,1, '06:00:00', '23:00:00'), 
(3,1, '06:00:00', '23:00:00'), 
(4,1, '06:00:00', '23:00:00'), 
(5,1, '06:00:00', '23:00:00'),
(6,1, '06:00:00', '13:00:00'),
-- Local 2
(1,2, '06:00:00', '23:00:00'), 
(2,2, '06:00:00', '23:00:00'), 
(3,2, '06:00:00', '23:00:00'), 
(4,2, '06:00:00', '23:00:00'), 
(5,2, '06:00:00', '23:00:00'),
(6,2, '06:00:00', '13:00:00'),
-- Local 3
(1,3, '06:00:00', '23:00:00'), 
(2,3, '06:00:00', '23:00:00'), 
(3,3, '06:00:00', '23:00:00'), 
(4,3, '06:00:00', '23:00:00'), 
(5,3, '06:00:00', '23:00:00'),
(6,3, '06:00:00', '13:00:00');

-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE CLIENTES_RUTINAS
INSERT INTO CLIENTES_RUTINAS (Nro_cliente, ID_rutina) VALUES
-- Clientes (Acceso a todo)
(38, 1),(38, 2),(38, 3),(38, 22), 
(39, 4),(39, 5),(39, 6),(39, 24), 
(40, 4),(40, 5),(40, 6),(40, 23), 
(41, 1),(41, 2),(41, 3),(41, 22),
(42, 7), (42, 11), 
(43, 19),          
(44, 12), (44, 23),
(45, 1),(45, 2),(45, 3),(45, 22),        
-- Clientes con COMBINACIONES
(49, 16), (49, 19),
(50, 17), (50, 20),
(52, 16), (52, 15),
(53, 17), (53, 19),
-- Clientes de BOXEO
(54, 13),          
(55, 14),          
(56, 15), (56, 23),
-- Clientes de NATACIÓN
(57, 21), (57,19),
(58, 19), 
(59, 20),          
-- Clientes de ZUMBA
(60, 11),          
(61, 12),          
(62, 10), (62, 25),
-- Clientes de MUSCULACIÓN
(63, 1),(63, 2),(63, 3),(63, 22),
(64, 1),(64, 2),(64, 3),(64, 22),
-- Clientes de CROSSFIT
(67, 16),
(68, 17); 


-- ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- CARGA DE DIAS_CLIENTES_RUTINAS
INSERT INTO DIAS_CLIENTES_RUTINAS (Nro_dia, ID_cliente_rutina) VALUES
-- ID_CLIENTE_RUTINA 1
(1, 1), (4, 1),
-- ID_CLIENTE_RUTINA 2
(2, 2), (5, 2),
-- ID_CLIENTE_RUTINA 3
(3, 3), (6, 3),
-- ID_CLIENTE_RUTINA 4
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4), (7, 4),
-- ID_CLIENTE_RUTINA 5
(1, 5), (4, 5),
-- ID_CLIENTE_RUTINA 6
(2, 6), (5, 6),
-- ID_CLIENTE_RUTINA 7
(3, 7), (6, 7),
-- ID_CLIENTE_RUTINA 8
(1, 8), (2, 8), (3, 8), (4, 8), (5, 8), (6, 8), (7, 8),
-- ID_CLIENTE_RUTINA 9
(1, 9), (4, 9),
-- ID_CLIENTE_RUTINA 10
(2, 10), (5, 10),
-- ID_CLIENTE_RUTINA 11
(3, 11), (6, 11),
-- ID_CLIENTE_RUTINA 12
(1, 12), (2, 12), (3, 12), (4, 12), (5, 12), (6, 12), (7, 12),
-- ID_CLIENTE_RUTINA 13
(1, 13), (4, 13),
-- ID_CLIENTE_RUTINA 14
(2, 14), (5, 14),
-- ID_CLIENTE_RUTINA 15
(3, 15), (6, 15),
-- ID_CLIENTE_RUTINA 16
(1, 16), (2, 16), (3, 16), (4, 16), (5, 16), (6, 16), (7, 16),
-- ID_CLIENTE_RUTINA 17
(1, 17), (3, 17), (5, 17),
-- ID_CLIENTE_RUTINA 18
(2, 18), (4, 18), (6, 18),
-- ID_CLIENTE_RUTINA 19
(1, 19), (3, 19), (5, 19),
-- ID_CLIENTE_RUTINA 20
(1, 20), (3, 20), (5, 20),
-- ID_CLIENTE_RUTINA 21
(1, 21), (2, 21), (3, 21), (4, 21), (5, 21), (6, 21), (7, 21),
-- ID_CLIENTE_RUTINA 22
(1, 22), (4, 22),
-- ID_CLIENTE_RUTINA 23
(2, 23), (5, 23),
-- ID_CLIENTE_RUTINA 24
(3, 24), (6, 24),
-- ID_CLIENTE_RUTINA 25
(1, 25), (2, 25), (3, 25), (4, 25), (5, 25), (6, 25), (7, 25),
-- ID_CLIENTE_RUTINA 26
(1, 26), (3, 26), (5, 26),
-- ID_CLIENTE_RUTINA 27
(2, 27), (4, 27), (6, 27),
-- ID_CLIENTE_RUTINA 28
(1, 28), (3, 28), (5, 28),
-- ID_CLIENTE_RUTINA 29
(2, 29), (4, 29), (6, 29),
-- ID_CLIENTE_RUTINA 30
(1, 30), (3, 30), (5, 30),
-- ID_CLIENTE_RUTINA 31
(2, 31), (4, 31), (6, 31),
-- ID_CLIENTE_RUTINA 32
(1, 32), (3, 32), (5, 32),
-- ID_CLIENTE_RUTINA 33
(2, 33), (4, 33), (6, 33),
-- ID_CLIENTE_RUTINA 34
(1, 34), (3, 34), (5, 34),
-- ID_CLIENTE_RUTINA 35
(2, 35), (4, 35), (6, 35),
-- ID_CLIENTE_RUTINA 36
(1, 36), (3, 36), (5, 36),
-- ID_CLIENTE_RUTINA 37
(1, 37), (2, 37), (3, 37), (4, 37), (5, 37), (6, 37), (7, 37),
-- ID_CLIENTE_RUTINA 38
(1, 38), (3, 38), (5, 38),
-- ID_CLIENTE_RUTINA 39
(2, 39), (4, 39),
-- ID_CLIENTE_RUTINA 40
(1, 40), (3, 40), (5, 40),
-- ID_CLIENTE_RUTINA 41
(2, 41), (4, 41), (6, 41),
-- ID_CLIENTE_RUTINA 42
(1, 42), (3, 42), (5, 42),
-- ID_CLIENTE_RUTINA 43
(2, 43), (4, 43), (6, 43),
-- ID_CLIENTE_RUTINA 44
(1, 44), (3, 44), (5, 44),
-- ID_CLIENTE_RUTINA 45
(1, 45), (2, 45), (3, 45), (4, 45), (5, 45), (6, 45), (7, 45),
-- ID_CLIENTE_RUTINA 46
(1, 46), (4, 46),
-- ID_CLIENTE_RUTINA 47
(2, 47), (5, 47),
-- ID_CLIENTE_RUTINA 48
(3, 48), (6, 48),
-- ID_CLIENTE_RUTINA 49
(1, 49), (2, 49), (3, 49), (4, 49), (5, 49), (6, 49), (7, 49),
-- ID_CLIENTE_RUTINA 50
(1, 50), (4, 50),
-- ID_CLIENTE_RUTINA 51
(2, 51), (5, 51),
-- ID_CLIENTE_RUTINA 52
(3, 52), (6, 52),
-- ID_CLIENTE_RUTINA 53
(1, 53), (2, 53), (3, 53), (4, 53), (5, 53), (6, 53), (7, 53),
-- ID_CLIENTE_RUTINA 54
(1, 54), (3, 54), (5, 54),
-- ID_CLIENTE_RUTINA 55
(2, 55), (4, 55), (6, 55);
