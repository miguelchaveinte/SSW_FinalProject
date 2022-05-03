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
INSERT INTO USUARIO VALUES (2,'mariaBD','87654321','maria@gmial.com','Maria','Gonzalez','664357239',true,'Mateo Seoane 11 1º A','Administrador Bases de Datos','España','Valladolid','1982-10-05','Me encanta aprender!');
INSERT INTO USUARIO (ID,NOMBREUSUARIO,CONTRASEÑA,CORREO) VALUES (3,'Roberr','1122334455','rober@gmail.com');
INSERT INTO USUARIO (ID,NOMBREUSUARIO,CONTRASEÑA,CORREO) VALUES (4,'natti','8595949','natalia@gmail.com');

INSERT INTO CURSO VALUES (1,'Java Script Avanzado','Curso avanzado sobre java script',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\javas.png'),20,'PROGRAMACION_WEB',1);
INSERT INTO CURSO VALUES (2,'SQL Intermedio','Curso intermedio sobre sql',5.99,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sql.jpg'),15,'BASES_DE_DATOS',2);
INSERT INTO CURSO VALUES (3,'Python','Curso iniciacion a python',3.99,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\python.png'),4,'APRENDE_A_PROGRAMAR',1);
INSERT INTO CURSO VALUES (4,'C++','Curso de iniciacion a c++',9.99,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\c++1.jpg'),10,'APRENDE_A_PROGRAMAR',2);
INSERT INTO CURSO VALUES (5,'HTML','Curso de nivel intermedio sobre html',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\html1.png'),4,'PROGRAMACION_WEB',1);
INSERT INTO CURSO VALUES (6,'Linux','Curso sobre instalacion, problemas y manejo de linux',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\linux.jpeg'),4,'SISTEMAS_OPERATIVOS',2);
INSERT INTO CURSO VALUES (7,'CSS','Curso sobre css',0,LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\css.png'),4,'PROGRAMACION_WEB',1);

INSERT INTO DESARROLLOCURSO VALUES ('2022-04-10',3,1,4.3);
INSERT INTO DESARROLLOCURSO VALUES ('2022-04-9',4,2,4.5);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,3,4.7);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,4,4.1);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,5,4.8);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,6,4.9);
INSERT INTO DESARROLLOCURSO VALUES ('2022-03-15',4,7,4.6);

INSERT INTO CURSOFAVORITO VALUES (1,1);
INSERT INTO CURSOFAVORITO VALUES (1,2);
INSERT INTO CURSOFAVORITO VALUES (2,1);
INSERT INTO CURSOFAVORITO VALUES (3,1);

INSERT INTO SECCION VALUES (1,'Introduccion','Introduccion al js','https://onx.la/ba741',1.5,1);
INSERT INTO SECCION VALUES (2,'Objetos','Objetos en js','https://n9.cl/wfp11',2.5,1);
INSERT INTO SECCION VALUES (3,'Mapas','Mapas en js','https://n9.cl/6yx9h',2,1);
INSERT INTO SECCION VALUES (4,'Clases','Clases en js','https://n9.cl/j1nhx',6,1);
INSERT INTO SECCION VALUES (5,'Depuracion','Depuracion en js','https://n9.cl/lr1an',10,1);

INSERT INTO SECCION VALUES (6,'Introduccion','Introduccion a sql','https://n9.cl/kzoey',1,2);
INSERT INTO SECCION VALUES (7,'Creacion tablas','Creacion de tablas en sql','https://n9.cl/s8pxj',3,2);
INSERT INTO SECCION VALUES (8,'Modificacion tablas','Modificacion de tablas en sql','https://n9.cl/y9w4b',3,2);
INSERT INTO SECCION VALUES (9,'Consultas','Consultas de datos en sql','https://n9.cl/vqnsd',8,2);

INSERT INTO SECCION VALUES(10,'Introduccion','Introduccion a python','https://n9.cl/5107r',1,3);
INSERT INTO SECCION VALUES(11,'Hello World','Tu primer programa basico en python','https://n9.cl/m4xqm',1,3);
INSERT INTO SECCION VALUES(12,'Tipos de datos','Tipos de datos en python','https://n9.cl/2yhw6',1,3);
INSERT INTO SECCION VALUES(13,'Listas','Listas en python','https://n9.cl/3zoqb',1,3);

INSERT INTO SECCION VALUES(14,'Introduccion','Introduccion a c++','https://n9.cl/0zki2',2,4);
INSERT INTO SECCION VALUES(15,'Hello World','Tu primer programa basico en c++','https://n9.cl/0zki2',2,4);
INSERT INTO SECCION VALUES(16,'Tipos de datos','Tipos de datos en c++','https://n9.cl/9scvj',2,4);
INSERT INTO SECCION VALUES(17,'Arrays','Arrays en c','https://n9.cl/0zki2',2,4);
INSERT INTO SECCION VALUES(18,'Estructuras','Estructuras de datos en c++','https://n9.cl/boz1v',2,4);
INSERT INTO SECCION VALUES(19,'Punteros','Punteros en c++','https://n9.cl/0zki2',3,4);

INSERT INTO SECCION VALUES(20,'Introduccion','Introduccion a HTML','https://n9.cl/gjw1y',1,5);
INSERT INTO SECCION VALUES(21,'Formularios','Formularios en HTML','https://n9.cl/boz1v',1,5);
INSERT INTO SECCION VALUES(22,'Tablas','Tablas en HTML','https://n9.cl/5qika',1,5);
INSERT INTO SECCION VALUES(23,'Div','Etiquieta div en HTML','https://n9.cl/vx6n4',1,5);

INSERT INTO SECCION VALUES(24,'Introduccion','Introduccion al sistema operativo Linux','https://n9.cl/a0nrt',1,6);
INSERT INTO SECCION VALUES(25,'Instalacion','Instalacion del SO Linux','https://n9.cl/42up5',1,6);
INSERT INTO SECCION VALUES(26,'Comandos basicos','Comandos basicos utiles en terminal de linux','https://n9.cl/evkc6',1,6);
INSERT INTO SECCION VALUES(27,'Comandos avanzados','Comandos avanzados utiles en terminal de linux','https://n9.cl/a3ycim',1,6);

INSERT INTO SECCION VALUES(28,'Introduccion','Introduccion a CSS','https://n9.cl/25gfl',1,7);
INSERT INTO SECCION VALUES(29,'Sintaxis','Sintaxis en CSS','https://n9.cl/gjw1y',1,7);
INSERT INTO SECCION VALUES(30,'Selectores','Selectores en CSS','https://n9.cl/boz1v',1,7);
INSERT INTO SECCION VALUES(31,'Colores','Colores en CSS','https://n9.cl/vx6n4',1,7);


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


