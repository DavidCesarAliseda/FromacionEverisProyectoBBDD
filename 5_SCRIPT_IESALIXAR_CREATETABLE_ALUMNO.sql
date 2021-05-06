------------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 5 - Formación SQL
-- Responsable : Conjunto de Alumnos
------------------------------------------------------

CREATE TABLE alumno 
(
	dni VARCHAR(9) PRIMARY KEY,
	grado ENUM ('DAW', 'DAM'),
	curso ENUM ('Primero', 'Segundo'),
	instituto VARCHAR(30) NOT NULL,

	CONSTRAINT fk_persona_alum FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);
