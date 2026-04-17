-- Funcion calculadora de probabilidad de avistamiento pokemon
DROP FUNCTION IF EXISTS fn_probabilidad_avistamiento;
DELIMITER //
CREATE FUNCTION fn_probabilidad_avistamiento(p_nivel INT, p_tipo VARCHAR(20)) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE var_probabilidad DECIMAL(5,2);
    DECLARE var_multiplicador DECIMAL(5,2) DEFAULT 1.0;
    
	IF p_nivel = 1 THEN 
		SET var_probabilidad = 70.0;
	ELSEIF p_nivel = 2 THEN 
		SET var_probabilidad = 25.0;
	ELSEIF p_nivel = 3 THEN 
		SET var_probabilidad = 5.0;
	-- Para Pokemon de categoria legendaria o singulares
	ELSE 
		SET var_probabilidad = 1.0;
	END IF;

    -- Multiplicadores de rareza de acuerdo a tipo 
    IF p_tipo IN ('Dragon', 'Fantasma', 'Psiquico') THEN
        SET var_multiplicador = 0.5;
    ELSEIF p_tipo IN ('Bicho', 'Normal', 'Volador') THEN
        SET var_multiplicador = 1.2; 
    END IF;
	-- Probabilidad de avistamiento tomando en cuenta nivel evolutivo y tipo
    RETURN var_probabilidad * var_multiplicador;
END //

DELIMITER ;
