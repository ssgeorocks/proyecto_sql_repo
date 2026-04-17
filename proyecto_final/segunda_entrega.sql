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
    nivel_evolucion INT DEFAULT 1,
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
