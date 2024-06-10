/*----------------MUESTRAS----------------*/

/*Insertar Muestra*/
CREATE PROCEDURE InsertarMuestra
    @IdResultado INT,
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
    @Observaciones VARCHAR(1000)
AS
BEGIN
    INSERT INTO Muestra (
        IdResultado, InstitucionNacimiento, IdHospitalMuestra, ApellidoBebe, NombreBebe, 
        FechaHoraNacimiento, FechaHoraExtraccion, Sexo, Alimentacion, FechaIngestaLeche,
        SemanasGestacion, Peso, CondicionRN, PatologiaBase, Parto, EmbarazoMultiple,
        EmbarazoGemelar, ApellidoMama, NombreMama, Documento, Domicilio, Localidad,
        Telefono, LugarControlEmbarazo, Antibioticos, DesinfectantesYodados, Transfusion,
        FechaTransfusion, Dopamina, Dobutamina, CorticoidesMadre, CorticoidesBebe,
        Tiroidepatias, Otras, RepiteMuestra, Prematuro, MalaMuestra, ResultadoAlterado,
        Analitico, Responsable, RolResponsable, FirmaSello, FechaEnvio, FechaLlegada, Observaciones
    )
    VALUES (
        @IdResultado, @InstitucionNacimiento, @IdHospitalMuestra, @ApellidoBebe, @NombreBebe, 
        @FechaHoraNacimiento, @FechaHoraExtraccion, @Sexo, @Alimentacion, @FechaIngestaLeche,
        @SemanasGestacion, @Peso, @CondicionRN, @PatologiaBase, @Parto, @EmbarazoMultiple,
        @EmbarazoGemelar, @ApellidoMama, @NombreMama, @Documento, @Domicilio, @Localidad,
        @Telefono, @LugarControlEmbarazo, @Antibioticos, @DesinfectantesYodados, @Transfusion,
        @FechaTransfusion, @Dopamina, @Dobutamina, @CorticoidesMadre, @CorticoidesBebe,
        @Tiroidepatias, @Otras, @RepiteMuestra, @Prematuro, @MalaMuestra, @ResultadoAlterado,
        @Analitico, @Responsable, @RolResponsable, @FirmaSello, @FechaEnvio, @FechaLlegada, @Observaciones
    );
END;


/*Actualizar muestra*/
CREATE PROCEDURE ActualizarMuestra
    @IdMuestra INT,
    @IdResultado INT,
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
    @Observaciones VARCHAR(1000)
AS
BEGIN
    UPDATE Muestra
    SET IdResultado = @IdResultado,
        InstitucionNacimiento = @InstitucionNacimiento,
        IdHospitalMuestra = @IdHospitalMuestra,
        ApellidoBebe = @ApellidoBebe,
        NombreBebe = @NombreBebe,
        FechaHoraNacimiento = @FechaHoraNacimiento,
        FechaHoraExtraccion = @FechaHoraExtraccion,
        Sexo = @Sexo,
        Alimentacion = @Alimentacion,
        FechaIngestaLeche = @FechaIngestaLeche,
        SemanasGestacion = @SemanasGestacion,
        Peso = @Peso,
        CondicionRN = @CondicionRN,
        PatologiaBase = @PatologiaBase,
        Parto = @Parto,
        EmbarazoMultiple = @EmbarazoMultiple,
        EmbarazoGemelar = @EmbarazoGemelar,
        ApellidoMama = @ApellidoMama,
        NombreMama = @NombreMama,
        Documento = @Documento,
        Domicilio = @Domicilio,
        Localidad = @Localidad,
        Telefono = @Telefono,
        LugarControlEmbarazo = @LugarControlEmbarazo,
        Antibioticos = @Antibioticos,
        DesinfectantesYodados = @DesinfectantesYodados,
        Transfusion = @Transfusion,
        FechaTransfusion = @FechaTransfusion,
        Dopamina = @Dopamina,
        Dobutamina = @Dobutamina,
        CorticoidesMadre = @CorticoidesMadre,
        CorticoidesBebe = @CorticoidesBebe,
        Tiroidepatias = @Tiroidepatias,
        Otras = @Otras,
        RepiteMuestra = @RepiteMuestra,
        Prematuro = @Prematuro,
        MalaMuestra = @MalaMuestra,
        ResultadoAlterado = @ResultadoAlterado,
        Analitico = @Analitico,
        Responsable = @Responsable,
        RolResponsable = @RolResponsable,
        FirmaSello = @FirmaSello,
        FechaEnvio = @FechaEnvio,
        FechaLlegada = @FechaLlegada,
        Observaciones = @Observaciones
    WHERE IdMuestra = @IdMuestra;
END;


/*Eliminar muestra*/
CREATE PROCEDURE EliminarMuestra
    @IdMuestra INT
AS
BEGIN
    DELETE FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;


/*Seleccionar muestra por id*/
CREATE PROCEDURE SeleccionarMuestraPorId
    @IdMuestra INT
AS
BEGIN
    SELECT *
    FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;


/*Seleccionar muestra por id*/
CREATE PROCEDURE SeleccionarMuestraPorId
    @IdMuestra INT
AS
BEGIN
    SELECT *
    FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;

/*Selecionar muestra por filtrado*/
CREATE PROCEDURE BuscarMuestraPorFiltros
    @Provincia VARCHAR(1000),
    @Hospital VARCHAR(1000),
    @Apellido VARCHAR(1000),
    @FechaRegistroDesde DATETIME,
    @FechaRegistroHasta DATETIME
AS
BEGIN
    SELECT *
    FROM Muestra m
    WHERE (m.IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE Provincia = @Provincia OR @Provincia = '')
           OR @Provincia = '')
    AND (m.ApellidoBebe = @Apellido OR @Apellido = '')
    AND (m.FechaHoraExtraccion BETWEEN @FechaRegistroDesde AND @FechaRegistroHasta)
    AND (m.IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE NombreHospital = @Hospital OR @Hospital = '')
           OR @Hospital = '');
END;




/*----------------MUESTRA Y RESULTADOS----------------*/

/*Insertar muestra y resultados*/
CREATE PROCEDURE InsertarMuestraYResultado
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
    @Observaciones VARCHAR(1000),
    @TshNeonatal VARCHAR(1000),
    @MetodologiaTsh VARCHAR(1000),
    @Fenilanina VARCHAR(1000),
    @MetodologiaFenilanina VARCHAR(1000),
    @IrtNeonatal VARCHAR(1000),
    @MetodologiaIrt VARCHAR(1000),
    @Galactosa VARCHAR(1000),
    @MetodologiaGalactosa VARCHAR(1000),
    @Hidroxiprogesterona VARCHAR(1000),
    @MetodologiaHidro VARCHAR(1000),
    @Biotinidasa VARCHAR(1000),
    @MetodologiaBiotinidasa VARCHAR(1000),
    @NormalidadTsh VARCHAR(1000),
    @NormalidadFenilanina VARCHAR(1000),
    @NormalidadIrt VARCHAR(1000),
    @NormalidadGalactosa VARCHAR(1000),
    @NormalidadHidro VARCHAR(1000),
    @NormalidadBiotinidasa VARCHAR(1000),
    @ObservacionesResultado VARCHAR(1000)
AS
BEGIN
    DECLARE @IdMuestra INT;

    INSERT INTO Muestra (
        InstitucionNacimiento, IdHospitalMuestra, ApellidoBebe, NombreBebe, FechaHoraNacimiento,
        FechaHoraExtraccion, Sexo, Alimentacion, FechaIngestaLeche, SemanasGestacion, Peso,
        CondicionRN, PatologiaBase, Parto, EmbarazoMultiple, EmbarazoGemelar, ApellidoMama,
        NombreMama, Documento, Domicilio, Localidad, Telefono, LugarControlEmbarazo, Antibioticos,
        DesinfectantesYodados, Transfusion, FechaTransfusion, Dopamina, Dobutamina, CorticoidesMadre,
        CorticoidesBebe, Tiroidepatias, Otras, RepiteMuestra, Prematuro, MalaMuestra, ResultadoAlterado,
        Analitico, Responsable, RolResponsable, FirmaSello, FechaEnvio, FechaLlegada, Observaciones
    )
    VALUES (
        @InstitucionNacimiento, @IdHospitalMuestra, @ApellidoBebe, @NombreBebe, @FechaHoraNacimiento,
        @FechaHoraExtraccion, @Sexo, @Alimentacion, @FechaIngestaLeche, @SemanasGestacion, @Peso,
        @CondicionRN, @PatologiaBase, @Parto, @EmbarazoMultiple, @EmbarazoGemelar, @ApellidoMama,
        @NombreMama, @Documento, @Domicilio, @Localidad, @Telefono, @LugarControlEmbarazo, @Antibioticos,
        @DesinfectantesYodados, @Transfusion, @FechaTransfusion, @Dopamina, @Dobutamina, @CorticoidesMadre,
        @CorticoidesBebe, @Tiroidepatias, @Otras, @RepiteMuestra, @Prematuro, @MalaMuestra, @ResultadoAlterado,
        @Analitico, @Responsable, @RolResponsable, @FirmaSello, @FechaEnvio, @FechaLlegada, @Observaciones
    );

    SET @IdMuestra = SCOPE_IDENTITY();

    INSERT INTO MuestraResultado (
        IdMuestra, TshNeonatal, MetodologiaTsh, Fenilanina, MetodologiaFenilanina, IrtNeonatal,
        MetodologiaIrt, Galactosa, MetodologiaGalactosa, Hidroxiprogesterona, MetodologiaHidro,
        Biotinidasa, MetodologiaBiotinidasa, NormalidadTsh, NormalidadFenilanina, NormalidadIrt,
        NormalidadGalactosa, NormalidadHidro, NormalidadBiotinidasa, Observaciones
    )
    VALUES (
        @IdMuestra, @TshNeonatal, @MetodologiaTsh, @Fenilanina, @MetodologiaFenilanina, @IrtNeonatal,
        @MetodologiaIrt, @Galactosa, @MetodologiaGalactosa, @Hidroxiprogesterona, @MetodologiaHidro,
        @Biotinidasa, @MetodologiaBiotinidasa, @NormalidadTsh, @NormalidadFenilanina, @NormalidadIrt,
        @NormalidadGalactosa, @NormalidadHidro, @NormalidadBiotinidasa, @ObservacionesResultado
    );
END;



/*Eliminar Muestra y Resultado*/
CREATE PROCEDURE EliminarMuestraYResultado
    @IdMuestra INT
AS
BEGIN
    DELETE FROM MuestraResultado
    WHERE IdMuestra = @IdMuestra;

    DELETE FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;



/*----------------PACIENTES----------------*/

/*Insertar paciente*/
CREATE PROCEDURE InsertarPaciente
    @IdMuestra INT,
    @Acta INT,
    @Hc INT
AS
BEGIN
    INSERT INTO Paciente (IdMuestra, Acta, Hc)
    VALUES (@IdMuestra, @Acta, @Hc);
END;


/*Actualizar paciente*/
ALTER PROCEDURE ActualizarPaciente
    @IdPaciente INT,
    @IdMuestra INT,
    @Acta INT,
    @Hc INT,
    @IdGarrahan INT NULL,
	@FechaEnvio datetime,
	@FechaLlegada datetime NULL
AS
BEGIN
    UPDATE Paciente
    SET IdMuestra = @IdMuestra,
        Acta = @Acta,
        Hc = @Hc,
		IdGarrahan = @IdGarrahan,
		FechaEnvio = @FechaEnvio,
		FechaLlegada = @FechaLlegada
    WHERE IdPaciente = @IdPaciente;
END;


/*Eliminar paciente*/
CREATE PROCEDURE EliminarPaciente
    @IdPaciente INT
AS
BEGIN
    DELETE FROM Paciente
    WHERE IdPaciente = @IdPaciente;
END;


/*Seleccionar un paciente por su ID*/
CREATE PROCEDURE SeleccionarPacientePorId
    @IdPaciente INT
AS
BEGIN
    SELECT *
    FROM Paciente
    WHERE IdPaciente = @IdPaciente;
END;

/*Seleccionar paciente por filtrado*/
CREATE PROCEDURE SeleccionarPacientesPorFiltros
    @Provincia VARCHAR(1000),
    @Hospital VARCHAR(1000),
    @Apellido VARCHAR(1000),
    @Nombre VARCHAR(1000),
    @FechaRegistroDesde DATETIME,
    @FechaRegistroHasta DATETIME
AS
BEGIN
    SELECT p.*
    FROM Paciente p
    INNER JOIN Muestra m ON p.IdMuestra = m.IdMuestra
    INNER JOIN Hospital h ON m.IdHospitalMuestra = h.IdHospital
    WHERE (h.Provincia = @Provincia OR @Provincia = '')
        AND (h.NombreHospital = @Hospital OR @Hospital = '')
        AND (m.ApellidoBebe = @Apellido OR @Apellido = '')
        AND (m.NombreBebe = @Nombre OR @Nombre = '')
        AND (m.FechaHoraExtraccion BETWEEN @FechaRegistroDesde AND @FechaRegistroHasta);
END;



