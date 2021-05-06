CREATE TABLE pertenece
(
	dni_formador VARCHAR(9),
	id_espec INT(2),
	PRIMARY KEY(dni_formador, id_espec),
	CONSTRAINT fk_per_dnifor FOREIGN KEY (dni_formador) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_per_idespec FOREIGN KEY (id_espec) REFERENCES especialidad(id_espec) ON DELETE CASCADE ON UPDATE CASCADE
);

