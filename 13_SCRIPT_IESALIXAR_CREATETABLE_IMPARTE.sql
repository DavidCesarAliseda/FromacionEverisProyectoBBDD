/*Autor: I.E.S Alixar Dual
  Fecha: 06/05/21 */

CREATE TABLE imparte 
(
	dni_formador VARCHAR(9),
	id_modulo INT(1),
	fecha_comienzo DATETIME DEFAULT SYSDATE(),
	fecha_fin DATETIME DEFAULT SYSDATE(),
	CONSTRAINT pk_imparte PRIMARY 	KEY (dni_formador, id_modulo, fecha_comienzo, fecha_fin),
	CONSTRAINT fk_dni_formador_imparte FOREIGN KEY (dni_formador) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_id_modulo_imparte FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo) ON DELETE CASCADE ON UPDATE CASCADE
);
