USE [MedLife]
GO
/****** Object:  StoredProcedure [dbo].[InsertarPaciente]    Script Date: 10/6/2024 08:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Insertar paciente*/
ALTER PROCEDURE [dbo].[InsertarPaciente]
    @IdMuestra INT,
    @Acta INT,
    @Hc INT,
    @IdGarrahan INT NULL,
	@FechaEnvio datetime,
	@FechaLlegada datetime NULL
AS
BEGIN
    INSERT INTO Paciente (IdMuestra, Acta, Hc, IdGarrahan, FechaLlegada, FechaEnvio)
    VALUES (@IdMuestra, @Acta, @Hc, @IdGarrahan, @FechaLlegada, @FechaLlegada);
END;

