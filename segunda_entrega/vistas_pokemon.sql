-- Vistas
-- Vista con informacion agregada de Pokemon, Tipo, Habilidades y Generacion. 
-- Una version completa de la informacion del Pokemon.
DROP VIEW IF EXISTS vw_informacion_pokemon;
CREATE VIEW vw_informacion_pokemon AS
SELECT 
    p.nombre AS Pokemon,
	GROUP_CONCAT(DISTINCT t.nombre SEPARATOR ', ') AS Tipos,
    p.altura as Altura,
    p.peso as Peso,
    p.nivel_evolucion as Fase_Evolutiva,
    g.numero AS Generacion,
    g.region AS Region,
    g.anio_lanzamiento AS Lanzamiento,
    GROUP_CONCAT(DISTINCT h.nombre SEPARATOR ', ') AS Habilidades
FROM pokemon p
JOIN generacion g 
    ON p.fk_generacion_id = g.id
JOIN pokemon_tipo pt 
    ON p.id = pt.pokemon_id
JOIN tipo t 
    ON pt.tipo_id = t.id
JOIN pokemon_habilidad ph 
    ON p.id = ph.pokemon_id
JOIN habilidad h 
    ON ph.habilidad_id = h.id
GROUP BY p.id;

-- Vista con informacion de probabilidad de avistamiento de cada Pokemon.
-- Presenta informacion del Pokemon, Region y Probabilidad de Avistamiento en porcentaje. 
DROP VIEW IF EXISTS vw_avistamiento_pokemon;
CREATE VIEW vw_avistamiento_pokemon AS
SELECT 
    p.nombre AS Pokemon,
    g.region AS Region,
    CONCAT(fn_probabilidad_avistamiento(p.nivel_evolucion, (SELECT t2.nombre 
             FROM pokemon_tipo pt2 
             JOIN tipo t2 ON pt2.tipo_id = t2.id 
             WHERE pt2.pokemon_id = p.id -- <--- ¡AQUÍ ESTÁ EL TRUCO!
             LIMIT 1)
			 ), '%') AS Probabilidad_Avistamiento
FROM pokemon p
JOIN generacion g 
	ON p.fk_generacion_id = g.id
JOIN pokemon_tipo pt 
	ON p.id = pt.pokemon_id
JOIN tipo t 
	ON pt.tipo_id = t.id
GROUP BY p.id;

-- Query para llamar vista de informacion general pokemon
SELECT *
FROM vw_informacion_pokemon;

-- Query para llamar vista de probabilidad de avistamiento pokemon
SELECT *
FROM vw_avistamiento_pokemon;

