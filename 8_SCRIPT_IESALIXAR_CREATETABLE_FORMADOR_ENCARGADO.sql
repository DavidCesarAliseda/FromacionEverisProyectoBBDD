/*Autor: I.E.S Alixar Dual
  Fecha: 06/05/21 */

CREATE TABLE formador_encargado 
(
	dni_encargado VARCHAR(9),
	dni_supervisado VARCHAR(9),
	CONSTRAINT pk_formador_encargado PRIMARY KEY (dni_supervisado),
	CONSTRAINT fk_dni_encargado FOREIGN KEY (dni_encargado) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_dni_supervisado FOREIGN KEY (dni_supervisado) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE
);
