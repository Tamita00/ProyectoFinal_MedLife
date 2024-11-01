CREATE PROCEDURE CrearPerfil 
	 @nombre VARCHAR(1000),
	 @apellido VARCHAR(1000),
	 @email VARCHAR(1000),
	 @telefono INT, 
	 @idHospital INT, 
	 @lectura BIT, 
	 @edicion BIT, 
	 @impresion BIT,
	 @contrasena VARCHAR(15), 
	 @activo BIT
AS
BEGIN
	INSERT INTO Perfil (Nombre, Apellido, Email, Telefono, IdHospital, LecturaPermiso, EdicionPermiso, ImpresionPermiso, Contrasena, MantenerActivo)
		VALUES(@nombre, @apellido, @email, @telefono, @idHospital, @lectura, @edicion, @impresion, @contrasena, @activo)
END
GO
