-- Insercion de Generaciones por sentencias
INSERT INTO generacion (numero, region, anio_lanzamiento) VALUES 
(1, 'Kanto', 1996), (2, 'Johto', 1999);

-- Insercion de Tipos por sentencias
INSERT INTO tipo (nombre) VALUES 
('Electrico'), ('Planta'), ('Fuego'), ('Agua'), ('Bicho'), ('Veneno'), ('Volador'), ('Dragon'), ('Hielo'), ('Normal'), ('Fantasma'), ('Psiquico');

-- Insercion de Habilidades por sentencias 
INSERT INTO habilidad (nombre, descripcion) VALUES 
('Electricidad estática', 'Puede paralizar al contacto'),
('Espesura', 'Potencia movimientos de tipo Planta cuando tiene poca salud'),
('Clorofila', 'Aumenta la velocidad bajo sol intenso'),
('Pararrayos', 'Atrae ataques eléctricos'),
('Mar Llamas', 'Potencia movimientos tipo fuego en apuros'),
('Torrente', 'Potencia movimientos tipo agua en apuros');


-- Insercion de Pokemon por serntencias
INSERT INTO pokemon (nombre, altura, peso, nivel_evolucion, fk_generacion_id) VALUES
('Pikachu', 0.40, 6, 2, 1),
('Bulbasaur', 0.70, 7, 1, 1), ('Ivysaur', 1.00, 13, 2, 1), ('Venusaur', 2.00, 100, 3, 1),
('Charmander', 0.60, 8, 1, 1), ('Charmeleon', 1.10, 19, 2, 1), ('Charizard', 1.70, 90, 3, 1),
('Squirtle', 0.50, 9, 1, 1), ('Wartortle', 1.00, 22, 2, 1), ('Blastoise', 1.60, 85, 3, 1);

-- Relaciones nuevos registros Pokemon <-> Tipo
INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t
WHERE p.nombre = 'Pikachu' AND t.nombre = 'Electrico';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t
WHERE p.nombre IN ('Bulbasaur', 'Ivysaur', 'Venusaur') AND t.nombre = 'Planta';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t 
WHERE p.nombre IN ('Charmander', 'Charmeleon', 'Charizard') AND t.nombre = 'Fuego';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t 
WHERE p.nombre IN ('Squirtle', 'Wartortle', 'Blastoise') AND t.nombre = 'Agua';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t 
WHERE p.nombre IN ('Ivysaur', 'Venusaur') AND t.nombre = 'Veneno';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t 
WHERE p.nombre = 'Charizard' AND t.nombre = 'Volador';


-- Relaciones nuevos registros Pokemon <-> Habilidad
INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id FROM pokemon p, habilidad h
WHERE p.nombre = 'Pikachu' AND h.nombre = 'Electricidad estática';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id FROM pokemon p, tipo t
WHERE p.nombre = 'Pikachu' AND t.nombre = 'Pararrayos';

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id FROM pokemon p, habilidad h
WHERE p.nombre IN ('Bulbasaur', 'Ivysaur', 'Venusaur') AND h.nombre = 'Clorofila';

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id FROM pokemon p, habilidad h
WHERE p.nombre IN ('Bulbasaur', 'Ivysaur', 'Venusaur') AND h.nombre = 'Espesura';

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id FROM pokemon p, habilidad h
WHERE p.nombre IN ('Charmander', 'Charmeleon', 'Charizard') AND h.nombre = 'Mar Llamas';

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id FROM pokemon p, habilidad h
WHERE p.nombre IN ('Squirtle', 'Wartortle', 'Blastoise') AND h.nombre = 'Torrente';