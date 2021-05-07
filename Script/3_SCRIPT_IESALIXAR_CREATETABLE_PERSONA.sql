-- ----------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script 3 - Formación SQL
-- Responsable : Conjunto de Alumnos
-- ----------------------------------------------------

CREATE TABLE persona 
(
	dni VARCHAR(9) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(20) NOT NULL,
	fecha_nac DATE NOT NULL,
	telf VARCHAR(11) NOT NULL,
	email VARCHAR(50) NOT NULL,
	ciudad VARCHAR(20) NOT NULL,
	tipo enum('Formador', 'Alumno')
); 
