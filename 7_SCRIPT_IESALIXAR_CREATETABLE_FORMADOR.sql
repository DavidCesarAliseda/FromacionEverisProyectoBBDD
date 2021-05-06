/*Autor: I.E.S Alixar Dual
  Fecha: 06/05/21 */

CREATE TABLE formador
(
	sucursal VARCHAR(30) NOT NULL,
	cif INT(10),
	dni VARCHAR(9),
	CONSTRAINT fk_empr_form FOREIGN KEY (cif) REFERENCES empresa(cif) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_persona_form FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pk_form PRIMARY KEY (dni)
);

