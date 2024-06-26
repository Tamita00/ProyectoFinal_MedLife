USE [MedLife]
GO
/****** Object:  StoredProcedure [dbo].[InsertarResultado]    Script Date: 26/6/2024 08:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[ActualizarResultado]
    @IdMuestra INT,
    @TshNeonatal VARCHAR(1000) = NULL,
    @MetodologiaTsh VARCHAR(1000) = NULL,
    @Fenilanina VARCHAR(1000) = NULL,
    @MetodologiaFenilanina VARCHAR(1000) = NULL,
    @IrtNeonatal VARCHAR(1000) = NULL,
    @MetodologiaIrt VARCHAR(1000) = NULL,
    @Galactosa VARCHAR(1000) = NULL,
    @MetodologiaGalactosa VARCHAR(1000) = NULL,
    @Hidroxiprogesterona VARCHAR(1000) = NULL,
    @MetodologiaHidro VARCHAR(1000) = NULL,
    @Biotinidasa VARCHAR(1000) = NULL,
    @MetodologiaBiotinidasa VARCHAR(1000) = NULL,
    @NormalidadTsh VARCHAR(1000) = NULL,
    @NormalidadFenilanina VARCHAR(1000) = NULL,
    @NormalidadIrt VARCHAR(1000) = NULL,
    @NormalidadGalactosa VARCHAR(1000) = NULL,
    @NormalidadHidro VARCHAR(1000) = NULL,
    @NormalidadBiotinidasa VARCHAR(1000) = NULL,
    @ObservacionesResultado VARCHAR(1000) = NULL
AS
BEGIN
    -- Verificar si el IdMuestra existe antes de actualizar
    IF EXISTS (SELECT 1 FROM MuestraResultado WHERE IdMuestra = @IdMuestra)
    BEGIN
        -- Realizar el UPDATE en MuestraResultado
        UPDATE MuestraResultado
        SET 
            TshNeonatal = ISNULL(@TshNeonatal, TshNeonatal),
            MetodologiaTsh = ISNULL(@MetodologiaTsh, MetodologiaTsh),
            Fenilanina = ISNULL(@Fenilanina, Fenilanina),
            MetodologiaFenilanina = ISNULL(@MetodologiaFenilanina, MetodologiaFenilanina),
            IrtNeonatal = ISNULL(@IrtNeonatal, IrtNeonatal),
            MetodologiaIrt = ISNULL(@MetodologiaIrt, MetodologiaIrt),
            Galactosa = ISNULL(@Galactosa, Galactosa),
            MetodologiaGalactosa = ISNULL(@MetodologiaGalactosa, MetodologiaGalactosa),
            Hidroxiprogesterona = ISNULL(@Hidroxiprogesterona, Hidroxiprogesterona),
            MetodologiaHidro = ISNULL(@MetodologiaHidro, MetodologiaHidro),
            Biotinidasa = ISNULL(@Biotinidasa, Biotinidasa),
            MetodologiaBiotinidasa = ISNULL(@MetodologiaBiotinidasa, MetodologiaBiotinidasa),
            NormalidadTsh = ISNULL(@NormalidadTsh, NormalidadTsh),
            NormalidadFenilanina = ISNULL(@NormalidadFenilanina, NormalidadFenilanina),
            NormalidadIrt = ISNULL(@NormalidadIrt, NormalidadIrt),
            NormalidadGalactosa = ISNULL(@NormalidadGalactosa, NormalidadGalactosa),
            NormalidadHidro = ISNULL(@NormalidadHidro, NormalidadHidro),
            NormalidadBiotinidasa = ISNULL(@NormalidadBiotinidasa, NormalidadBiotinidasa),
            Observaciones = ISNULL(@ObservacionesResultado, Observaciones)
        WHERE IdMuestra = @IdMuestra;

    END
END;
