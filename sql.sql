-- Active: 1709057024495@@bvx4jdsoc1mozxryzzns-mysql.services.clever-cloud.com@3306@bvx4jdsoc1mozxryzzns
SHOW DATABASES

/*EJEMPLOS DE VIEWS*/

/*1. CREAR UNA VISTA */
CREATE VIEW users_view AS
SELECT nombres, apellidos, edad, genero
FROM users

SELECT * FROM users_view;

/*2. CREAR UNA VISTA QUE SUME LAS EDADES*/
CREATE VIEW users_edad AS
SELECT SUM(edad), id
FROM users
GROUP BY
    id
ORDER BY id DESC

SELECT * from users_edad

/*3 CREAR UNA VISTA QUE MUESTRE LA INFO INDICADA*/
CREATE VIEW users_resumen AS
SELECT nombres, edad, correo
FROM users

SELECT * FROM users_resumen
/*4 EDITAR UNA VISTA*/

CREATE OR REPLACE VIEW users_view AS
SELECT
    nombres,
    apellidos,
    edad,
    genero,
    musica
FROM users

/*5 ELIMINAR UNA VISTA*/

DROP VIEW users_resumen;

/*EJEMPLOS DE PROCEDIMIENTOS ALMACENADOS*/

/*1*/
DELIMITER $$

CREATE PROCEDURE obtener_edad_deun_estado(IN pais_usuario 
VARCHAR(255)) 
BEGIN 
	SELECT nombres, edad FROM users WHERE pais = pais_usuario;
END$$ 

DELIMITER;

CALL obtener_edad_deun_estado ('colombia')

/*2*/

SELECT * FROM users 

DELIMITER //
CREATE PROCEDURE actualizar_nombre (IN nombre_usuario 
VARCHAR(255),IN id_usuario INT(10)) 
BEGIN 
	UPDATE users SET nombres = nombre_usuario WHERE id = id_usuario;
END//
DELIMITER;

CALL actualizar_nombre ('Angelica', 2)

/*3*/
DELIMITER //
CREATE PROCEDURE eliminar_usuario (IN id_usuario INT(10)) 
BEGIN 
	DELETE FROM users WHERE id = id_usuario;
END//
DELIMITER;

CALL eliminar_usuario (3)

/*4*/

DELIMITER //

CREATE PROCEDURE nuevo_usuario(
IN nombre_usuario VARCHAR(45),
IN apellido_usuario VARCHAR(45),
IN correo_usuario VARCHAR(255),
IN edad_usuario INT,
IN pais_usuario VARCHAR(45),
IN genero_usuario VARCHAR(25),
IN musica_usuario VARCHAR(25))
BEGIN 
    INSERT INTO users (nombres, apellidos, correo, edad, genero, pais, musica )
    VALUES (nombre_usuario, apellido_usuario, correo_usuario, edad_usuario, genero_usuario, pais_usuario, musica_usuario);
END // 

CALL nuevo_usuario ('Sebastian', 'Hernandez Gil','sebs@gmail.com', 30, 'H', 'Colombia','bachata')

DELIMITER ;

SELECT * FROM users ORDER BY id DESC


/*5*/
DELIMITER //
CREATE PROCEDURE actualizar_edad (IN edad_usuario INT,
IN id_usuario INT(10)) 
BEGIN 
	UPDATE users SET edad = edad_usuario WHERE id = id_usuario;
END//
DELIMITER;

CALL actualizar_edad (17, 2)

SELECT * FROM users









