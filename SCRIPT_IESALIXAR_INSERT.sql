/*Parking*/
INSERT INTO plaza_parking VALUES(6, 'Ocupada');
INSERT INTO plaza_parking VALUES(8, 'Ocupada');
INSERT INTO plaza_parking (id_plaza) VALUES(5);
INSERT INTO plaza_parking (estado) VALUES('Ocupada');
INSERT INTO plaza_parking VALUES(140, 'Libre');

/*Persona*/
INSERT INTO persona VALUES('46421346V','David','Corbacho','2000-01-19','4632463426','ddavid@everis.es','Sevilla','Alumno');
INSERT INTO persona VALUES('26546747S','Luis','Herrera','1999-07-03','694363606','lluis@everis.com','Sevilla','Alumno');
INSERT INTO persona VALUES('15463125Z','Alexei','Sanchez','1978-04-23','5437573457','aalexei@everis.com','Sevilla','Alumno');
INSERT INTO persona VALUES('65498732S','Andrea','Duro','1991-10-14','695784123','aduro@everis.com','Sevilla','Alumno');
INSERT INTO persona VALUES('63126413A','Lucia','Flores','2001-09-12','4453747437','llucia@everis.com','Sevilla','Formador');
INSERT INTO persona VALUES('32532526K','Juan Alejandro','Tellez Rubio','1980-06-24','685634745','juan.alejandro.tellez.rubio@everis.nttdata.com','Sevilla','Formador');
INSERT INTO persona VALUES('26426236X','Jose María','Bernal Gomez','1976-07-28','5375347234','jose.maria.bernal.gomez@everis.nttdata.com','Sevilla','Formador');
INSERT INTO persona VALUES('52315326H','Jesus Alberto','Castaño Lora','1978-04-23','4632623464','jesus.alberto.castano.lora@everis.nttdata.com','Sevilla','Formador');
INSERT INTO persona VALUES('43262346G','Ariel','Marin','2000-03-18','423243723','aariel@everis.es','Cadiz','Alumno');
INSERT INTO persona VALUES('34643623P','Angela','Gimenez','1989-04-07','643623443','aangela@everis.com','Málaga','Alumno');
INSERT INTO persona VALUES('23463426M','Carlos','Gomezz','1977-02-22','243623462','ccarlos@everis.com','Cadiz','Alumno');
INSERT INTO persona VALUES('62346423W','Marta','Gavilia','2002-05-17','523467364','mmarta@everis.com','Madrid','Alumno');
INSERT INTO persona VALUES('23463426I','David','Cacerez','1982-03-24','543653473','ddavidd@everis.com','Málaga','Alumno');
INSERT INTO persona VALUES('23432465W','Enrrique','Machado','1996-02-27','623462346','eenrrique@everis.com','Cadiz','Alumno');
INSERT INTO persona VALUES('34623466F','Luis','Arroyo','2001-01-07','634263462','lluis@everis.com','Madrid','Alumno');
INSERT INTO persona VALUES('63426432R','Nieves','Fibonachi','1977-02-22','462346224','nnieves@everis.com','Madrid','Alumno');

/*Aparca en*/
INSERT INTO aparca_en(id_plaza,dni) VALUES (6,'26546747S');
INSERT INTO aparca_en(id_plaza,dni) VALUES (8,'15463125Z');
INSERT INTO aparca_en(id_plaza,dni) VALUES (5,'63126413A');
INSERT INTO aparca_en(id_plaza,dni) VALUES (140,'46421346V');

/*Alumno*/
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('26546747S','DAW','Segundo','IES SOTERO');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('15463125Z','DAM','Primero','IES ALIXAR');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('63126413A','DAW','Primero','IES SALESIANAS');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('46421346V','DAM','Segundo','IES SOTERO');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('23432465W','DAW','Primero','IES SOTERO');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('34623466F','DAM','Primero','IES ALIXAR');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('23463426I','DAM','Primero','IES SOTERO');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('23463426M','DAW','Primero','IES ALIXAR');
INSERT INTO alumno(dni,grado,curso,instituto) VALUES ('34643623P','DAM','Primero','IES SOTERO');

/*Empresa*/
INSERT INTO empresa VALUES(1234567891, 'Everis', 'C/ Tajo');
INSERT INTO empresa VALUES(984563210, 'Accenture', 'C/ Veleta');
INSERT INTO empresa VALUES(791232123, 'Deloitte', 'C/ Cabo de Gata');

/*Formador*/
INSERT INTO formador(sucursal,cif,dni) VALUES ('Malaga',1234567891,'63126413A');
INSERT INTO formador(sucursal,cif,dni) VALUES ('Sevilla',984563210,'32532526K');
INSERT INTO formador(sucursal,cif,dni) VALUES ('Sevilla',984563210,'26426236X');
INSERT INTO formador(sucursal,cif,dni) VALUES ('Alicante',1234567891,'52315326H');

/*Formador encargado*/
INSERT INTO formador_encargado VALUES('63126413A', '32532526K');
INSERT INTO formador_encargado VALUES('26426236X', '32532526K');
INSERT INTO formador_encargado VALUES('52315326H', '32532526K');

/*Modulo*/
INSERT INTO modulo VALUES(1, 'Lenguaje de marcas');
INSERT INTO modulo VALUES(2, 'Base de datos');
INSERT INTO modulo VALUES(3, 'Programacion');
INSERT INTO modulo VALUES(4, 'Entornos de desarrollo');

/*Participa*/
INSERT INTO participa VALUES('26546747S', 3, 9);
INSERT INTO participa VALUES('15463125Z', 3, 4);
INSERT INTO participa VALUES('63126413A', 3, 7);
INSERT INTO participa VALUES('26546747S', 1, 10);
INSERT INTO participa VALUES('63126413A', 4, 6);
INSERT INTO participa VALUES('63126413A', 2, 5);
INSERT INTO participa VALUES('23432465W',1,7);
INSERT INTO participa VALUES('23432465W',2,9);
INSERT INTO participa VALUES('23432465W',3,7);
INSERT INTO participa VALUES('23432465W',4,6);
INSERT INTO participa VALUES('23463426I',1,9);
INSERT INTO participa VALUES('23463426I',2,6);
INSERT INTO participa VALUES('23463426I',3,7);
INSERT INTO participa VALUES('23463426I',4,8);
INSERT INTO participa VALUES('23463426M',1,6);
INSERT INTO participa VALUES('23463426M',2,9);
INSERT INTO participa VALUES('23463426M',3,10);
INSERT INTO participa VALUES('23463426M',4,7);
INSERT INTO participa VALUES('34623466F',1,8);
INSERT INTO participa VALUES('34623466F',2,8);
INSERT INTO participa VALUES('34623466F',3,8);
INSERT INTO participa VALUES('34623466F',4,8);
INSERT INTO participa VALUES('34643623P',1,7);
INSERT INTO participa VALUES('34643623P',2,6);
INSERT INTO participa VALUES('34643623P',3,10);
INSERT INTO participa VALUES('34643623P',4,7);
INSERT INTO participa VALUES('46421346V',1,10);
INSERT INTO participa VALUES('46421346V',2,7);
INSERT INTO participa VALUES('46421346V',3,8);
INSERT INTO participa VALUES('46421346V',4,5);
/*Especialidad*/
INSERT INTO especialidad VALUES(1,'Phyton');
INSERT INTO especialidad VALUES(2,'Java');
INSERT INTO especialidad VALUES(3,'JavaScript');
INSERT INTO especialidad VALUES(4,'HTML');

/*Pertenece*/
INSERT INTO pertenece VALUES('63126413A', 1);
INSERT INTO pertenece VALUES('32532526K', 2);
INSERT INTO pertenece VALUES('26426236X', 3);
INSERT INTO pertenece VALUES('52315326H', 4);

/*Imparte*/
INSERT INTO imparte(dni_formador,id_modulo) VALUES ('63126413A',3);
INSERT INTO imparte(dni_formador,id_modulo) VALUES ('52315326H',1);
INSERT INTO imparte(dni_formador,id_modulo) VALUES ('26426236X',2);
INSERT INTO imparte(dni_formador,id_modulo) VALUES ('32532526K',4);