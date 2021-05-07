-- ----------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 4 - Formación SQL
-- Responsable : Conjunto de Alumnos
-- ----------------------------------------------------

CREATE TABLE aparca_en
(
	id_plaza INT(3),
	dni VARCHAR(9),
	hora_entrada DATETIME DEFAULT CURRENT_TIMESTAMP(),
	hora_salida DATETIME DEFAULT CURRENT_TIMESTAMP(),
	
	PRIMARY KEY (id_plaza, dni, hora_entrada),
	FOREIGN KEY (id_plaza) REFERENCES plaza_parking(id_plaza) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

