-- BASE DE DATOS: POKEDEX

DROP DATABASE IF EXISTS poked;
CREATE DATABASE pokedex;
USE pokedex;


-- Creacion de tabla: Generacion

CREATE TABLE generacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL,
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
    descripcion VARCHAR(200) NOT NULL,
    hidden_flag BOOLEAN NOT NULL
);

-- Creacion de tabla: Objeto

CREATE TABLE objeto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL UNIQUE,
    tipo_objeto VARCHAR(25) NOT NULL
);

-- Creacion de tabla: Pokemon

CREATE TABLE pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    altura DECIMAL(5,2) NOT NULL,
    peso INT NOT NULL,
    generacion_id INT NOT NULL,
    FOREIGN KEY (generacion_id)
);


-- Creacion de tabla intermedia: Pokemon - Habilidad

CREATE TABLE pokemon_habilidad (
    pokemon_id INT NOT NULL,
    habilidad_id INT NOT NULL,
    hidden_flag BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (pokemon_id, habilidad_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (habilidad_id) REFERENCES habilidad(id)
);

-- Creacion de tabla: Movimiento


CREATE TABLE movimiento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL UNIQUE,
    tipo_id INT NOT NULL,
    categoria VARCHAR(25) NOT NULL,
    poder INT,
    precision DECIMAL(5,2),
    pp INT NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES tipo(id)
);

-- Creacion de tabla: Evolucion

CREATE TABLE evolucion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pre_pokemon_id INT NOT NULL,
    post_pokemon_id INT NOT NULL,
    metodo VARCHAR(25) NOT NULL,
    nivel_minimo INT,
    objeto_id INT,
    FOREIGN KEY (pre_pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (post_pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (objeto_id) REFERENCES objeto(id)
);
