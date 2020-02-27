CREATE DATABASE TRUEKASA_tarea5;
USE TRUEKASA_tarea5;

CREATE TABLE ESPECIALIDAD(
codigo char(2) PRIMARY KEY,
nombre varchar(60)
);

CREATE TABLE USUARIO(
numero char(3) PRIMARY KEY,
nombre varchar(20),
apellidos varchar(40),
direccion varchar(40),
poblacion varchar(40),
puntos_acumulados smallint unsigned,
valoracion_total float,
especialista char(3),
CONSTRAINT usu_esp_FK FOREIGN KEY (especialista) REFERENCES ESPECIALIDAD(codigo) ON DELETE CASCADE);

CREATE TABLE TECNICO(
numero char(2) PRIMARY KEY,
nombre varchar(50));

CREATE TABLE INCIDENCIA(
ID char(9) PRIMARY KEY,
descripcion varchar(200),
estado enum('Abierta','Aprobada','Adjudicada','Finalizada'),
puntos_coste smallint unsigned,
num_cliente char(3),
f_abierta date,
num_repara char(3),
f_repara date,
valoracion_reparacion tinyint unsigned,
n_tecnico char(2),
f_aprobada date,
CONSTRAINT inc_cli_FK FOREIGN KEY (num_cliente) REFERENCES USUARIO(numero) ON DELETE SET NULL,
CONSTRAINT inc_rep_FK FOREIGN KEY (num_repara) REFERENCES USUARIO(numero) ON DELETE SET NULL,
CONSTRAINT inc_tec_FK FOREIGN KEY (n_tecnico) REFERENCES TECNICO(numero) ON DELETE SET NULL);

/* Tablas auxiliares: REPARACIONES Y RANKING_ESPECIALIDADES*/
CREATE TABLE REPARACIONES(
ID char(9) PRIMARY KEY,
descripcion varchar(200),
estado varchar(20),
puntos_coste smallint unsigned,
num_cliente char(3),
f_abierta date,
num_repara char(3),
f_repara date,
valoracion_reparacion tinyint unsigned,
n_tecnico char(2),
f_aprobada date,
num_dias_reparacion SMALLINT UNSIGNED);

CREATE TABLE RANKING_ESPECIALIDADES(
nomEspecialidad varchar(30),
cantidad_incidencias SMALLINT,
media_dias_reparacion SMALLINT
);


/* VALORES EN TABLA ESPECIALIDAD */
INSERT INTO ESPECIALIDAD VALUES ('11','Albañilería');
INSERT INTO ESPECIALIDAD VALUES ('22','Fontanería');
INSERT INTO ESPECIALIDAD VALUES ('33','Electricidad');
INSERT INTO ESPECIALIDAD VALUES ('44','Carpintería');
INSERT INTO ESPECIALIDAD VALUES ('55','Pintura');

/* VALORES EN TABLA USUARIO */
INSERT INTO USUARIO VALUES ('101','Luis','Ramírez Pardo','C/Piedra,48','Roquetas de Mar',100,null,'11');
INSERT INTO USUARIO VALUES ('102','María','Sánchez Cid','C/Lourdes,8','Las Marinas',50,null,'22');
INSERT INTO USUARIO VALUES ('103','Martín','Guerrero López','C/Plutón,2','Aguadulce',50,null,'33');
INSERT INTO USUARIO VALUES ('104','Úrsula','Delta Camacho','C/Singular,109','Aguadulce',300,null,'11');
INSERT INTO USUARIO VALUES ('105','Carmen','Hernández Pío','C/Sol Naciente,29','El Parador',50,null,'22');
INSERT INTO USUARIO VALUES ('106','Pedro','Jiménez Ruiz','C/Estanislao,9','Vicar',1200,null,'33');
INSERT INTO USUARIO VALUES ('107','Raúl','Rodrigo Roca','C/Salvatore,1','El Ejido',125,null,'44');
INSERT INTO USUARIO VALUES ('108','Soledad','Campillo Molina','C/Paraiso,33','El Ejido',20,null,'11');
INSERT INTO USUARIO VALUES ('109','María Luisa','Galdón Ter','C/Castelar,3','Almería',360,null,'22');
INSERT INTO USUARIO VALUES ('110','Piedad','Colmenero Zapillo','C/Gran vía,100','Almería',100,null,'55');
INSERT INTO USUARIO VALUES ('111','Sergio','Lérida Campos','C/Piesuerga,1','Almería',100,null,'22');
INSERT INTO USUARIO VALUES ('112','Manuel','Domingo Serrano','C/Palamós,23','Las Marinas',50,null,'44');

/* VALORES EN TABLA TÉCNICO */
INSERT INTO TECNICO VALUES ('10','Juan Pedro Morales Peña');
INSERT INTO TECNICO VALUES ('20','Sandra Soler Martínez');
INSERT INTO TECNICO VALUES ('30','Mariano Úbeda Fernández');

/* VALORES EN TABLA INCIDENCIA */
INSERT INTO INCIDENCIA VALUES ('2019-0001','Pintar habitación 20m2','Abierta',30,'101','2019-12-19',null,null,null,'10',null);
INSERT INTO INCIDENCIA VALUES ('2019-0002','Arreglar escalones puerta de la calle','Aprobada',60,'101','2019-12-01',null,null,null,'30','2019-12-03');
INSERT INTO INCIDENCIA VALUES ('2019-0003','Pintar escaleras 60m','Adjudicada',80,'105','2019-11-30','110',null,null,'10','2019-12-03');
INSERT INTO INCIDENCIA VALUES ('2019-0004','Cambiar azulejos y sanitarios cuarto baño','Adjudicada',1250,'112','2019-11-10','104',null,null,'30','2019-11-12');
INSERT INTO INCIDENCIA VALUES ('2019-0005','Instalar fontanería cuarto baño','Adjudicada',550,'112','2019-11-10','102',null,null,'30','2019-11-12');
INSERT INTO INCIDENCIA VALUES ('2019-0006','Cambiar 8 puertas','Adjudicada',30,'104','2019-11-24','112',null,null,'20','2019-11-29');
INSERT INTO INCIDENCIA VALUES ('2019-0007','Cambiar grifería cuarto baño','Abierta',20,'109','2019-12-20',null,null,null,'20',null);
INSERT INTO INCIDENCIA VALUES ('2019-0008','Pintar techo cuarto baño 2m2','Finalizada',25,'109','2019-10-15','110','2019-11-30',9,'10','2019-10-18');
INSERT INTO INCIDENCIA VALUES ('2019-0009','Poner 10 tomas de enchufe en 4 habitaciones','Finalizada',120,'106','2019-10-12','108','2019-10-20',8,'20','2019-10-14');
INSERT INTO INCIDENCIA VALUES ('2019-0010','Lijar y barnizar mesa madera salon 3m','Finalizada',50,'103','2019-09-04','112','2019-09-17',7,'10','2019-09-07');
INSERT INTO INCIDENCIA VALUES ('2019-0011','Pintar toda la casa 100m2','Finalizada',200,'108','2019-08-19','110','2019-09-03',6,'10','2019-08-22');
INSERT INTO INCIDENCIA VALUES ('2019-0012','Desembozar pila fregadero cocina','Aprobada',25,'106','2019-12-21',null,null,null,'10','2019-12-23');
INSERT INTO INCIDENCIA VALUES ('2019-0013','Cambiar cuadro fusibles','Finalizada',80,'105','2019-07-10','103','2019-07-25',10,'30','2019-07-15');
INSERT INTO INCIDENCIA VALUES ('2019-0014','Poner focos luz en techo cocina','Aprobada',40,'111','2019-12-06',null,null,null,'20','2019-12-10');
INSERT INTO INCIDENCIA VALUES ('2019-0015','Hacer tabique ladrillo para separar dos habitaciones','Finalizada',300,'108','2019-06-19','104','2019-06-30',8,'20','2019-06-20');
