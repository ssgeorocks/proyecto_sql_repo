-- BASE DE DATOS: POKEDEX

DROP DATABASE IF EXISTS pokedex;

CREATE DATABASE IF NOT EXISTS pokedex;
USE pokedex;

-- Creacion de tabla: Generacion

CREATE TABLE generacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL UNIQUE,
    anio_lanzamiento INT NOT NULL
);

-- Creacion de tabla: Tipo

CREATE TABLE tipo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL UNIQUE
);

-- Creacion de tabla: Habilidad

CREATE TABLE habilidad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL
);

-- Creacion de tabla: Pokemon

CREATE TABLE pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    altura DECIMAL(5,2) NOT NULL,
    peso INT NOT NULL,
    fk_generacion_id INT NOT NULL,
    FOREIGN KEY (fk_generacion_id) REFERENCES generacion(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Creacion de tabla intermedia: Pokemon - Habilidad

CREATE TABLE pokemon_habilidad (
    pokemon_id INT NOT NULL,
    habilidad_id INT NOT NULL,
    PRIMARY KEY (pokemon_id, habilidad_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (habilidad_id) REFERENCES habilidad(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE pokemon_tipo (
    pokemon_id INT NOT NULL,
    tipo_id INT NOT NULL,
    PRIMARY KEY (pokemon_id, tipo_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (tipo_id) REFERENCES tipo(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- Insercion de Pikachu

INSERT INTO generacion (numero, region, anio_lanzamiento)
VALUES 	(1, 'Kanto', 1996);

INSERT INTO habilidad (nombre, descripcion)
VALUES 	('Static', 'Puede paralizar al contacto'),
		('Lightning Rod', 'Atrae ataques eléctricos');
        
INSERT INTO tipo (nombre)
VALUES 	('Electrico'),
		('Planta'),
        ('Fuego'),
        ('Agua'),
        ('Veneno');

INSERT INTO pokemon (nombre, altura, peso, fk_generacion_id)
VALUES ('Pikachu', 0.40, 6, 1);

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id
FROM pokemon p, habilidad h
WHERE p.nombre = 'Pikachu'
  AND h.nombre = 'Static';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id
FROM pokemon p, tipo t
WHERE p.nombre = 'Pikachu'
  AND t.nombre = 'Electrico';

-- Insercion de Bulbasaur

INSERT INTO habilidad (nombre, descripcion)
VALUES 	('Espesura', 'Potencia movimientos de tipo Planta cuando tiene poca salud'),
		('Clorofila', 'Aumenta la velocidad bajo sol intenso');
        
INSERT INTO pokemon (nombre, altura, peso, fk_generacion_id)
VALUES ('Bulbasaur', 0.70, 7, 1);

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id
FROM pokemon p, habilidad h
WHERE p.nombre = 'Bulbasaur'
  AND h.nombre = 'Espesura';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id
FROM pokemon p, tipo t
WHERE p.nombre = 'Bulbasaur'
  AND t.nombre = 'Planta';


-- Insercion de Ivysaur
        
INSERT INTO pokemon (nombre, altura, peso, fk_generacion_id)
VALUES ('Ivysaur', 1.00, 13, 1);

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id
FROM pokemon p, habilidad h
WHERE p.nombre = 'Ivysaur'
  AND h.nombre = 'Espesura';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id
FROM pokemon p, tipo t
WHERE p.nombre = 'Ivysaur'
  AND t.nombre = 'Planta';
  
INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id
FROM pokemon p, tipo t
WHERE p.nombre = 'Ivysaur'
  AND t.nombre = 'Veneno';

-- Insercion de Venusaur
        
INSERT INTO pokemon (nombre, altura, peso, fk_generacion_id)
VALUES ('Venusaur', 2.00, 100, 1);

INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id
FROM pokemon p, habilidad h
WHERE p.nombre = 'Venusaur'
  AND h.nombre = 'Espesura';
  
  INSERT INTO pokemon_habilidad (pokemon_id, habilidad_id)
SELECT p.id, h.id
FROM pokemon p, habilidad h
WHERE p.nombre = 'Venusaur'
  AND h.nombre = 'Clorofila';

INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id
FROM pokemon p, tipo t
WHERE p.nombre = 'Venusaur'
  AND t.nombre = 'Planta';
  
INSERT INTO pokemon_tipo (pokemon_id, tipo_id)
SELECT p.id, t.id
FROM pokemon p, tipo t
WHERE p.nombre = 'Venusaur'
  AND t.nombre = 'Veneno';


-- Vista
CREATE VIEW vw_pokemon_informacion AS
SELECT 
    p.nombre AS pokemon,
	GROUP_CONCAT(DISTINCT t.nombre SEPARATOR ', ') AS tipos,
    p.altura,
    p.peso,
    g.numero AS generacion,
    g.region,
    g.anio_lanzamiento,
    GROUP_CONCAT(DISTINCT h.nombre SEPARATOR ', ') AS habilidades
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

SELECT *
FROM vw_pokemon_informacion
WHERE pokemon = 'Bulbasaur';