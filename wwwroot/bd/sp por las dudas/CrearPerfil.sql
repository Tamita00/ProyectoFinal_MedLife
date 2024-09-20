
CREATE PROCEDURE CrearPerfil
	 @Nombre VARCHAR(1000),
    @Apellido VARCHAR(1000),
    @Email VARCHAR(1000) = NULL,
    @Telefono INT,
    @IdHospital INT,
    @LecturaPermiso BIT,
    @EdicionPermiso BIT,
    @ImpresionPermiso BIT,
    @Contrasena VARCHAR(1000) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Perfil] 
        (Nombre, Apellido, Email, Telefono, IdHospital, LecturaPermiso, EdicionPermiso, ImpresionPermiso, Contrasena)
    VALUES 
        (@Nombre, @Apellido, @Email, @Telefono, @IdHospital, @LecturaPermiso, @EdicionPermiso, @ImpresionPermiso, @Contrasena);
    
    SELECT SCOPE_IDENTITY() AS IdPerfil; -- Para obtener el ID del nuevo registro
END
GO
