--punto 11
DROP TABLE hospital;
DROP TABLE especialidad;
DROP TABLE categoria;
DROP TABLE profesional;
DROP TABLE hospital_profesional;
DROP TABLE laboratorio;
DROP TABLE telefono;
DROP TABLE medicamento;


CREATE TABLE hospital(
    hospital_id       NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre    VARCHAR2(20 CHAR) NOT NULL,
    camas     NUMBER(4) NOT NULL,
    direccion VARCHAR2(20 CHAR) NOT NULL,
    telefono  NUMBER(10) NOT NULL
);
CREATE TABLE especialidad(
    especialidad_id        NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    especialidad_tipo VARCHAR2(20 CHAR) NOT NULL UNIQUE
);

CREATE TABLE categoria (
    codigo_categoria  NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo             VARCHAR2(20) NOT NULL UNIQUE,
    sueldo_basico    NUMBER(7) NOT NULL,
    carga_horaria    NUMBER(2) NOT NULL
);
CREATE TABLE profesional(
    id_profesional             NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre                       VARCHAR2(20 CHAR) NOT NULL,
    apellido                     VARCHAR2(20 CHAR) NOT NULL,
    dni                          NUMBER(8) NOT NULL,
    tipo_dni                     VARCHAR2(20 CHAR) NOT NULL,
    fecha_ingreso                DATE NOT NULL, 
    FOREIGN KEY (categoria_profesional) REFERENCES categoria(codigo_categoria),
    FOREIGN KEY (especialidad_profesional) REFERENCES especialidad(especialidad_id)
);
CREATE TABLE hospital_profesional (
    codigo_hospital         NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FOREIGN KEY (hospital) REFERENCES hospital(hospital_id),
    FOREIGN KEY (director_profesional) REFERENCES profesional(id_matricula)
);
--punto 3
INSERT INTO hospital (nombre,camas,direccion,telefono)VALUES('PADUA',300,'Entre rios 287',1122334455); 
INSERT INTO hospital (nombre,camas,direccion,telefono)VALUES('ITUZAINGO',250,'Lavalle 868',1133445566); 
INSERT INTO hospital (nombre,camas,direccion,telefono)VALUES('CASTELAR',400,'Almafuerte 2870',1144556677); 
INSERT INTO hospital (nombre,camas,direccion,telefono)VALUES('MORON',650,'Paraná 187',1155667788); 
INSERT INTO hospital (nombre,camas,direccion,telefono)VALUES('CASEROS',300,'Hornos 3000',1166778899);

INSERT INTO especialidad (especialidad_tipo)VALUES('clinica medica');
INSERT INTO especialidad (especialidad_tipo)VALUES('enfermero');
INSERT INTO especialidad (especialidad_tipo)VALUES('cirujano');
INSERT INTO especialidad (especialidad_tipo)VALUES('radiólogo');
INSERT INTO especialidad (especialidad_tipo)VALUES('camillero');

INSERT INTO categoria (tipo,sueldo_basico,carga_horaria)VALUES('director',420000,12);
INSERT INTO categoria (tipo,sueldo_basico,carga_horaria)VALUES('jefe sala',400000,12);
INSERT INTO categoria (tipo,sueldo_basico,carga_horaria)VALUES('coordinador',420000,12);
INSERT INTO categoria (tipo,sueldo_basico,carga_horaria)VALUES('residente',220000,12);
INSERT INTO categoria (tipo,sueldo_basico,carga_horaria)VALUES('supervisor',400500,12);

INSERT INTO profesional (nombre,apellido,dni,tipo_dni,fecha_ingreso,categoria_profesional,especialidad_profesional)VALUES('marcelo','pacheco',31555082,'tarjeta',20/10/2020,1,3);
INSERT INTO profesional (nombre,apellido,dni,tipo_dni,fecha_ingreso,categoria_profesional,especialidad_profesional)VALUES('agustin','lucero',29505401,'tarjeta',20/10/2020,1,1);
INSERT INTO profesional (nombre,apellido,dni,tipo_dni,fecha_ingreso,categoria_profesional,especialidad_profesional)VALUES('marco','roca',31555082,'dni celeste',20/10/2020,1,3);
INSERT INTO profesional (nombre,apellido,dni,tipo_dni,fecha_ingreso,categoria_profesional,especialidad_profesional)VALUES('martin','peralta',31555082,'dni-verde',20/10/2020,1,1);
INSERT INTO profesional (nombre,apellido,dni,tipo_dni,fecha_ingreso,categoria_profesional,especialidad_profesional)VALUES('lorenzo','juarez',31555082,'libreta',20/10/2020,1,3);

INSERT INTO hospital_profesional(hospital,director_profesional)VALUES(1,1);
INSERT INTO hospital_profesional(hospital,director_profesional)VALUES(2,2);
INSERT INTO hospital_profesional(hospital,director_profesional)VALUES(3,3);
INSERT INTO hospital_profesional(hospital,director_profesional)VALUES(4,4);
INSERT INTO hospital_profesional(hospital,director_profesional)VALUES(5,5);
--punto 4
ALTER TABLE hospital ADD contacto VARCHAR2(30)
--punto 5

CREATE TABLE laboratorio(
--necesito:
--codigo lab
--nombre
--ubicacion deposito
--telefonos
laboratorio_id  NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nombre          VARCHAR2(20 CHAR) NOT NULL,
deposito        VARCHAR2(20 CHAR) NOT NULL

);

CREATE TABLE telefono (
    codigo_telefono            NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero                     NUMBER(10) NOT NULL,
    FOREIGN KEY (telefono_laboratorio ) REFERENCES laboratorio (laboratorio_id)
);
CREATE TABLE medicamento (
    medicamento_id             GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE)PRIMARY KEY,
    nombre                     VARCHAR2(20 CHAR) NOT NULL,
    presentacion               VARCHAR2(20 CHAR) NOT NULL,
    --punto 7
    FOREIGN KEY (medicamento_laboratorio) REFERENCES laboratorio (laboratorio_id)
);
-- punto 6
INSERT INTO laboratorio (nombre,deposito) VALUES ('franz','peru 1980');
INSERT INTO laboratorio (nombre,deposito) VALUES ('kriz','albardon 1980');

INSERT INTO telefono (numero,telefono_laboratorio) VALUES (1155224411,1);
INSERT INTO telefono (numero,telefono_laboratorio) VALUES (1155658411,2);

INSERT INTO medicamento (nombre,presentacion,medicamento_laboratorio) VALUES ('buscapina','comprimidos',1);
INSERT INTO medicamento (nombre,presentacion,medicamento_laboratorio) VALUES ('ibuprofeno','comprimidos',2);

--punto 8
DESCRIBE laboratorio;
DESCRIBE medicamento;

--punto 9 
SELECT * FROM hospital,especialidad,categoria,profesional,hospital_profesional,laboratorio,telefono,medicamento;

--punto 10
ALTER TABLE hospital DROP COLUMN camas;




