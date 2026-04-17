-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pokedex
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `generacion`
--

DROP TABLE IF EXISTS `generacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `region` varchar(30) NOT NULL,
  `anio_lanzamiento` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `region` (`region`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generacion`
--

LOCK TABLES `generacion` WRITE;
/*!40000 ALTER TABLE `generacion` DISABLE KEYS */;
INSERT INTO `generacion` VALUES (1,1,'Kanto',1996),(2,2,'Johto',1999);
/*!40000 ALTER TABLE `generacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidad`
--

DROP TABLE IF EXISTS `habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidad`
--

LOCK TABLES `habilidad` WRITE;
/*!40000 ALTER TABLE `habilidad` DISABLE KEYS */;
INSERT INTO `habilidad` VALUES (1,'Electricidad estática','Puede paralizar al contacto'),(2,'Espesura','Potencia movimientos de tipo Planta cuando tiene poca salud'),(3,'Clorofila','Aumenta la velocidad bajo sol intenso'),(4,'Pararrayos','Atrae ataques eléctricos'),(5,'Mar Llamas','Potencia movimientos tipo fuego en apuros'),(6,'Torrente','Potencia movimientos tipo agua en apuros'),(7,'Sincronia','Pasa problemas de estado al atacante'),(8,'Foco Interno','Evita que el Pokemon retroceda'),(9,'Robustez','Evita ser derrotado de un solo golpe si tiene vida al maximo'),(10,'Absorbe Electricidad','Recupera PS al recibir un ataque electrico'),(11,'Ritmo Propio','Evita que el Pokemon entre en estado de confusion'),(12,'Polvo Escudo','Bloquea los efectos secundarios de los ataques recibidos'),(13,'Mudar','Tiene una probabilidad de curar sus problemas de estado al mudar la piel'),(14,'Ojo Compuesto','Aumenta la precision de los movimientos del Pokemon'),(15,'Enjambre','Potencia los movimientos de tipo Bicho cuando queda poca salud'),(16,'Fuga','Facilita la huida de combates contra Pokemon salvajes'),(17,'Vista Lince','Evita que baje la Precision del Pokemon'),(18,'Insomnio','Evita que el Pokemon se quede dormido'),(19,'Madrugar','Reduce a la mitad el tiempo que pasa dormido');
/*!40000 ALTER TABLE `habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_usuarios_pokemon`
--

DROP TABLE IF EXISTS `movimientos_usuarios_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_usuarios_pokemon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_pokemon` varchar(50) DEFAULT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `detalles` varchar(100) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_usuarios_pokemon`
--

LOCK TABLES `movimientos_usuarios_pokemon` WRITE;
/*!40000 ALTER TABLE `movimientos_usuarios_pokemon` DISABLE KEYS */;
INSERT INTO `movimientos_usuarios_pokemon` VALUES (1,'Pikachu','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(2,'Bulbasaur','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(3,'Ivysaur','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(4,'Venusaur','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(5,'Charmander','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(6,'Charmeleon','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(7,'Charizard','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(8,'Squirtle','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(9,'Wartortle','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(10,'Blastoise','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(11,'Caterpie','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(12,'Metapod','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(13,'Butterfree','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(14,'Weedle','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(15,'Kakuna','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(16,'Beedrill','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(17,'Chikorita','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(18,'Bayleef','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(19,'Meganium','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(20,'Totodile','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(21,'Croconaw','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(22,'Feraligatr','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(23,'Sentret','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(24,'Furret','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(25,'Hoothoot','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(26,'Noctowl','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(27,'Ledyba','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(28,'Ledian','INSERT','root@localhost','Nuevo pokemon registrado.','2026-04-05 01:18:49'),(29,'Pikachu','DELETE','root@localhost','Pokemon eliminado de la base de datos','2026-04-05 01:18:49');
/*!40000 ALTER TABLE `movimientos_usuarios_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `altura` decimal(5,2) NOT NULL,
  `peso` int NOT NULL,
  `nivel_evolucion` int DEFAULT '1',
  `fk_generacion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_generacion_id` (`fk_generacion_id`),
  CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`fk_generacion_id`) REFERENCES `generacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (2,'Bulbasaur',0.70,7,1,1),(3,'Ivysaur',1.00,13,2,1),(4,'Venusaur',2.00,100,3,1),(5,'Charmander',0.60,8,1,1),(6,'Charmeleon',1.10,19,2,1),(7,'Charizard',1.70,90,3,1),(8,'Squirtle',0.50,9,1,1),(9,'Wartortle',1.00,22,2,1),(10,'Blastoise',1.60,85,3,1),(11,'Caterpie',0.30,3,1,1),(12,'Metapod',0.70,10,2,1),(13,'Butterfree',1.10,32,3,1),(14,'Weedle',0.30,3,1,1),(15,'Kakuna',0.60,10,2,1),(16,'Beedrill',1.00,30,3,1),(17,'Chikorita',0.90,6,1,2),(18,'Bayleef',1.20,16,2,2),(19,'Meganium',1.80,100,3,2),(20,'Totodile',0.60,9,1,2),(21,'Croconaw',1.10,25,2,2),(22,'Feraligatr',2.30,88,3,2),(23,'Sentret',0.80,6,1,2),(24,'Furret',1.80,33,2,2),(25,'Hoothoot',0.70,21,1,2),(26,'Noctowl',1.60,41,2,2),(27,'Ledyba',1.00,11,1,2),(28,'Ledian',1.40,36,2,2);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_registrar_usuario_creacion_pokemon` AFTER INSERT ON `pokemon` FOR EACH ROW BEGIN
    INSERT INTO movimientos_usuarios_pokemon (nombre_pokemon, accion, usuario, detalles)
    VALUES (NEW.nombre, 'INSERT',USER(), 'Nuevo pokemon registrado.');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_registrar_usuario_borrado_pokemon` BEFORE DELETE ON `pokemon` FOR EACH ROW BEGIN
    INSERT INTO movimientos_usuarios_pokemon (nombre_pokemon, accion, usuario, detalles)
    VALUES (OLD.nombre, 'DELETE', USER(), 'Pokemon eliminado de la base de datos');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pokemon_habilidad`
--

DROP TABLE IF EXISTS `pokemon_habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_habilidad` (
  `pokemon_id` int NOT NULL,
  `habilidad_id` int NOT NULL,
  PRIMARY KEY (`pokemon_id`,`habilidad_id`),
  KEY `habilidad_id` (`habilidad_id`),
  CONSTRAINT `pokemon_habilidad_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pokemon_habilidad_ibfk_2` FOREIGN KEY (`habilidad_id`) REFERENCES `habilidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_habilidad`
--

LOCK TABLES `pokemon_habilidad` WRITE;
/*!40000 ALTER TABLE `pokemon_habilidad` DISABLE KEYS */;
INSERT INTO `pokemon_habilidad` VALUES (2,2),(3,2),(4,2),(17,2),(18,2),(19,2),(2,3),(3,3),(4,3),(5,5),(6,5),(7,5),(8,6),(9,6),(10,6),(20,6),(21,6),(22,6),(11,12),(14,12),(12,13),(15,13),(13,14),(16,15),(27,15),(28,15),(23,16),(24,16),(25,18),(26,18);
/*!40000 ALTER TABLE `pokemon_habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_tipo`
--

DROP TABLE IF EXISTS `pokemon_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_tipo` (
  `pokemon_id` int NOT NULL,
  `tipo_id` int NOT NULL,
  PRIMARY KEY (`pokemon_id`,`tipo_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `pokemon_tipo_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pokemon_tipo_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_tipo`
--

LOCK TABLES `pokemon_tipo` WRITE;
/*!40000 ALTER TABLE `pokemon_tipo` DISABLE KEYS */;
INSERT INTO `pokemon_tipo` VALUES (2,2),(3,2),(4,2),(17,2),(18,2),(19,2),(5,3),(6,3),(7,3),(8,4),(9,4),(10,4),(20,4),(21,4),(22,4),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(27,5),(28,5),(3,6),(4,6),(7,7),(23,10),(24,10),(25,10),(26,10);
/*!40000 ALTER TABLE `pokemon_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (4,'Agua'),(5,'Bicho'),(8,'Dragon'),(1,'Electrico'),(11,'Fantasma'),(3,'Fuego'),(9,'Hielo'),(10,'Normal'),(2,'Planta'),(12,'Psiquico'),(6,'Veneno'),(7,'Volador');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_avistamiento_pokemon`
--

DROP TABLE IF EXISTS `vw_avistamiento_pokemon`;
/*!50001 DROP VIEW IF EXISTS `vw_avistamiento_pokemon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_avistamiento_pokemon` AS SELECT 
 1 AS `Pokemon`,
 1 AS `Region`,
 1 AS `Probabilidad_Avistamiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_informacion_pokemon`
--

DROP TABLE IF EXISTS `vw_informacion_pokemon`;
/*!50001 DROP VIEW IF EXISTS `vw_informacion_pokemon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_informacion_pokemon` AS SELECT 
 1 AS `Pokemon`,
 1 AS `Tipos`,
 1 AS `Altura`,
 1 AS `Peso`,
 1 AS `Fase_Evolutiva`,
 1 AS `Generacion`,
 1 AS `Region`,
 1 AS `Lanzamiento`,
 1 AS `Habilidades`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'pokedex'
--

--
-- Dumping routines for database 'pokedex'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_probabilidad_avistamiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_probabilidad_avistamiento`(p_nivel INT, p_tipo VARCHAR(20)) RETURNS decimal(5,2)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_pokemon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_pokemon`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_habilidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_habilidad`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_pokemon_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_pokemon_completo`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_avistamiento_pokemon`
--

/*!50001 DROP VIEW IF EXISTS `vw_avistamiento_pokemon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_avistamiento_pokemon` AS select `p`.`nombre` AS `Pokemon`,`g`.`region` AS `Region`,concat(convert(`fn_probabilidad_avistamiento`(`p`.`nivel_evolucion`,(select `t2`.`nombre` from (`pokemon_tipo` `pt2` join `tipo` `t2` on((`pt2`.`tipo_id` = `t2`.`id`))) where (`pt2`.`pokemon_id` = `p`.`id`) limit 1)) using utf8mb4),'%') AS `Probabilidad_Avistamiento` from (((`pokemon` `p` join `generacion` `g` on((`p`.`fk_generacion_id` = `g`.`id`))) join `pokemon_tipo` `pt` on((`p`.`id` = `pt`.`pokemon_id`))) join `tipo` `t` on((`pt`.`tipo_id` = `t`.`id`))) group by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_informacion_pokemon`
--

/*!50001 DROP VIEW IF EXISTS `vw_informacion_pokemon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_informacion_pokemon` AS select `p`.`nombre` AS `Pokemon`,group_concat(distinct `t`.`nombre` separator ', ') AS `Tipos`,`p`.`altura` AS `Altura`,`p`.`peso` AS `Peso`,`p`.`nivel_evolucion` AS `Fase_Evolutiva`,`g`.`numero` AS `Generacion`,`g`.`region` AS `Region`,`g`.`anio_lanzamiento` AS `Lanzamiento`,group_concat(distinct `h`.`nombre` separator ', ') AS `Habilidades` from (((((`pokemon` `p` join `generacion` `g` on((`p`.`fk_generacion_id` = `g`.`id`))) join `pokemon_tipo` `pt` on((`p`.`id` = `pt`.`pokemon_id`))) join `tipo` `t` on((`pt`.`tipo_id` = `t`.`id`))) join `pokemon_habilidad` `ph` on((`p`.`id` = `ph`.`pokemon_id`))) join `habilidad` `h` on((`ph`.`habilidad_id` = `h`.`id`))) group by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-17 11:56:09
