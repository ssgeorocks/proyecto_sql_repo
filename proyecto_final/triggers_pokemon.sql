-- Tabla de auditoria. 
CREATE TABLE movimientos_usuarios_pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pokemon VARCHAR(50),
    accion ENUM('INSERT', 'UPDATE', 'DELETE'),
    usuario VARCHAR(100),
    detalles VARCHAR(100),
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP
);



-- Trigger para nuevos pokemon registrados
DROP TRIGGER IF EXISTS tr_registrar_usuario_creacion_pokemon;
DELIMITER //
CREATE TRIGGER tr_registrar_usuario_creacion_pokemon
AFTER INSERT ON pokemon
FOR EACH ROW
BEGIN
    INSERT INTO movimientos_usuarios_pokemon (nombre_pokemon, accion, usuario, detalles)
    VALUES (NEW.nombre, 'INSERT',USER(), 'Nuevo pokemon registrado.');
END //
DELIMITER ;

-- Trigger para pokemon eliminados
DROP TRIGGER IF EXISTS tr_registrar_usuario_borrado_pokemon;
DELIMITER //
CREATE TRIGGER tr_registrar_usuario_borrado_pokemon
BEFORE DELETE ON pokemon
FOR EACH ROW
BEGIN
    INSERT INTO movimientos_usuarios_pokemon (nombre_pokemon, accion, usuario, detalles)
    VALUES (OLD.nombre, 'DELETE', USER(), 'Pokemon eliminado de la base de datos');
END //
DELIMITER ;

