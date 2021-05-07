-- ----------------------------------------------------
-- Autor       : I.E.S Alixar Dual
-- Descripción : Script Consultas - Formación SQL
-- Responsable : Conjunto de Alumnos
-- ----------------------------------------------------

-- Muestra el id de las plazas que están libres.
SELECT plaza_parking.id_plaza
FROM plaza_parking
WHERE plaza_parking.estado LIKE 'Libre';

-- Muestra la nota media total.
SELECT AVG(participa.nota) AS notaMedia
FROM participa;

-- Muestra todos los datos de las empresas que empiezan por E.
SELECT *
FROM empresa
WHERE empresa.nombre LIKE 'E%';

-- Muestra nombre y apellido de los formadores de la sucursal de Sevilla.
SELECT persona.nombre, persona.apellidos
FROM persona, formador
WHERE formador.dni=persona.dni AND formador.sucursal = 'Sevilla';

-- Muestra el numero de formadores supervisados.
SELECT COUNT(formador_encargado.dni_supervisado) AS numFormadoresSupervisados
FROM formador_encargado;

-- Muestra el nombre y la nota media de cada modulo a partir del id_modulo 1.
SELECT modulo.nombre, AVG(participa.nota) AS notaMedia
FROM participa, modulo
WHERE modulo.id_modulo = participa.id_modulo
GROUP BY participa.id_modulo
HAVING (participa.id_modulo > 1);

-- Muestra el nombre de la empresa y el numero de formadores de las empresas cuyo CIF termine en 10 de forma descendente.
SELECT empresa.nombre, COUNT(formador.dni) AS numFormadores
FROM formador
INNER JOIN empresa
ON empresa.cif=formador.cif
GROUP BY empresa.cif DESC
HAVING empresa.cif LIKE '%10';

-- Muestra el nombre y apellido de la persona cuya nota sea igual que la nota minima.
SELECT persona.nombre, persona.apellidos
FROM persona
INNER JOIN participa
ON persona.dni=participa.dni 
WHERE participa.nota=(											
						SELECT MIN(nota)										
						FROM participa);
																	
-- Muestra el nombre y la nota media de cada modulo.
SELECT modulo.nombre, AVG(participa.nota) AS notaMedia
FROM modulo
LEFT JOIN participa
ON modulo.id_modulo = participa.id_modulo
GROUP BY modulo.id_modulo;

-- Esta consulta muestra el grado y el instituto de los alumnos que haya en la BBDD.
SELECT alumno.grado, alumno.instituto
FROM alumno
WHERE alumno.instituto = 'IES SOTERO';

-- Esta consulta muestra el nombre, apellidos y la empresa de los formadores.
SELECT persona.nombre, persona.apellidos, empresa.nombre
FROM persona, empresa, formador
WHERE persona.dni = formador.dni AND formador.cif = empresa.cif;

-- Esta consulta cuenta la cantidad de empresas que tenemos en la BBDD.
SELECT COUNT(empresa.cif) AS Cant_Empresas
FROM empresa;

-- Esta consulta nos da el nombre, apellidos y el tipo (Alu/Prof) de las personas que viven en Madrid.
SELECT persona.nombre, persona.apellidos, persona.tipo
FROM persona
WHERE persona.ciudad LIKE 'Madrid';

-- Esta consulta muestra los modulos que se imparten en la empresa.
SELECT modulo.nombre
FROM modulo
WHERE modulo.id_modulo BETWEEN 3 AND 4;

-- Esta consulta cuenta la cantidad de personas (Alu/Prof) que hay por ciudades.
SELECT persona.ciudad AS Ciudad, COUNT(persona.dni) AS Cant_Personas
FROM persona
GROUP BY persona.ciudad;

-- Esta consulta nos da la nota media de los alumnos de los módulos impartidos, superiores a 6.
SELECT modulo.nombre AS Nombre_Mod, AVG(participa.nota) AS Nota_Media_Mod
FROM modulo
INNER JOIN participa ON modulo.id_modulo = participa.id_modulo
GROUP BY modulo.nombre
HAVING Nota_Media_Mod > 6;

-- Esta consulta muestra el nombre, los apellidos y la especialidad de los formadores.
SELECT persona.nombre, persona.apellidos, especialidad.nombre
FROM persona
INNER JOIN formador ON persona.dni = formador.dni
INNER JOIN pertenece ON formador.dni = pertenece.dni_formador
INNER JOIN especialidad ON pertenece.id_espec = especialidad.id_espec;

-- Esta consulta muestra el dni, la sucursal y el nombre de la empresa a la que pertenece cada formador.
SELECT formador.dni, formador.sucursal, empresa.nombre
FROM formador
LEFT JOIN empresa ON formador.cif = empresa.cif


-- Muestra todos los alumnos los cuales pertenezcan al grado DAM--
USE fp_dual;
SELECT *
FROM alumno a
WHERE a.grado='DAM'

-- Muestra todas las personas que provengan de Sevilla y Cadiz--
SELECT *
FROM persona p
WHERE p.ciudad='Sevilla' OR p.ciudad='Cadiz';

-- Muestra todas las personas las cuales son mayores de 20 o tienen 20 años --
SELECT *
FROM persona p
WHERE YEAR(p.fecha_nac)<='2001';

-- Muestra las plazas de parking que estan ocupadas--
SELECT *
FROM plaza_parking p
WHERE p.estado='Ocupada';

-- Muestra todos las personas que son Formadores--
SELECT *
FROM persona p
WHERE p.tipo='Formador';

-- Muestra la cantidad de Fromadores y Alumnos que hay en la tabla persona--
SELECT p.tipo,COUNT(*) AS Cantidad
FROM persona p
GROUP BY p.tipo;

-- Muestra los participantes los cuales tienen una nota mayor o igual 5--
SELECT p.dni, ROUND(AVG(p.nota),1)
FROM participa p
GROUP BY p.dni
HAVING AVG(p.nota)>=5;

-- Muestra todos los alumnos que ya estan registrados y son mayor de 20 o poseen 20 años--
SELECT p.*
FROM persona p INNER JOIN alumno a ON p.dni=a.dni
WHERE YEAR(p.fecha_nac)<='2001';

-- Muestra todos los alumnos los cuales no han sido registrados todavia y todos los formadores--
SELECT DISTINCT p.*
FROM alumno a RIGHT JOIN persona p ON p.dni=a.dni
WHERE a.dni IS NULL;

-- Consulta, muestra la cantidad de alumnos que hay por ciudad o provincia
SELECT p.ciudad, count(*) AS numAlumnos
FROM persona p
GROUP BY p.ciudad ;

-- Consulta simple, Muestra el número de alumnos en total
SELECT COUNT(*) numero_alumnos
FROM alumno a;

-- Consulta simple, muestra la especialidad que pueden tener los formadores
SELECT nombre
FROM especialidad e ;

-- Consulta con inner join, muestra los formadores y especialidad de que tiene cada uno.
SELECT concat(p2.nombre ,' ', p2.apellidos) formador , e.nombre especialidad
FROM persona p2 INNER JOIN formador f 
	ON p2.dni = f.dni inner join pertenece p 
	ON f.dni  = p.dni_formador inner join especialidad e 
	ON p.id_espec = e.id_espec;

-- Consulta con having group, que muestra los alumnos que tienen potencial para ser contratados según su nota média
SELECT p2.nombre,p2.dni, avg(nota) 
FROM participa p inner join alumno a2 
	ON p.dni  = a2.dni inner join persona p2 
	ON a2.dni = p2.dni
GROUP BY dni 
HAVING count(*) = 5 and avg(nota) >= 9 ;

-- Consulta con inner join, group, muestra la nota media de cada instituto
SELECT a.instituto, avg(p.nota) media 
FROM alumno a inner join participa p 
	ON a.dni = p.dni
GROUP BY a.instituto;

-- Consulta con inner join, group, subconsulta que muestra el instituto con nota média más alta*/
SELECT a.instituto, avg(p.nota) media 
FROM alumno a inner join participa p 
	on a.dni = p.dni
GROUP BY a.instituto
HAVING avg(p.nota) >= all (
	SELECT avg(p2.nota) 
	FROM alumno a2 INNER JOIN participa p2 
	ON a2.dni = p2.dni
	GROUP BY a2.instituto 
);

-- Consulta con left join, muestra las personas que no han usado el parking
SELECT p.nombre, p.tipo 
FROM persona p LEFT JOIN aparca_en ae 
	ON p.dni = ae.dni
WHERE ae.dni IS NULL ;

-- Consulta que muestra la edad de los alumnos comprendida entre los 18 y 25 años
SELECT p.nombre , round(datediff(curdate(),p.fecha_nac)/365 ) edad 
FROM persona p 
WHERE p.tipo = 'alumno' AND round(datediff(curdate(),p.fecha_nac)/365 ) BETWEEN 18 AND 25 ;

-- Subconsulta personas que ocupan plazas de parking
SELECT persona.nombre, persona.apellidos
FROM persona
INNER JOIN aparca_en
ON persona.dni = aparca_en.dni
INNER JOIN plaza_parking
ON aparca_en.id_plaza = plaza_parking.id_plaza
WHERE estado LIKE 'Ocupada';

-- Muestra en nombre y la direccion de las empresas Everis y Deloitte
SELECT nombre,direccion
FROM empresa
WHERE nombre = 'Everis' OR nombre = 'Deloitte';

-- Muestra los datos de las personas del Instituto Sotero
SELECT *
FROM alumno
WHERE instituto LIKE "%SOTERO";

-- Personas con correo corporativo no acabado en @everis.com
SELECT persona.nombre,persona.apellidos,persona.email
FROM persona
WHERE persona.email NOT LIKE '%@everis.com';

-- Mostrar los datos de la tabla "pertenece" de los alumnos aprobados
SELECT participa.* 
FROM fp_dual.participa
WHERE participa.nota BETWEEN 5 AND 10;

-- Dni de la nota mas baja de los alumnos
SELECT participa.dni, MIN(participa.nota) AS "Nota"
FROM fp_dual.participa;

-- Consutla para ver los aparcamientos libres y ocupados
SELECT COUNT(estado) AS 'NumeroPlazas', plaza_parking.estado AS 'Estado'
FROM plaza_parking
GROUP BY (estado);

-- Mostramos las sucursal con mas de 1 formador
SELECT formador.sucursal,COUNT(formador.sucursal)
FROM formador
GROUP BY formador.sucursal
HAVING COUNT(formador.sucursal)>1;

-- Mostramos las personas que estan usando una plaza de parking
SELECT persona.nombre, persona.apellidos
FROM persona
INNER JOIN aparca_en
ON persona.dni = aparca_en.dni
INNER JOIN plaza_parking
ON aparca_en.id_plaza = plaza_parking.id_plaza
WHERE estado LIKE 'Ocupada';

-- Mostramos el encargado
SELECT formador.*
FROM formador
LEFT JOIN formador_encargado
ON formador.dni = formador_encargado.dni_supervisado
WHERE formador_encargado.dni_supervisado IS NULL;

