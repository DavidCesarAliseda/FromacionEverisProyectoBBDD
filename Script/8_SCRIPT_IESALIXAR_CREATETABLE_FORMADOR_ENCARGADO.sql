-- ----------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 8 - Formación SQL
-- Responsable : Conjunto de Alumnos
-- ----------------------------------------------------

CREATE TABLE formador_encargado 
(
	dni_supervisado VARCHAR(9) PRIMARY KEY,
	dni_encargado VARCHAR(9),
	
	CONSTRAINT fk_dni_encargado FOREIGN KEY (dni_encargado) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_dni_supervisado FOREIGN KEY (dni_supervisado) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE
);
