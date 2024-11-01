USE [MedLife]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMuestra]    Script Date: 1/11/2024 09:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Actualizar muestra*/
CREATE PROCEDURE [dbo].ActualizarMuestraFirma
    @IdMuestra INT,
    @FirmaSello VARCHAR(1000)

AS
BEGIN
    UPDATE Muestra
    SET FirmaSello = @FirmaSello
    WHERE IdMuestra = @IdMuestra;
END;
