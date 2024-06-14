USE [master]
GO
/****** Object:  Database [MedLife]    Script Date: 14/6/2024 10:36:45 ******/
CREATE DATABASE [MedLife]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedLife', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MedLife.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MedLife_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MedLife_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MedLife] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedLife].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedLife] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedLife] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedLife] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedLife] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedLife] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedLife] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedLife] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedLife] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedLife] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedLife] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedLife] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedLife] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedLife] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedLife] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedLife] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedLife] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedLife] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedLife] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedLife] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedLife] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedLife] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedLife] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedLife] SET RECOVERY FULL 
GO
ALTER DATABASE [MedLife] SET  MULTI_USER 
GO
ALTER DATABASE [MedLife] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedLife] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedLife] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedLife] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MedLife] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedLife', N'ON'
GO
ALTER DATABASE [MedLife] SET QUERY_STORE = OFF
GO
USE [MedLife]
GO
/****** Object:  User [alumno]    Script Date: 14/6/2024 10:36:45 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[IdHospital] [int] IDENTITY(1,1) NOT NULL,
	[NombreHospital] [varchar](1000) NOT NULL,
	[Email1] [varchar](1000) NOT NULL,
	[Email2] [varchar](1000) NULL,
	[Email3] [varchar](1000) NULL,
	[Email4] [varchar](1000) NULL,
	[Email5] [varchar](1000) NULL,
	[Referente1] [varchar](1000) NOT NULL,
	[Referente2] [varchar](1000) NULL,
	[Referente3] [varchar](1000) NULL,
	[Referente4] [varchar](1000) NULL,
	[Referente5] [varchar](1000) NULL,
	[Tel1] [int] NOT NULL,
	[Tel2] [int] NULL,
	[Tel3] [int] NULL,
	[Tel4] [int] NULL,
	[Tel5] [int] NULL,
	[Direccion] [varchar](1000) NOT NULL,
	[Localidad] [varchar](1000) NOT NULL,
	[Provincia] [varchar](1000) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Responsable] [varchar](1000) NOT NULL,
	[Servicio] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[IdHospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muestra]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muestra](
	[IdMuestra] [int] IDENTITY(1,1) NOT NULL,
	[IdResultado] [int] NULL,
	[InstitucionNacimiento] [varchar](1000) NOT NULL,
	[IdHospitalMuestra] [int] NOT NULL,
	[ApellidoBebe] [varchar](1000) NOT NULL,
	[NombreBebe] [varchar](1000) NOT NULL,
	[FechaHoraNacimiento] [datetime] NOT NULL,
	[FechaHoraExtraccion] [datetime] NOT NULL,
	[Sexo] [varchar](1000) NOT NULL,
	[Alimentacion] [varchar](1000) NOT NULL,
	[FechaIngestaLeche] [datetime] NOT NULL,
	[SemanasGestacion] [int] NOT NULL,
	[Peso] [int] NOT NULL,
	[CondicionRN] [varchar](1000) NOT NULL,
	[PatologiaBase] [varchar](1000) NOT NULL,
	[Parto] [varchar](1000) NOT NULL,
	[EmbarazoMultiple] [bit] NOT NULL,
	[EmbarazoGemelar] [bit] NOT NULL,
	[ApellidoMama] [varchar](1000) NOT NULL,
	[NombreMama] [varchar](1000) NOT NULL,
	[Documento] [int] NOT NULL,
	[Domicilio] [varchar](1000) NOT NULL,
	[Localidad] [varchar](1000) NOT NULL,
	[Telefono] [int] NOT NULL,
	[LugarControlEmbarazo] [varchar](1000) NOT NULL,
	[Antibioticos] [bit] NOT NULL,
	[DesinfectantesYodados] [bit] NOT NULL,
	[Transfusion] [bit] NOT NULL,
	[FechaTransfusion] [datetime] NULL,
	[Dopamina] [bit] NOT NULL,
	[Dobutamina] [bit] NOT NULL,
	[CorticoidesMadre] [bit] NOT NULL,
	[CorticoidesBebe] [bit] NOT NULL,
	[Tiroidepatias] [bit] NOT NULL,
	[Otras] [varchar](1000) NULL,
	[RepiteMuestra] [bit] NOT NULL,
	[Prematuro] [bit] NULL,
	[MalaMuestra] [bit] NULL,
	[ResultadoAlterado] [bit] NULL,
	[Analitico] [int] NOT NULL,
	[Responsable] [varchar](1000) NOT NULL,
	[RolResponsable] [varchar](1000) NOT NULL,
	[FirmaSello] [varchar](1000) NOT NULL,
	[FechaEnvio] [datetime] NULL,
	[FechaLlegada] [datetime] NULL,
	[Observaciones] [varchar](1000) NULL,
 CONSTRAINT [PK_Muestra] PRIMARY KEY CLUSTERED 
(
	[IdMuestra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuestraResultado]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuestraResultado](
	[IdResultado] [int] IDENTITY(1,1) NOT NULL,
	[IdMuestra] [int] NOT NULL,
	[TshNeonatal] [varchar](1000) NOT NULL,
	[MetodologiaTsh] [varchar](1000) NOT NULL,
	[Fenilanina] [varchar](1000) NOT NULL,
	[MetodologiaFenilanina] [varchar](1000) NOT NULL,
	[IrtNeonatal] [varchar](1000) NOT NULL,
	[MetodologiaIrt] [varchar](1000) NOT NULL,
	[Galactosa] [varchar](1000) NOT NULL,
	[MetodologiaGalactosa] [varchar](1000) NOT NULL,
	[Hidroxiprogesterona] [varchar](1000) NOT NULL,
	[MetodologiaHidro] [varchar](1000) NOT NULL,
	[Biotinidasa] [varchar](1000) NOT NULL,
	[MetodologiaBiotinidasa] [varchar](1000) NOT NULL,
	[NormalidadTsh] [varchar](1000) NOT NULL,
	[NormalidadFenilanina] [varchar](1000) NOT NULL,
	[NormalidadIrt] [varchar](1000) NOT NULL,
	[NormalidadGalactosa] [varchar](1000) NOT NULL,
	[NormalidadHidro] [varchar](1000) NOT NULL,
	[NormalidadBiotinidasa] [varchar](1000) NOT NULL,
	[Observaciones] [varchar](1000) NULL,
 CONSTRAINT [PK_MuestraResultado] PRIMARY KEY CLUSTERED 
(
	[IdResultado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[IdMuestra] [int] NOT NULL,
	[Acta] [int] NOT NULL,
	[Hc] [int] NULL,
	[IdGarrahan] [int] NULL,
	[FechaLlegada] [datetime] NULL,
	[FechaEnvio] [datetime] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](1000) NOT NULL,
	[Apellido] [varchar](1000) NOT NULL,
	[Email] [varchar](1000) NOT NULL,
	[Telefono] [int] NOT NULL,
	[IdHospital] [int] NOT NULL,
	[LecturaPermiso] [bit] NOT NULL,
	[EdicionPermiso] [bit] NOT NULL,
	[ImpresionPermiso] [bit] NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Muestra]  WITH CHECK ADD  CONSTRAINT [FK_Muestra_Hospital] FOREIGN KEY([IdHospitalMuestra])
REFERENCES [dbo].[Hospital] ([IdHospital])
GO
ALTER TABLE [dbo].[Muestra] CHECK CONSTRAINT [FK_Muestra_Hospital]
GO
ALTER TABLE [dbo].[Muestra]  WITH CHECK ADD  CONSTRAINT [FK_Muestra_MuestraResultado] FOREIGN KEY([IdResultado])
REFERENCES [dbo].[MuestraResultado] ([IdResultado])
GO
ALTER TABLE [dbo].[Muestra] CHECK CONSTRAINT [FK_Muestra_MuestraResultado]
GO
ALTER TABLE [dbo].[MuestraResultado]  WITH CHECK ADD  CONSTRAINT [FK_MuestraResultado_Muestra] FOREIGN KEY([IdMuestra])
REFERENCES [dbo].[Muestra] ([IdMuestra])
GO
ALTER TABLE [dbo].[MuestraResultado] CHECK CONSTRAINT [FK_MuestraResultado_Muestra]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Muestra] FOREIGN KEY([IdMuestra])
REFERENCES [dbo].[Muestra] ([IdMuestra])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Muestra]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Hospital] FOREIGN KEY([IdHospital])
REFERENCES [dbo].[Hospital] ([IdHospital])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Hospital]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMuestra]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Actualizar muestra*/
CREATE PROCEDURE [dbo].[ActualizarMuestra]
    @IdMuestra INT,
    @IdResultado INT,
    @FechaEnvio DATETIME,
    @FechaLlegada DATETIME,
    @Observaciones VARCHAR(1000)

AS
BEGIN
    UPDATE Muestra
    SET IdResultado = @IdResultado,
        FechaEnvio = @FechaEnvio,
        FechaLlegada = @FechaLlegada,
        Observaciones = @Observaciones
    WHERE IdMuestra = @IdMuestra;
END;

GO
/****** Object:  StoredProcedure [dbo].[BuscarMuestraPorFiltros]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Selecionar muestra por filtrado*/
CREATE PROCEDURE [dbo].[BuscarMuestraPorFiltros]
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
GO
/****** Object:  StoredProcedure [dbo].[EliminarHospital]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Borrar hospital*/
CREATE PROCEDURE [dbo].[EliminarHospital]
    @IdHospital int
AS
BEGIN
    DELETE FROM Hospital WHERE IdHospital = @IdHospital
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarMuestra]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Eliminar muestra*/
CREATE PROCEDURE [dbo].[EliminarMuestra]
    @IdMuestra INT
AS
BEGIN
    DELETE FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarMuestraYResultado]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Eliminar Muestra y Resultado*/
CREATE PROCEDURE [dbo].[EliminarMuestraYResultado]
    @IdMuestra INT
AS
BEGIN
    DELETE FROM MuestraResultado
    WHERE IdMuestra = @IdMuestra;

    DELETE FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPaciente]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Eliminar paciente*/
CREATE PROCEDURE [dbo].[EliminarPaciente]
    @IdPaciente INT
AS
BEGIN
    DELETE FROM Paciente
    WHERE IdPaciente = @IdPaciente;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarHospital]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Insertar hospital*/
CREATE PROCEDURE [dbo].[InsertarHospital]
    @NombreHospital varchar(1000),
    @Email1 varchar(1000),
    @Email2 varchar(1000) = NULL,
    @Email3 varchar(1000) = NULL,
    @Email4 varchar(1000) = NULL,
    @Email5 varchar(1000) = NULL,
    @Referente1 varchar(1000),
    @Referente2 varchar(1000) = NULL,
    @Referente3 varchar(1000) = NULL,
    @Referente4 varchar(1000) = NULL,
    @Referente5 varchar(1000) = NULL,
    @Tel1 int,
    @Tel2 int = NULL,
    @Tel3 int = NULL,
    @Tel4 int = NULL,
    @Tel5 int = NULL,
    @Direccion varchar(1000),
    @Localidad varchar(1000),
    @Provincia varchar(1000),
    @Telefono int,
    @Responsable varchar(1000),
    @Servicio varchar(1000)
AS
BEGIN
    INSERT INTO Hospital (NombreHospital, Email1, Email2, Email3, Email4, Email5, Referente1, Referente2, Referente3, Referente4, Referente5, Tel1, Tel2, Tel3, Tel4, Tel5, Direccion, Localidad, Provincia, Telefono, Responsable, Servicio)
    VALUES (@NombreHospital, @Email1, @Email2, @Email3, @Email4, @Email5, @Referente1, @Referente2, @Referente3, @Referente4, @Referente5, @Tel1, @Tel2, @Tel3, @Tel4, @Tel5, @Direccion, @Localidad, @Provincia, @Telefono, @Responsable, @Servicio)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarMuestra]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Insertar Muestra*/
CREATE PROCEDURE [dbo].[InsertarMuestra]
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
GO
/****** Object:  StoredProcedure [dbo].[InsertarMuestraYResultado]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*----------------PERFILES----------------*/

/*Insertar muestra y resultados*/
CREATE PROCEDURE [dbo].[InsertarMuestraYResultado]
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
GO
/****** Object:  StoredProcedure [dbo].[InsertarPaciente]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Insertar paciente*/
CREATE PROCEDURE [dbo].[InsertarPaciente]
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

GO
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitales]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Seleccionar Hospitales*/
CREATE PROCEDURE [dbo].[SeleccionarHospitales]
AS
BEGIN
    SELECT *
    FROM Hospital
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitalPorId]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Seleccionar Hospital por Id*/
CREATE PROCEDURE [dbo].[SeleccionarHospitalPorId]
    @IdHospital int
AS
BEGIN
    SELECT *
    FROM Hospital
    WHERE IdHospital = @IdHospital
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitalPorNombre]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Seleccionar Hospital por Nombre*/
CREATE PROCEDURE [dbo].[SeleccionarHospitalPorNombre]
    @NombreHospital varchar(1000)
AS
BEGIN
    SELECT *
    FROM Hospital
    WHERE NombreHospital = @NombreHospital
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraPorId]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Seleccionar muestra por id*/
CREATE PROCEDURE [dbo].[SeleccionarMuestraPorId]
    @IdMuestra INT
AS
BEGIN
    SELECT *
    FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPacientesPorFiltros]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Seleccionar paciente por filtrado*/
CREATE PROCEDURE [dbo].[SeleccionarPacientesPorFiltros]
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
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPerfiles]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarPerfiles]

AS
BEGIN
    SELECT *
    FROM Perfil
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPerfilPorId]    Script Date: 14/6/2024 10:36:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarPerfilPorId]
    @IdPerfil INT
AS
BEGIN
    SELECT *
    FROM Perfil
    WHERE IdPerfil = @IdPerfil
END;
GO
USE [master]
GO
ALTER DATABASE [MedLife] SET  READ_WRITE 
GO
