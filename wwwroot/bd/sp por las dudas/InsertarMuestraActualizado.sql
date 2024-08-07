USE [MedLife]
GO
/****** Object:  StoredProcedure [dbo].[InsertarMuestra]    Script Date: 3/7/2024 08:54:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[InsertarMuestra]
    @InstitucionNacimiento VARCHAR(1000),
    @IdHospitalMuestra INT,
    @ApellidoBebe VARCHAR(1000),
    @NombreBebe VARCHAR(1000),
    @FechaHoraNacimiento DATETIME,
    @FechaHoraExtraccion DATETIME,
    @Sexo VARCHAR(1000),
    @Alimentacion VARCHAR(1000),
    @FechaIngestaLeche DATETIME,
    @SemanasGestacion INT,
    @Peso INT,
    @CondicionRN VARCHAR(1000),
    @PatologiaBase VARCHAR(1000),
    @Patologia VARCHAR(1000),
    @Parto VARCHAR(1000),
    @EmbarazoMultiple BIT,
    @EmbarazoGemelar BIT,
    @ApellidoMama VARCHAR(1000),
    @NombreMama VARCHAR(1000),
    @Documento INT,
    @Domicilio VARCHAR(1000),
    @Localidad VARCHAR(1000),
    @Telefono INT,
    @LugarControlEmbarazo VARCHAR(1000),
    @Antibioticos BIT,
    @DesinfectantesYodados BIT,
    @Transfusion BIT,
    @FechaTransfusion DATETIME,
    @Dopamina BIT,
    @Dobutamina BIT,
    @CorticoidesMadre BIT,
    @CorticoidesBebe BIT,
    @Tiroidepatias BIT,
    @Otras VARCHAR(1000),
    @RepiteMuestra BIT,
    @Prematuro BIT,
    @MalaMuestra BIT,
    @ResultadoAlterado BIT,
    @Analitico INT,
    @Responsable VARCHAR(1000),
    @RolResponsable VARCHAR(1000),
    @FirmaSello VARCHAR(1000),
    @FechaEnvio DATETIME,
    @FechaLlegada DATETIME,
    @ObservacionesMuestra VARCHAR(1000)
AS
BEGIN
    -- Insertar en la tabla Muestra
    INSERT INTO [dbo].[Muestra] (
        InstitucionNacimiento, IdHospitalMuestra, ApellidoBebe, NombreBebe, 
        FechaHoraNacimiento, FechaHoraExtraccion, Sexo, Alimentacion, FechaIngestaLeche,
        SemanasGestacion, Peso, CondicionRN, PatologiaBase, Patologia, Parto, EmbarazoMultiple,
        EmbarazoGemelar, ApellidoMama, NombreMama, Documento, Domicilio, Localidad,
        Telefono, LugarControlEmbarazo, Antibioticos, DesinfectantesYodados, Transfusion,
        FechaTransfusion, Dopamina, Dobutamina, CorticoidesMadre, CorticoidesBebe,
        Tiroidepatias, Otras, RepiteMuestra, Prematuro, MalaMuestra, ResultadoAlterado,
        Analitico, Responsable, RolResponsable, FirmaSello, FechaEnvio, FechaLlegada, Observaciones
    )
    VALUES (
        @InstitucionNacimiento, @IdHospitalMuestra, @ApellidoBebe, @NombreBebe, 
        @FechaHoraNacimiento, @FechaHoraExtraccion, @Sexo, @Alimentacion, @FechaIngestaLeche,
        @SemanasGestacion, @Peso, @CondicionRN, @PatologiaBase, @Patologia, @Parto, @EmbarazoMultiple,
        @EmbarazoGemelar, @ApellidoMama, @NombreMama, @Documento, @Domicilio, @Localidad,
        @Telefono, @LugarControlEmbarazo, @Antibioticos, @DesinfectantesYodados, @Transfusion,
        @FechaTransfusion, @Dopamina, @Dobutamina, @CorticoidesMadre, @CorticoidesBebe,
        @Tiroidepatias, @Otras, @RepiteMuestra, @Prematuro, @MalaMuestra, @ResultadoAlterado,
        @Analitico, @Responsable, @RolResponsable, @FirmaSello, @FechaEnvio, @FechaLlegada, @ObservacionesMuestra
    );

    -- Obtener el IdMuestra insertado
    DECLARE @IdMuestra INT;
    SET @IdMuestra = SCOPE_IDENTITY();
	DECLARE @ObservacionesResultado VARCHAR(1000),
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
    @NormalidadBiotinidasa VARCHAR(1000) = NULL;

    -- Insertar en la tabla MuestraResultado
    INSERT INTO [dbo].[MuestraResultado] (
        IdMuestra, TshNeonatal, MetodologiaTsh, Fenilanina, MetodologiaFenilanina,
        IrtNeonatal, MetodologiaIrt, Galactosa, MetodologiaGalactosa, Hidroxiprogesterona,
        MetodologiaHidro, Biotinidasa, MetodologiaBiotinidasa, NormalidadTsh, NormalidadFenilanina,
        NormalidadIrt, NormalidadGalactosa, NormalidadHidro, NormalidadBiotinidasa, Observaciones
    )
    VALUES (
        @IdMuestra, @TshNeonatal, @MetodologiaTsh, @Fenilanina, @MetodologiaFenilanina,
        @IrtNeonatal, @MetodologiaIrt, @Galactosa, @MetodologiaGalactosa, @Hidroxiprogesterona,
        @MetodologiaHidro, @Biotinidasa, @MetodologiaBiotinidasa, @NormalidadTsh, @NormalidadFenilanina,
        @NormalidadIrt, @NormalidadGalactosa, @NormalidadHidro, @NormalidadBiotinidasa, @ObservacionesResultado
    );

END;
