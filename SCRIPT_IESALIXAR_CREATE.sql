DROP DATABASE IF EXISTS fp_dual;
CREATE DATABASE fp_dual;
USE fp_dual;

CREATE TABLE plaza_parking
(
	id_plaza int(3) PRIMARY KEY AUTO_INCREMENT,
	estado ENUM ('Libre', 'Ocupada') DEFAULT 'Libre'
);

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

CREATE TABLE aparca_en
(
	id_plaza INT(3),
	dni VARCHAR(9),
	hora_entrada DATETIME DEFAULT CURRENT_TIMESTAMP(),
	hora_salida DATETIME DEFAULT CURRENT_TIMESTAMP(),
	
	PRIMARY KEY (id_plaza, dni, hora_entrada),
	FOREIGN KEY (id_plaza) REFERENCES plaza_parking(id_plaza) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE alumno 
(
	dni VARCHAR(9) PRIMARY KEY,
	grado ENUM ('DAW', 'DAM'),
	curso ENUM ('Primero', 'Segundo'),
	instituto VARCHAR(30) NOT NULL,

	CONSTRAINT fk_persona_alum FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE empresa
(
	cif INT(10) PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
	direccion VARCHAR(90) NOT NULL
);

CREATE TABLE formador
(
	dni VARCHAR(9) PRIMARY KEY,
	sucursal VARCHAR(30) NOT NULL,
	cif INT(10),
	
	CONSTRAINT fk_empr_form FOREIGN KEY (cif) REFERENCES empresa(cif) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_persona_form FOREIGN KEY (dni) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE formador_encargado 
(
	dni_supervisado VARCHAR(9) PRIMARY KEY,
	dni_encargado VARCHAR(9),
	
	CONSTRAINT fk_dni_encargado FOREIGN KEY (dni_encargado) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_dni_supervisado FOREIGN KEY (dni_supervisado) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE especialidad
(
	id_espec INT(2) AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL
);

CREATE TABLE pertenece
(
	dni_formador VARCHAR(9),
	id_espec INT(2),
	
	PRIMARY KEY(dni_formador, id_espec),
	CONSTRAINT fk_per_dnifor FOREIGN KEY (dni_formador) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_per_idespec FOREIGN KEY (id_espec) REFERENCES especialidad(id_espec) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE modulo
(
	id_modulo INT(1) AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL
);

CREATE TABLE participa
(
	dni VARCHAR(9),
	id_modulo INT(1),
	nota INT(10) DEFAULT 5 CHECK(nota<11 AND nota>0),
	
	CONSTRAINT pk_participa PRIMARY KEY (dni, id_modulo, nota),
	CONSTRAINT fk_alum_part FOREIGN KEY (dni ) REFERENCES alumno(dni ) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_mod_part FOREIGN KEY (id_modulo  ) REFERENCES modulo(id_modulo  ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE imparte 
(
	dni_formador VARCHAR(9),
	id_modulo INT(1),
	fecha_comienzo DATETIME DEFAULT CURRENT_TIMESTAMP(),
	fecha_fin DATETIME DEFAULT CURRENT_TIMESTAMP(),
	
	CONSTRAINT pk_imparte PRIMARY KEY (dni_formador, id_modulo, fecha_comienzo),
	CONSTRAINT fk_dni_formador_imparte FOREIGN KEY (dni_formador) REFERENCES formador(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_id_modulo_imparte FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo) ON DELETE CASCADE ON UPDATE CASCADE
);