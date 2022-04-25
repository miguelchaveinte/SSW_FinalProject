/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  migchav
 * Created: 11 abr. 2022
 */

drop table OBTENCIONSUSCRIPCION;
drop table SUSCRIPCION;
drop table DESARROLLOCURSO;
drop table DESARROLLOSECCION;
drop table CURSOFAVORITO;
drop table SECCION;
drop table CURSO;
drop table CATEGORIA;
drop table USUARIO;

create table CATEGORIA (
    NOMBRE varchar(50),

    PRIMARY KEY(NOMBRE)
);

create table USUARIO (
    ID INTEGER  AUTO_INCREMENT,
    NOMBREUSUARIO varchar(50) NOT NULL,
    CONTRASEÑA varchar(50) NOT NULL,
    CORREO varchar(50) NOT NULL,
    NOMBRE varchar(50),
    APELLIDO varchar(50),
    TELEFONO int,
    INSTRUCTOR boolean,
    DIRECCION varchar(50),
    OCUPACION varchar(50),
    PAIS varchar(50),
    CIUDAD varchar(50),
    FECHANACIMIENTO date,
    BIOGRAFIA varchar(200),
    
    PRIMARY KEY(ID)
);

create table CURSO (
    ID INTEGER AUTO_INCREMENT,
    NOMBRECURSO varchar(50) NOT NULL,
    DESCRIPCION varchar(200) NOT NULL,
    PRECIO float NOT NULL,
    IMAGEN blob NOT NULL,
    DURACION float NOT NULL,
    CATEGORIA varchar(50) NOT NULL,
    CREADOR INTEGER NOT NULL,
    
    PRIMARY KEY(ID),
    FOREIGN KEY(CREADOR) REFERENCES USUARIO(ID),
    FOREIGN KEY(CATEGORIA) REFERENCES CATEGORIA(NOMBRE)
);

create table DESARROLLOCURSO (
    FECHAINICIO date,
    IDUSUARIO INTEGER,
    IDCURSO INTEGER,
    VALORACION double,
    PRIMARY KEY(FECHAINICIO, IDUSUARIO, IDCURSO),
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(ID),
    FOREIGN KEY (IDCURSO) REFERENCES CURSO(ID)
);

create table CURSOFAVORITO (
    IDUSUARIO INTEGER,
    IDCURSO INTEGER,

    PRIMARY KEY(IDUSUARIO, IDCURSO),
    FOREIGN KEY(IDUSUARIO) REFERENCES USUARIO(ID),
    FOREIGN KEY(IDCURSO) REFERENCES CURSO(ID)
);

create table SECCION (
    ID INTEGER AUTO_INCREMENT,
    NOMBRE varchar(50) ,
    DESCRIPCION varchar(50),
    VIDEO varchar(50) NOT NULL,
    DURACION float NOT NULL,
    IDCURSO INTEGER,

    PRIMARY KEY(ID),
    FOREIGN KEY(IDCURSO) REFERENCES CURSO(ID)
);

create table DESARROLLOSECCION (
    IDSECCION INTEGER,
    IDUSUARIO INTEGER,
    COMPLETADA boolean,

    PRIMARY KEY(IDSECCION, IDUSUARIO),
    FOREIGN KEY(IDSECCION) REFERENCES SECCION(ID),
    FOREIGN KEY(IDUSUARIO) REFERENCES USUARIO(ID)
);

create table SUSCRIPCION (
    ID INTEGER AUTO_INCREMENT,
    TIPO ENUM('GRATIS','AUTOR','TOTAL','ESTUDIANTE') NOT NULL,
    PRECIO FLOAT NOT NULL,
    IDAUTOR INTEGER,

    PRIMARY KEY(ID),
    FOREIGN KEY(IDAUTOR) REFERENCES USUARIO(ID)
);

create table OBTENCIONSUSCRIPCION (
    FECHAINICIO date NOT NULL,
    COBRO ENUM('MENSUAL','ANUAL') NOT NULL,
    AUTORENOVAR boolean NOT NULL,
    IDUSUARIO INTEGER,
    IDSUSCRIPCION INTEGER,

    PRIMARY KEY(IDUSUARIO, IDSUSCRIPCION, FECHAINICIO),
    FOREIGN KEY(IDUSUARIO) REFERENCES USUARIO(ID),
    FOREIGN KEY(IDSUSCRIPCION) REFERENCES SUSCRIPCION(ID)
);

INSERT INTO CATEGORIA VALUES ('PROGRAMACION_WEB');
INSERT INTO CATEGORIA VALUES ('BASES_DE_DATOS');
INSERT INTO CATEGORIA VALUES ('PROGRAMACION_PARALELA');
INSERT INTO CATEGORIA VALUES ('SISTEMAS_OPERATIVOS');
INSERT INTO CATEGORIA VALUES ('PROGRAMACION_LOGICA');
INSERT INTO CATEGORIA VALUES ('APRENDE_A_PROGRAMAR');

INSERT INTO USUARIO VALUES (1,'AlfredoInf','12345678','alfredo@gmial.com','Alfredo','Martinez','654567888',true,'Manuel Azaña 44 5ºC','Programador','España','Valladolid','1987-12-12','Programador avanzado con ganas de aprender');
INSERT INTO USUARIO VALUES (2,'mariaBD','87654321','maria@gmial.com','Maria','Gonzalez','664357239',false,'Mateo Seoane 11 1º A','Administrador Bases de Datos','España','Valladolid','1982-10-05','Me encanta aprender!');
INSERT INTO USUARIO (ID,NOMBREUSUARIO,CONTRASEÑA,CORREO) VALUES (3,'Roberr','1122334455','rober@gmail.com');
INSERT INTO USUARIO (ID,NOMBREUSUARIO,CONTRASEÑA,CORREO) VALUES (4,'natti','8595949','natalia@gmail.com');

INSERT INTO CURSO VALUES (1,'Java Script Avanzado','Curso avanzado sobre java script',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\php.jfif'),20,'PROGRAMACION_WEB',1);
INSERT INTO CURSO VALUES (2,'SQL Intermedio','Curso intermedio sobre sql',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\php.jfif'),15,'BASES_DE_DATOS',1);
INSERT INTO CURSO VALUES (3,'Python','Curso iniciacion a python',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\php.jfif'),4,'APRENDE_A_PROGRAMAR',1);
INSERT INTO CURSO VALUES (4,'C++','Curso de iniciacion a c++',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\php.jfif'),10,'APRENDE_A_PROGRAMAR',1);
INSERT INTO CURSO VALUES (5,'HTML','Curso de nivel intermedio sobre html',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\python.jfif'),4,'PROGRAMACION_WEB',1);
INSERT INTO CURSO VALUES (6,'Linux','Curso sobre instalacion, problemas y manejo de linux',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\python.jfif'),15,'SISTEMAS_OPERATIVOS',1);
INSERT INTO CURSO VALUES (7,'a','Curso sobre instalacion, problemas aaay manejo de linux',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\java.jfif'),15,'SISTEMAS_OPERATIVOS',1);

INSERT INTO DESARROLLOCURSO VALUES ('2022-04-10',3,1,4.3);
INSERT INTO DESARROLLOCURSO VALUES ('2022-04-9',4,2,2.1);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,3,3.3);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,4,1.7);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,5,4.8);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,6,3.7);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,7,3.9);

INSERT INTO CURSOFAVORITO VALUES (1,1);
INSERT INTO CURSOFAVORITO VALUES (1,2);
INSERT INTO CURSOFAVORITO VALUES (2,1);
INSERT INTO CURSOFAVORITO VALUES (3,1);

INSERT INTO SECCION VALUES (1,'Introduccion','Introduccion al js','http://lnnk.in/aOg3',1.5,1);
INSERT INTO SECCION VALUES (2,'Objetos','Objetos en js','video',2.5,1);
INSERT INTO SECCION VALUES (3,'Mapas','Mapas en js','video',2,1);
INSERT INTO SECCION VALUES (4,'Clases','Clases en js','video',6,1);
INSERT INTO SECCION VALUES (5,'Depuracion','Depuracion en js','video',10,1);

INSERT INTO SECCION VALUES (6,'Introduccion','Introduccion a sql','video',1,2);
INSERT INTO SECCION VALUES (7,'Creacion tablas','Creacion de tablas en sql','video',3,2);
INSERT INTO SECCION VALUES (8,'Modificacion tablas','Modificacion de tablas en sql','video',3,2);
INSERT INTO SECCION VALUES (9,'Consultas','Consultas de datos en sql','video',8,2);

INSERT INTO SECCION VALUES(10,'Introduccion','Introduccion a python','video',3,1);
INSERT INTO SECCION VALUES(11,'Hello World','Tu primer programa basico en python','video',3,1);
INSERT INTO SECCION VALUES(12,'Tipos de datos','Tipos de datos en python','video',3,1);
INSERT INTO SECCION VALUES(12,'Listas','Listas en python','video',3,1);

INSERT INTO SECCION VALUES(13,'Introduccion','Introduccion a c++','video',4,1);
INSERT INTO SECCION VALUES(14,'Hello World','Tu primer programa basico en c++','video',4,1);
INSERT INTO SECCION VALUES(15,'Tipos de datos','Tipos de datos en c++','video',4,1);
INSERT INTO SECCION VALUES(16,'Arrays','Arrays en c','video',4,2);
INSERT INTO SECCION VALUES(17,'Estructuras','Estructuras de datos en c++','video',4,2);
INSERT INTO SECCION VALUES(18,'Punteros','Punteros en c++','video',4,3);

INSERT INTO SECCION VALUES(19,'Introduccion','Introduccion a HTML','video',5,1);
INSERT INTO SECCION VALUES(20,'Formularios','Formularios en HTML','video',5,1);
INSERT INTO SECCION VALUES(21,'Tablas','Tablas en HTML','video',5,1);
INSERT INTO SECCION VALUES(22,'Div','Etiquieta div en HTML','video',5,1);

INSERT INTO SECCION VALUES(23,'Introduccion','Introduccion al sistema operativo Linux','video',6,1);
INSERT INTO SECCION VALUES(23,'','','video',6,1);
INSERT INTO SECCION VALUES(23,'','','video',6,1);
INSERT INTO SECCION VALUES(23,'','','video',6,1);


INSERT INTO DESARROLLOSECCION VALUES (1,3,true);
INSERT INTO DESARROLLOSECCION VALUES (2,3,true);
INSERT INTO DESARROLLOSECCION VALUES (3,3,true);
INSERT INTO DESARROLLOSECCION VALUES (4,3,false);
INSERT INTO DESARROLLOSECCION VALUES (5,3,false);
INSERT INTO DESARROLLOSECCION VALUES (6,4,true);
INSERT INTO DESARROLLOSECCION VALUES (7,4,true);
INSERT INTO DESARROLLOSECCION VALUES (8,4,true);
INSERT INTO DESARROLLOSECCION VALUES (9,4,false);

INSERT INTO SUSCRIPCION VALUES (1,'GRATIS',0,null);
INSERT INTO SUSCRIPCION VALUES (2,'TOTAL',19.99,null);
INSERT INTO SUSCRIPCION VALUES (3,'ESTUDIANTE',9.99,null);
INSERT INTO SUSCRIPCION VALUES (4,'AUTOR',3.99,1);

INSERT INTO OBTENCIONSUSCRIPCION VALUES ('2022-5-04','MENSUAL',false,3,4);


