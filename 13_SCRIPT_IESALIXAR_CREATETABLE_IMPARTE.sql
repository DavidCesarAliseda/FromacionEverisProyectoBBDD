------------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 13 - Formación SQL
-- Responsable : Conjunto de Alumnos
------------------------------------------------------

CREATE TABLE imparte 
(
	dni_formador VARCHAR(9),
	id_modulo INT(1),
	fecha_comienzo DATETIME DEFAULT CURRENT_TIMESTAMP(),
	fecha_fin DATETIME DEFAULT CURRENT_TIMESTAMP(),
	
	CONSTRAINT pk_imparte PRIMARY KEY (dni_formador, id_modulo, fecha_comienzo),
	CONSTRAINT fk_dni_formador_imparte FOREIGN KEY (dni_formador) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_id_modulo_imparte FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo) ON DELETE CASCADE ON UPDATE CASCADE
);