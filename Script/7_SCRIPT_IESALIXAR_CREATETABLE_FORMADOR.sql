-- ----------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 7 - Formación SQL
-- Responsable : Conjunto de Alumnos
-- ----------------------------------------------------

CREATE TABLE formador
(
	dni VARCHAR(9) PRIMARY KEY,
	sucursal VARCHAR(30) NOT NULL,
	cif INT(10),
	
	CONSTRAINT fk_empr_form FOREIGN KEY (cif) REFERENCES empresa(cif) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_persona_form FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);