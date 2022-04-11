/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  migchav
 * Created: 11 abr. 2022
 */

drop table USUARIO;

create table USUARIO (
    ID INTEGER  AUTO_INCREMENT,
    NOMBREUSUARIO varchar(50) NOT NULL,
    CONTRASENA varchar(50) NOT NULL,
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





