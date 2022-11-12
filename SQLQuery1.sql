/*Seccion de revision de Datos*/

SELECT * From Actividad; /*Listo*/

SELECT * FROM accion; /*Listo*/

SELECT * From bitacora;

SELECT * FROM comentario; /*Listo*/

SELECT * FROM detalleActividad;/*Listo*/

SELECT * FROM detalleGestion; /*Listo*/

SELECT * FROM gestion; /*Listo*/

SELECT * from persona; /*Listo*/

SELECT * FROM tipoPersona;/*Listo*/

SELECT persona.id,persona.nombres, persona.apellidos,persona.telefono,persona.nit,persona.dpi,persona.estado,persona.idTipoPersona,tipopersona.tipo,tipopersona.descripcion 
FROM persona INNER JOIN tipoPersona ON persona.idTipoPersona = tipoPersona.id;

SELECT persona.id,persona.nombres, persona.apellidos,tipopersona.tipo,tipopersona.descripcion 
FROM persona INNER JOIN tipoPersona ON persona.idTipoPersona = tipoPersona.id;

SELECT * FROM persona where estado = 1;

/*Seccion de insertar Datos a Tablas*/

/*Tabla Tipo Persona*/

INSERT INTO tipoPersona (tipo,descripcion,estado) Values ('Secretaria','Atiende al Cliente',1);
INSERT INTO tipoPersona (tipo,descripcion,estado) Values ('DBA','Gestion de Base de datos',1);
INSERT INTO tipoPersona (tipo,descripcion,estado) Values ('Jefe TI','Jefe del departamente de Soporte de sistemas',1);
INSERT INTO tipoPersona (tipo,descripcion,estado) Values ('Testing N1','Persona encargada de probar las funcionalidades',1);

/*Tabla Persona*/

INSERT INTO persona (nombres,apellidos,telefono,nit,dpi,estado,idTipoPersona) VALUES ('Katherine','Gonzales',25457896,6547896,123645876532,1,3);
INSERT INTO persona (nombres,apellidos,telefono,nit,dpi,estado,idTipoPersona) VALUES ('Juan','Ramirez',45326598,54123654,5412654891265,0,6);
INSERT INTO persona (nombres,apellidos,telefono,nit,dpi,estado,idTipoPersona) VALUES ('Romero','Gudiel',54879654,2365489,6523965858745,1,2);
INSERT INTO persona (nombres,apellidos,telefono,nit,dpi,estado,idTipoPersona) VALUES ('Jaime','Ambrosio',54219875,1236548,123689655487,1,5);
INSERT INTO persona (nombres,apellidos,telefono,nit,dpi,estado,idTipoPersona) VALUES ('Vanesa','Alonzo',50050005,2323567,253625372539,1,4);

/*Tabla Gestion*/

INSERT INTO gestion (nombre,descripcion,idSupervisor,fecha,estado) VALUES ('Inicio del proyecto','Primera fase del proyecto',4,'06-15-2022',1);
INSERT INTO gestion (nombre,descripcion,idSupervisor,fecha,estado) VALUES ('Primera fase del proyecto','Planeacion',4,'07-06-2022',1);
INSERT INTO gestion (nombre,descripcion,idSupervisor,fecha,estado) VALUES ('Propuestas','Recolecion de propuestas de los imvolucrados al proyecto',6,'07-27-2022',1);
INSERT INTO gestion (nombre,descripcion,idSupervisor,fecha,estado) VALUES ('Ventas','Vender proyecto ya finalizados para la recoleccion de recursos',1,'05-08-2022',1);
INSERT INTO gestion (nombre,descripcion,idSupervisor,fecha,estado) VALUES ('Gestion','Gestion de las actividades y agendacion',2,'02-08-2022',1);

/*Tabla Comentarios*/

INSERT INTO comentario (comentario,idPersona,idGestion,fecha,estado) VALUES ('Comentario 1',1,10,'07/06/2022',1);
INSERT INTO comentario (comentario,idPersona,idGestion,fecha,estado) VALUES ('Comentario 2',3,12,'06/25/2022',0);
INSERT INTO comentario (comentario,idPersona,idGestion,fecha,estado) VALUES ('Comentario 3',5,12,'08/30/2022',1);
INSERT INTO comentario (comentario,idPersona,idGestion,fecha,estado) VALUES ('Comentario 4',4,11,'09/15/2022',1);
INSERT INTO comentario (comentario,idPersona,idGestion,fecha,estado) VALUES ('Comentario 5',2,14,'10/15/2022',1);

/*Tabla Detalle Gestio*/

INSERT INTO detalleGestion (porcentaje,fechaInicio,fechaFin,idOperador,idGestion,idActividad,estado) VALUES (50,'02/15/2022','06/28/2022',2,10,16,1);

/*Tabla Detalle Actividad*/

INSERT INTO detalleActividad (idDetalleGestion,idAccion,porcentaje,fechaInicio,fechaFin,estado) VALUES (3,3,50,'05/12/2022','06/15/2022',1);

/*Modificacion de Tablas*/

DELETE from accion where id between 30 and 34;

INSERT INTO accion(nombre,descripcion,estado) Values ('PROGRAMADOR', 'El que programa',1); 

DELETE FROM gestion where id = 5;

UPDATE accion set estado = 1 where id between 17 and 23;
