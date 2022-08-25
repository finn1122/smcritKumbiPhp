CREATE DATABASE smcrit CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE smcrit;

CREATE TABLE  smcrit . c_area (
 fl_area int(11) AUTO_INCREMENT NOT NULL
,nb_area varchar(50) COLLATE utf8_spanish_ci NOT NULL
,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
,fg_activo int(1) NOT NULL
,ds_area varchar(120) COLLATE utf8_spanish_ci NOT NULL
,CONSTRAINT pkc_area PRIMARY KEY (fl_area));

CREATE TABLE smcrit . c_crit (
 fl_crit int(11) AUTO_INCREMENT NOT NULL
,nb_crit varchar(20) COLLATE utf8_spanish_ci NOT NULL
,cl_crit varchar(7) COLLATE utf8_spanish_ci NOT NULL
,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
,fg_activo int(1) NOT NULL
,ds_crit varchar(120) COLLATE utf8_spanish_ci NOT NULL
,CONSTRAINT pkc_crit PRIMARY KEY (fl_crit));

CREATE TABLE smcrit . c_ubicacion (
 fl_ubicacion int(11) AUTO_INCREMENT  NOT NULL
,nb_ubicacion varchar(30) COLLATE utf8_spanish_ci NOT NULL
,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
,no_oficina int(3) NOT NULL
,fl_crit int(11) NOT NULL
,fg_activo int(1) NOT NULL
,ds_ubicacion varchar(120) COLLATE utf8_spanish_ci NOT NULL
,CONSTRAINT pkc_ubicacion PRIMARY KEY (fl_ubicacion)
,CONSTRAINT fkc_crit_c_ubicacion FOREIGN KEY (fl_crit)
  REFERENCES c_crit (fl_crit));

CREATE TABLE smcrit . c_dispositivo (
  fl_dispositivo int(11) AUTO_INCREMENT  NOT NULL
 ,nb_dispositivo varchar(30) COLLATE utf8_spanish_ci NOT NULL
 ,nb_modelo varchar(30) COLLATE utf8_spanish_ci NOT NULL
 ,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
 ,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
 ,fg_activo int(1) NOT NULL
 ,fl_ubicacion int(11) NOT NULL
 ,ds_dispositivo varchar(120) COLLATE utf8_spanish_ci NOT NULL
 ,CONSTRAINT pkc_dispositivo PRIMARY KEY (fl_dispositivo)
 ,CONSTRAINT fkc_ubicacion_c_ubicacion FOREIGN KEY (fl_ubicacion)
   REFERENCES c_ubicacion (fl_ubicacion));

CREATE TABLE smcrit . c_t_sensor (
  fl_t_sensor int(11) AUTO_INCREMENT  NOT NULL
 ,nb_sensor varchar(30) COLLATE utf8_spanish_ci NOT NULL
 ,nb_modelo varchar(30) COLLATE utf8_spanish_ci NOT NULL
 ,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
 ,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
 ,fg_activo int(1) NOT NULL
 ,fg_encendido int(1) NOT NULL
 ,ds_t_sensor varchar(120) COLLATE utf8_spanish_ci NOT NULL
 ,CONSTRAINT pkc_t_sensor PRIMARY KEY (fl_t_sensor));


CREATE TABLE smcrit . r_monitoreo (
  fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
  fl_monitoreo int(11)  NOT NULL
 ,no_valor float NOT NULL
 ,fe_registro timestamp NOT NULL DEFAULT current_timestamp()
 ,fl_t_sensor int(11) NOT NULL
 ,fl_dispositivo int(11) NOT NULL
 ,CONSTRAINT pkr_monitoreo PRIMARY KEY (fl_monitoreo)
 ,CONSTRAINT fkc_dispositivo_r_monitoreo FOREIGN KEY (fl_dispositivo)
   REFERENCES c_dispositivo (fl_dispositivo)
 ,CONSTRAINT fkc_t_sensor_r_monitoreo FOREIGN KEY (fl_t_sensor)
   REFERENCES c_t_sensor (fl_t_sensor));

 CREATE TABLE smcrit . c_rol (
   fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
  fl_rol int(11)  NOT NULL
 ,nb_rol varchar(15) COLLATE utf8_spanish_ci NOT NULL
 ,fg_activo int(1) NOT NULL
 ,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
 ,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
 ,ds_rol varchar(120) COLLATE utf8_spanish_ci NOT NULL
 ,CONSTRAINT pkc_rol PRIMARY KEY (fl_rol));

CREATE TABLE smcrit . c_usuario (
  fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
 fl_usuario int(11)  NOT NULL
,nb_usuario varchar(30) COLLATE utf8_spanish_ci NOT NULL
,nb_apaterno varchar(30) COLLATE utf8_spanish_ci NOT NULL
,nb_amaterno varchar(30) COLLATE utf8_spanish_ci NOT NULL
,nb_puesto varchar(50) COLLATE utf8_spanish_ci NOT NULL
,fl_area int(11) NOT NULL
,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
,fg_activo int(1) NOT NULL
,nb_login varchar(30) COLLATE utf8_spanish_ci NOT NULL
,nb_contrasenia varchar(16) COLLATE utf8_spanish_ci NOT NULL
,fl_rol int(11) NOT NULL
,ds_usuario varchar(120) COLLATE utf8_spanish_ci NOT NULL
,CONSTRAINT pkc_usuario PRIMARY KEY (fl_usuario)
,CONSTRAINT fkc_area_c_usuario FOREIGN KEY(fl_area)
 REFERENCES c_area (fl_area)
, CONSTRAINT fkc_rol_c_usuario FOREIGN KEY(fl_rol)
 REFERENCES c_rol (fl_rol) );

CREATE TABLE smcrit . r_login (
  fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
 fl_login int(11)  NOT NULL
,fe_login timestamp NOT NULL DEFAULT current_timestamp()
,fl_usuario int(11) NOT NULL
,nb_usuaio varchar(30) COLLATE utf8_spanish_ci NOT NULL
,CONSTRAINT pkr_login PRIMARY KEY (fl_login)
,CONSTRAINT fkc_usuario_r_login FOREIGN KEY (fl_usuario)
  REFERENCES c_usuario (fl_usuario));


CREATE TABLE smcrit . r_alerta (
  fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
  fl_alerta int(11)  NOT NULL
 ,fl_dispositivo int(11) NOT NULL
 ,no_valor float NOT NULL
 ,fl_t_sensor int(11) NOT NULL
 ,fe_registro timestamp NOT NULL DEFAULT current_timestamp()
 ,fg_activo int(1) NOT NULL
 ,CONSTRAINT pkr_alerta PRIMARY KEY (fl_alerta)
 ,CONSTRAINT fkc_dispositivo_r_alerta FOREIGN KEY (fl_dispositivo)
    REFERENCES c_dispositivo (fl_dispositivo)
 ,CONSTRAINT fkc_t_sensor_r_alerta FOREIGN KEY (fl_t_sensor)
   REFERENCES c_t_sensor (fl_t_sensor));

CREATE TABLE smcrit . c_asignacion_dispositivos (
  fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
  fl_asigncacion int(11)  NOT NULL
 ,fl_dispositivo int(11) NOT NULL
 ,fl_usuario int(11) NOT NULL
 ,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
 ,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
 ,fg_activo int(1) NOT NULL
 ,CONSTRAINT pkc_asignacion PRIMARY KEY (fl_asigncacion)
 ,CONSTRAINT fkc_dispositivo_c_asignacion FOREIGN KEY (fl_dispositivo)
   REFERENCES c_dispositivo (fl_dispositivo)
 ,CONSTRAINT fkc_usuario_c_asignacion FOREIGN KEY (fl_usuario)
   REFERENCES c_usuario (fl_usuario));


CREATE TABLE smcrit . c_correo (
  fl_t_sensor int(11) AUTO_INCREMENT NOT NULL
 fl_correo int(11)  NOT NULL
 ,nb_correo varchar(30) COLLATE utf8_spanish_ci NOT NULL
 ,fl_usuario int(11) NOT NULL
 ,fe_creacion timestamp NOT NULL DEFAULT current_timestamp()
 ,fe_ultimod timestamp NOT NULL DEFAULT current_timestamp()
 ,fg_activo int(1) NOT NULL
 ,ds_correo varchar(120) COLLATE utf8_spanish_ci NOT NULL
,CONSTRAINT pkc_correo PRIMARY KEY (fl_correo)
,CONSTRAINT fkc_usuario_c_correo FOREIGN KEY (fl_usuario)
 REFERENCES c_usuario (fl_usuario));
