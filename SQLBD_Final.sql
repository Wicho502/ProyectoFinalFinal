CREATE TABLE bitacora(
	id int identity(1,1) primary key not null,
	tabla varchar(250) not null,
	idTabla int not null,
	camposJson varchar(max) null,
	usuario int null,
	fecha datetime null,
);

Select * From bitacora;

CREATE TABLE tipoPersona(	
	id int identity(1,1) primary key not null,
	tipo varchar(100) not null,
	descripcion varchar(max) null,
	estado int not null
);

Select * From tipoPersona;

CREATE TABLE persona(
	id int identity (1,1) primary key not null,
	nombres varchar(250) not null,
	apellidos varchar(250) not null,
	telefono varchar(20) not null,
	nit varchar(20) not null,
	dpi varchar(20) not null,
	estado int not null,
	idTipoPersona int null,
	FOREIGN KEY (idTipoPersona) REFERENCES tipoPersona(id)
);

Select * From persona;

CREATE TABLE actividad(	
	id int identity(1,1) primary key not null,
	nombre varchar(100) not null,
	descripcion varchar(max) null,
	estado int not null
);

Select * From actividad;

CREATE TABLE accion(	
	id int identity(1,1) primary key not null,
	nombre varchar(100) not null,
	descripcion varchar(max) null,
	estado int not null
);

Select * From accion;

CREATE TABLE gestion(
	id int identity(1,1) primary key not null,
	nombre varchar(100) not null,
	descripcion varchar(max) null,
	idSupervisor int not null,
	fecha datetime null,
	estado int not null,
	FOREIGN KEY (idSupervisor) REFERENCES persona(id)

);

Select * From gestion;

CREATE TABLE comentario(
	id int identity(1,1) primary key not null,
	comentario varchar(max) null,
	idPersona int not null,
	idGestion int not null,
	fecha datetime not null,
	estado int not null,
	FOREIGN KEY (idPersona) REFERENCES persona(id),
	FOREIGN KEY (idGestion) REFERENCES gestion(id)
);

Select * From comentario;

CREATE TABLE detalleGestion(
	id int identity(1,1) primary key not null,
	porcentaje float not null,
	fechaInicio datetime not null,
	fechaFin datetime null,
	idOperador int not null,
	idGestion int not null,
	idActividad int not null,
	estado int not null,
	FOREIGN KEY (idOperador) REFERENCES persona(id),
	FOREIGN KEY (idGestion) REFERENCES gestion(id),
	FOREIGN KEY (idActividad) REFERENCES actividad(id)
);

Select * From detalleGestion;

CREATE TABLE detalleActividad(
	id int identity(1,1) primary key not null,
	idDetalleGestion int not null,
	idAccion int not null,
	porcentaje float not null,
	fechaInicio datetime not null,
	fechaFin datetime null,
	estado int not null,
	FOREIGN KEY (idDetalleGestion) REFERENCES detalleGestion(id),
	FOREIGN KEY (idAccion) REFERENCES accion(id)
);

Select * fRom detalleActividad;