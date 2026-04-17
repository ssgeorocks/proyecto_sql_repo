DROP PROCEDURE IF EXISTS sp_registrar_habilidad;
DROP PROCEDURE IF EXISTS sp_registrar_pokemon_completo;

DELIMITER //
CREATE PROCEDURE sp_registrar_habilidad(
    IN h_nombre VARCHAR(50),
    IN h_descripcion VARCHAR(200)
)
BEGIN
    DECLARE var_hab_id INT;

    -- Comprobar si el ID de la habilidad ya existe
    SELECT id INTO var_hab_id FROM habilidad WHERE nombre = h_nombre;

    -- Logica para validar existencia
    IF var_hab_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La habilidad ya existe';
    ELSE
        -- Insercion de l habilidad
        INSERT INTO habilidad (nombre, descripcion)
        VALUES (h_nombre, h_descripcion);
        
        SELECT CONCAT('Habilidad ', h_nombre, ' registrada exitosamente con ID: ', var_hab_id) AS Resultado;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registrar_pokemon_completo(
    IN p_nombre VARCHAR(50),
    IN p_altura DECIMAL(5,2),
    IN p_peso INT,
    IN p_num_gen INT,
    IN p_tipo VARCHAR(25),
    IN p_habilidad VARCHAR(25),
    IN p_nivel INT
)
BEGIN
    DECLARE var_gen_id INT;
    DECLARE var_pokemon_id INT;
    DECLARE var_tipo_id INT;
    DECLARE var_hab_id INT;

    -- Recuperar el ID de la generacion
    SELECT id INTO var_gen_id FROM generacion WHERE numero = p_num_gen;

    -- Logica para validar existencia
    IF var_gen_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La generación no existe';
    ELSE
        -- Insercion del Pokemon
        INSERT INTO pokemon (nombre, altura, peso, nivel_evolucion, fk_generacion_id)
        VALUES (p_nombre, p_altura, p_peso, p_nivel, var_gen_id);

        -- ID del ultimo Pokemon insertado
        SET var_pokemon_id = LAST_INSERT_ID();

        -- Insercion en la tabla Pokemon <-> Tipo
        SELECT id INTO var_tipo_id FROM tipo WHERE nombre = p_tipo;
        IF var_tipo_id IS NOT NULL THEN
            INSERT INTO pokemon_tipo (pokemon_id, tipo_id) VALUES (var_pokemon_id, var_tipo_id);
        END IF;

        -- Insercion en la tabla Pokemon <-> Habilidad
        SELECT id INTO var_hab_id FROM habilidad WHERE nombre = p_habilidad;
        IF var_hab_id IS NOT NULL THEN
            INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id) VALUES (var_pokemon_id, var_hab_id);
        END IF;
        
        SELECT CONCAT('Pokémon ', p_nombre, ' registrado exitosamente con ID: ', var_pokemon_id) AS Resultado;
    END IF;
END //

DELIMITER ;

-- Procedimiento para eliminar Pokemon de la base de datos
DELIMITER //
CREATE PROCEDURE sp_eliminar_pokemon(
    IN p_nombre VARCHAR(50)
)
BEGIN
    DECLARE var_pokemon_id INT;
    
    SELECT id INTO var_pokemon_id FROM pokemon WHERE nombre = p_nombre;

    IF var_pokemon_id IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: El Pokémon no existe en la base de datos';
    ELSE
        START TRANSACTION;
		-- Elimnar de las tablas intermedias
        DELETE FROM pokemon_tipo WHERE pokemon_id = var_pokemon_id;
        DELETE FROM pokemon_habilidad WHERE pokemon_id = var_pokemon_id;
		-- Eliminar de las tabla principal
        DELETE FROM pokemon WHERE id = var_pokemon_id;
        COMMIT;

        SELECT CONCAT('Pokémon ', p_nombre, ' y registro en tablas intermedias eliminados.') AS Resultado;
    END IF;
END //
DELIMITER ;


-- Registro de habilidad con sp_registrar_habilidad
CALL sp_registrar_habilidad('Sincronia', 'Pasa problemas de estado al atacante');
CALL sp_registrar_habilidad('Foco Interno', 'Evita que el Pokemon retroceda');
CALL sp_registrar_habilidad('Robustez', 'Evita ser derrotado de un solo golpe si tiene vida al maximo');
CALL sp_registrar_habilidad('Absorbe Electricidad', 'Recupera PS al recibir un ataque electrico');
CALL sp_registrar_habilidad('Ritmo Propio', 'Evita que el Pokemon entre en estado de confusion');
CALL sp_registrar_habilidad('Polvo Escudo', 'Bloquea los efectos secundarios de los ataques recibidos');
CALL sp_registrar_habilidad('Mudar', 'Tiene una probabilidad de curar sus problemas de estado al mudar la piel');
CALL sp_registrar_habilidad('Ojo Compuesto', 'Aumenta la precision de los movimientos del Pokemon');
CALL sp_registrar_habilidad('Enjambre', 'Potencia los movimientos de tipo Bicho cuando queda poca salud');
CALL sp_registrar_habilidad('Fuga', 'Facilita la huida de combates contra Pokemon salvajes');
CALL sp_registrar_habilidad('Vista Lince', 'Evita que baje la Precision del Pokemon');
CALL sp_registrar_habilidad('Insomnio', 'Evita que el Pokemon se quede dormido');
CALL sp_registrar_habilidad('Madrugar', 'Reduce a la mitad el tiempo que pasa dormido');

-- Registro de Pokemon con sp_registrar_pokemon_completo
CALL sp_registrar_pokemon_completo('Caterpie', 0.3, 3, 1, 'Bicho', 'Polvo Escudo', 1);
CALL sp_registrar_pokemon_completo('Metapod', 0.7, 10, 1, 'Bicho', 'Mudar', 2);
CALL sp_registrar_pokemon_completo('Butterfree', 1.1, 32, 1, 'Bicho', 'Ojo Compuesto', 3);
CALL sp_registrar_pokemon_completo('Weedle', 0.3, 3, 1, 'Bicho', 'Polvo Escudo', 1);
CALL sp_registrar_pokemon_completo('Kakuna', 0.6, 10, 1, 'Bicho', 'Mudar', 2);
CALL sp_registrar_pokemon_completo('Beedrill', 1.0, 30, 1, 'Bicho', 'Enjambre', 3);
CALL sp_registrar_pokemon_completo('Chikorita', 0.9, 6, 2, 'Planta', 'Espesura', 1);
CALL sp_registrar_pokemon_completo('Bayleef', 1.2, 16, 2, 'Planta', 'Espesura', 2);
CALL sp_registrar_pokemon_completo('Meganium', 1.8, 100, 2, 'Planta', 'Espesura', 3);
CALL sp_registrar_pokemon_completo('Totodile', 0.6, 9, 2, 'Agua', 'Torrente', 1);
CALL sp_registrar_pokemon_completo('Croconaw', 1.1, 25, 2, 'Agua', 'Torrente', 2);
CALL sp_registrar_pokemon_completo('Feraligatr', 2.3, 88, 2, 'Agua', 'Torrente', 3);
CALL sp_registrar_pokemon_completo('Sentret', 0.8, 6, 2, 'Normal', 'Fuga', 1);
CALL sp_registrar_pokemon_completo('Furret', 1.8, 33, 2, 'Normal', 'Fuga', 2);
CALL sp_registrar_pokemon_completo('Hoothoot', 0.7, 21, 2, 'Normal', 'Insomnio', 1);
CALL sp_registrar_pokemon_completo('Noctowl', 1.6, 41, 2, 'Normal', 'Insomnio', 2);
CALL sp_registrar_pokemon_completo('Ledyba', 1.0, 11, 2, 'Bicho', 'Enjambre', 1);
CALL sp_registrar_pokemon_completo('Ledian', 1.4, 36, 2, 'Bicho', 'Enjambre', 2);


-- Eliminar a Pikachu de la base de datos
CALL sp_eliminar_pokemon('Pikachu');

-- Verificar que esta eliminado
SELECT * FROM pokemon WHERE nombre = 'Pikachu';
SELECT * FROM movimientos_usuarios_pokemon; -- Aquí debería aparecer el rastro del borrado