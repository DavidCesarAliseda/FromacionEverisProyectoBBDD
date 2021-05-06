------------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 2 - Formación SQL
-- Responsable : Conjunto de Alumnos
------------------------------------------------------

CREATE TABLE plaza_parking
(
	id_plaza int(3) PRIMARY KEY AUTO_INCREMENT,
	estado ENUM ('Libre', 'Ocupada') DEFAULT ‘Libre’
);
