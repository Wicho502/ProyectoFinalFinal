--CRUD
--CREAR
--LEER 
--ACTUALIZAR
--BORRAR
USE [PROYECTO_G3]
GO

--Procedimiendo TipoPersona

CREATE PROCEDURE crudTipoPersona

	@id int = null,
	@tipo varchar(100) = null,
	@descripcion varchar(max)= null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO tipoPersona(tipo, descripcion, estado) VALUES (@tipo, @descripcion,@estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE TipoPersona SET tipo = @tipo, descripcion = @descripcion, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE TipoPersona SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM TipoPersona;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM TipoPersona Where id=@id;
	END
END

GO

--Procedimiendo Persona

CREATE PROCEDURE crudPersona

	@id int = null,
	@nombres varchar(250) = null,
	@apellidos varchar(250) = null,
	@telefono varchar(20) = null,
	@nit varchar(20) = null,
	@dpi varchar(20) = null,
	@estado int = null,
	@idTipoPersona int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO Persona(nombres, apellidos, telefono, nit, dpi, estado, idTipoPersona) VALUES (@nombres, @apellidos, @telefono, @nit, @dpi, @estado, @idTipoPersona);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE Persona SET nombres = @nombres, apellidos = @apellidos, telefono = @telefono, nit = @nit, dpi = @dpi, estado = @estado, idTipoPersona = @idTipoPersona WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE Persona SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM Persona;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM Persona Where id=@id;
	END
END

GO

--Procedimiendo Actividad

CREATE PROCEDURE crudActividad

	@id int = null,
	@nombre varchar(100) = null,
	@descripcion varchar(max) = null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO actividad(nombre, descripcion, estado) VALUES (@nombre, @descripcion, @estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE actividad SET nombre = @nombre, descripcion=@descripcion, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE actividad SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM actividad;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM actividad Where id=@id;
	END
END

GO


--Procedimiendo Accion

CREATE PROCEDURE crudAccion

	@id int = null,
	@nombre varchar(100) = null,
	@descripcion varchar(max)= null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO accion(nombre,descripcion,estado) VALUES (@nombre, @descripcion, @estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE accion SET nombre = @nombre, descripcion = @descripcion, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE accion SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM accion;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM accion Where id=@id;
	END
END

GO

--Procedimiendo Gestion

CREATE PROCEDURE crudGestion

	@id int = null,
	@nombre varchar(100) =null,
	@descripcion varchar(max) = null,
	@idSupervisor int = null,
	@fecha datetime = null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO gestion(nombre, descripcion,idSupervisor,fecha,estado) VALUES (@nombre, @descripcion,@idSupervisor,@fecha, @estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE gestion SET nombre = @nombre, descripcion = @descripcion, idsupervisor = @idsupervisor, fecha = @fecha, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE gestion SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM gestion;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM gestion Where id=@id;
	END
END

GO

--Procedimiendo Comentario

CREATE PROCEDURE crudComentario

	@id int = null,
	@comentario varchar(max)= null,
	@idPersona int = null,
	@idGestion int = null,
	@fecha datetime = null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO comentario(comentario, idPersona,idGestion,fecha,estado) VALUES (@comentario, @idPersona, @idGestion,@fecha, @estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE comentario SET comentario = @comentario, idPersona = @idPersona, idGestion = @idGestion, fecha = @fecha, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE comentario SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM comentario;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM comentario Where id=@id;
	END
END

GO

--Procedimiendo Detalle Gestion

CREATE PROCEDURE crudDetalleGestion

	@id int = null,
	@porcentaje float = null,
	@fechaInicio datetime = null,
	@fechaFin datetime = null,
	@idOperador int = null,
	@idGestion int = null,
	@idActividad int = null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO detalleGestion(porcentaje, fechaInicio, fechaFin, idOperador,idGestion,idActividad,estado) VALUES (@porcentaje, @fechaInicio, @fechaFin,@idOperador,@idGestion,@idActividad, @estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE detalleGestion SET porcentaje = @porcentaje, fechaInicio = @fechaInicio, fechaFin = @fechaFin, idOperador=idOperador,idGestion=@idGestion,idActividad=@idActividad, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE detalleGestion SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM detalleGestion;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM detalleGestion Where id=@id;
	END
END

GO

--Procedimiendo Detalle Actividad

CREATE PROCEDURE crudDetalleActividad

	@id int = null,
	@idDetalleGestion int = null,
	@idAccion int = null,
	@porcentaje float = null,
	@fechaInicio datetime = null,
	@fechaFin datetime = null,
	@estado int = null,
	@opcion int

--Ingreso de Datos
AS
BEGIN
	IF @opcion = 1
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO detalleActividad(idDetalleGestion, idAccion,porcentaje,fechaInicio,fechaFin,estado) VALUES (@idDetalleGestion,@idAccion,@porcentaje,@fechaInicio,@fechaFin, @estado);
		COMMIT TRANSACTION
		SELECT @@IDENTITY;
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion de Datos
IF @opcion = 2
	BEGIN TRY
		 BEGIN TRANSACTION 
			UPDATE detalleActividad SET idDetalleGestion=@idDetalleGestion, idAccion=@idAccion, porcentaje = @porcentaje, fechaInicio = @fechaInicio, fechaFin = @fechaFin, estado = @estado WHERE id = @id;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Modificacion del Estado
	IF @opcion = 3
	BEGIN TRY
		UPDATE detalleActividad SET estado = @estado where id = @id;
	END TRY
		BEGIN CATCH
	ROLLBACK
	SELECT
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
	THROW
	END CATCH

--Consulta Tabla
	IF @opcion = 4
	BEGIN
		SELECT * FROM detalleActividad;
	END 

--Consulta por Id
	IF @opcion = 5
	BEGIN
		SELECT * FROM detalleActividad Where id=@id;
	END
END

GO

--Procedimiendo Biracora

CREATE PROCEDURE crudBitacora

	@id int = null,
	@tabla varchar(250) = null,
	@idTabla int = null,
	@camposJson varchar(max) = null,
	@usuario int = null,
	@fecha datetime = null,
	@opcion int
AS 
BEGIN
	
	IF @opcion = 1 
		BEGIN TRY
			BEGIN TRANSACTION
				INSERT INTO dbo.bitacora
					(tabla, idTabla, camposJson, usuario, fecha)
				VALUES
					(@tabla, @idTabla, @camposJson, @usuario, @fecha)		
				commit transaction
				SELECT @@identity AS id
			END TRY
				BEGIN CATCH
					ROLLBACK
					SELECT
						ERROR_NUMBER() AS ErrorNumber  
                        ,ERROR_SEVERITY() AS ErrorSeverity  
                        ,ERROR_STATE() AS ErrorState  
                        ,ERROR_PROCEDURE() AS ErrorProcedure  
                        ,ERROR_LINE() AS ErrorLine  
                        ,ERROR_MESSAGE() AS ErrorMessage;
					THROW
			END CATCH
	IF @opcion = 2 
		BEGIN TRY
		BEGIN TRANSACTION
		
			UPDATE dbo.bitacora  SET 
				tabla = @tabla,
				idTabla = @idTabla,
				camposJson = @camposJson,
				usuario = @usuario,
				fecha = @fecha
			WHERE id = @id
			COMMIT TRANSACTION 
			SELECT @@identity
		END TRY
			BEGIN CATCH
				--si se registra algun error se deshasen los cambios
				ROLLBACK
				--muestra un erro al tratar de insertar un registro
				SELECT
					ERROR_NUMBER() AS ErrorNumber  
                    ,ERROR_SEVERITY() AS ErrorSeverity  
                    ,ERROR_STATE() AS ErrorState  
                    ,ERROR_PROCEDURE() AS ErrorProcedure  
                    ,ERROR_LINE() AS ErrorLine  
                    ,ERROR_MESSAGE() AS ErrorMessage;
				THROW
		END CATCH
	IF @opcion = 4 
		BEGIN 
			SELECT 
				*
			FROM dbo.bitacora
		END
	IF @opcion = 5
		BEGIN 
			SELECT 
				*
			FROM dbo.bitacora
			WHERE id = @id
		END
END
GO
