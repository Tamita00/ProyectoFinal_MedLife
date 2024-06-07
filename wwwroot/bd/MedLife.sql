USE [master]
GO
/****** Object:  Database [MedLife]    Script Date: 7/6/2024 09:27:43 ******/
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
/****** Object:  User [alumno]    Script Date: 7/6/2024 09:27:44 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 7/6/2024 09:27:44 ******/
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
/****** Object:  Table [dbo].[Muestra]    Script Date: 7/6/2024 09:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muestra](
	[IdMuestra] [int] IDENTITY(1,1) NOT NULL,
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
	[Otras:] [varchar](1000) NULL,
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
/****** Object:  Table [dbo].[MuestraResultado]    Script Date: 7/6/2024 09:27:44 ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 7/6/2024 09:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[IdMuestra] [int] NOT NULL,
	[IdResultado] [int] NOT NULL,
	[Acta] [int] NOT NULL,
	[Hc] [int] NULL,
	[Responsable] [varchar](1000) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 7/6/2024 09:27:44 ******/
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
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_MuestraResultado] FOREIGN KEY([IdResultado])
REFERENCES [dbo].[MuestraResultado] ([IdResultado])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_MuestraResultado]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Hospital] FOREIGN KEY([IdHospital])
REFERENCES [dbo].[Hospital] ([IdHospital])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Hospital]
GO
USE [master]
GO
ALTER DATABASE [MedLife] SET  READ_WRITE 
GO
