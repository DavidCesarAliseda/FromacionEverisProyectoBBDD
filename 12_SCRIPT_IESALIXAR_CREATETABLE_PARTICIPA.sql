CREATE TABLE participa
(
	dni VARCHAR(9),
	id_modulo INT(1),
	nota INT(10) DEFAULT 5 CHECK(nota<11 AND nota>0),
	CONSTRAINT pk_participa PRIMARY KEY (dni, id_modulo, nota),
	CONSTRAINT fk_alum_part FOREIGN KEY (dni ) REFERENCES alumno(dni ) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_mod_part FOREIGN KEY (id_modulo  ) REFERENCES modulo(id_modulo  ) ON DELETE CASCADE ON UPDATE CASCADE
);

