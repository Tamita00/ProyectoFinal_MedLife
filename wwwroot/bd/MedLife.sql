USE [master]
GO
/****** Object:  Database [MedLife]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  User [alumno]    Script Date: 12/7/2024 10:51:57 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 12/7/2024 10:51:57 ******/
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
	[Tel1] [bigint] NOT NULL,
	[Tel2] [bigint] NULL,
	[Tel3] [bigint] NULL,
	[Tel4] [bigint] NULL,
	[Tel5] [bigint] NULL,
	[Direccion] [varchar](1000) NOT NULL,
	[Localidad] [varchar](1000) NOT NULL,
	[Provincia] [varchar](1000) NOT NULL,
	[Telefono] [bigint] NOT NULL,
	[Responsable] [varchar](1000) NOT NULL,
	[Servicio] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[IdHospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muestra]    Script Date: 12/7/2024 10:51:57 ******/
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
	[Patologia] [varchar](1000) NULL,
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
/****** Object:  Table [dbo].[MuestraResultado]    Script Date: 12/7/2024 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuestraResultado](
	[IdResultado] [int] IDENTITY(1,1) NOT NULL,
	[IdMuestra] [int] NOT NULL,
	[TshNeonatal] [varchar](1000) NULL,
	[MetodologiaTsh] [varchar](1000) NULL,
	[Fenilanina] [varchar](1000) NULL,
	[MetodologiaFenilanina] [varchar](1000) NULL,
	[IrtNeonatal] [varchar](1000) NULL,
	[MetodologiaIrt] [varchar](1000) NULL,
	[Galactosa] [varchar](1000) NULL,
	[MetodologiaGalactosa] [varchar](1000) NULL,
	[Hidroxiprogesterona] [varchar](1000) NULL,
	[MetodologiaHidro] [varchar](1000) NULL,
	[Biotinidasa] [varchar](1000) NULL,
	[MetodologiaBiotinidasa] [varchar](1000) NULL,
	[NormalidadTsh] [varchar](1000) NULL,
	[NormalidadFenilanina] [varchar](1000) NULL,
	[NormalidadIrt] [varchar](1000) NULL,
	[NormalidadGalactosa] [varchar](1000) NULL,
	[NormalidadHidro] [varchar](1000) NULL,
	[NormalidadBiotinidasa] [varchar](1000) NULL,
	[Observaciones] [varchar](1000) NULL,
 CONSTRAINT [PK_MuestraResultado] PRIMARY KEY CLUSTERED 
(
	[IdResultado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  Table [dbo].[Perfil]    Script Date: 12/7/2024 10:51:57 ******/
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
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (2, N'Garrahan', N'santiagoButler@gmial.com', NULL, NULL, NULL, NULL, N'Santiago Butler', NULL, NULL, NULL, NULL, 1156247823, NULL, NULL, NULL, NULL, N' Pichincha 1890', N'CABA', N'Buenos Aires', 1141226000, N'Gustavo Dratler', N'Pediatría')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (5, N'Clínica Beccar', N'CLINICABECCAR@YAHOO.COM.AR', N'PLANOFABIAN@YAHOO.COM.AR', N'', N'', N'', N'Dr. Plano', N'', N'', N'', N'', 47476381, 47430396, 47422509, NULL, NULL, N'Julian Navarro 48', N'Beccar', N'Buenos Aires', 47476381, N'Enfermera Soledad Lugo', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (12, N'Hospital Británico', N'INFO@HOSPITALBRITANICO.ORG.AR', N'DIRECCIONDEMAIL1@HOSPITALBRITANICO.ORG.AR', N'', N'', N'', N'Dr. Federico Pérez', N'Dr. Marcos Villar', N'', N'', N'', 1148117000, 1148117222, NULL, NULL, NULL, N'Perdriel 74', N'Buenos Aires', N'Buenos Aires', 1148117000, N'Lic. María Soler', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (13, N'Hospital Italiano', N'INFO@HOSPITALITALIANO.ORG.AR', N'CONTACTO@HOSPITALITALIANO.ORG.AR', N'', N'', N'', N'Dr. Ricardo Peralta', N'Dr. Lucas Martínez', N'', N'', N'', 1154635000, 1154635000, NULL, NULL, NULL, N'Gascón 450', N'Buenos Aires', N'Buenos Aires', 1154635000, N'Lic. Laura Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (18, N'Sanatorio de la Trinidad', N'INFO@SANATORIOTRINIDAD.COM.AR', N'CONTACTO@SANATORIOTRINIDAD.COM.AR', N'', N'', N'', N'Dr. Andrés López', N'Dr. Santiago Pérez', N'', N'', N'', 1158002500, 1158002600, NULL, NULL, NULL, N'Mitre 2020', N'Buenos Aires', N'Buenos Aires', 1158002500, N'Dr. Andrés López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (19, N'Hospital Alemán', N'INFO@HOSPITALALEMAN.COM.AR', N'CONTACTO@HOSPITALALEMAN.COM.AR', N'', N'', N'', N'Dr. Santiago Olivera', N'Dr. Martín González', N'', N'', N'', 1143758200, 1143758201, NULL, NULL, NULL, N'Av. Pueyrredón 1640', N'Buenos Aires', N'Buenos Aires', 1143758200, N'Dr. Santiago Olivera', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (20, N'Hospital Español', N'INFO@HOSPITALESPAÑOL.COM.AR', N'CONTACTO@HOSPITALESPAÑOL.COM.AR', N'', N'', N'', N'Dr. Enrique Sánchez', N'Dr. Pablo Ramírez', N'', N'', N'', 1154509500, 1154509501, NULL, NULL, NULL, N'Av. Belgrano 2710', N'Buenos Aires', N'Buenos Aires', 1154509500, N'Dr. Enrique Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (24, N'Hospital El Cruce', N'INFO@HOSPITALELCRUCE.ORG.AR', N'CONTACTO@HOSPITALELCRUCE.ORG.AR', N'', N'', N'', N'Dr. Martín Sánchez', N'Dr. Laura Pérez', N'', N'', N'', 1168178000, 1168178111, NULL, NULL, NULL, N'Camino de Cintura y Mariano Acosta', N'Florencio Varela', N'Buenos Aires', 1168178000, N'Dr. Martín Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (25, N'Hospital Italiano de Buenos Aires', N'INFO@HIBA.ORG.AR', N'CONTACTO@HIBA.ORG.AR', N'', N'', N'', N'Dr. Eduardo Fernández', N'Dr. Ana López', N'', N'', N'', 1145309000, 1145309111, NULL, NULL, NULL, N'Juan D. Perón 4190', N'Buenos Aires', N'Buenos Aires', 1145309000, N'Dr. Eduardo Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (26, N'Hospital de Clínicas José de San Martín', N'INFO@HOSPITALDECLINICAS.UBA.AR', N'CONTACTO@HOSPITALDECLINICAS.UBA.AR', N'', N'', N'', N'Dr. Alejandro López', N'Dr. María Rodríguez', N'', N'', N'', 1145928000, 1145928111, NULL, NULL, NULL, N'Av. Córdoba 2351', N'Buenos Aires', N'Buenos Aires', 1145928000, N'Dr. Alejandro López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (27, N'Hospital de Niños Ricardo Gutiérrez', N'INFO@HNRG.ORG.AR', N'CONTACTO@HNRG.ORG.AR', N'', N'', N'', N'Dr. Carlos Sánchez', N'Dr. Laura Martínez', N'', N'', N'', 1143017000, 1143017111, NULL, NULL, NULL, N'Gallo 1330', N'Buenos Aires', N'Buenos Aires', 1143017000, N'Dr. Carlos Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (28, N'Hospital Posadas', N'INFO@HOSPITALPOSADAS.GOB.AR', N'CONTACTO@HOSPITALPOSADAS.GOB.AR', N'', N'', N'', N'Dr. Juan Pérez', N'Dr. María Rodríguez', N'', N'', N'', 1146620200, 1146620300, NULL, NULL, NULL, N'Av. Presidente Illia s/n', N'El Palomar', N'Buenos Aires', 1146620200, N'Dr. Juan Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (29, N'Hospital Ramos Mejía', N'INFO@HOSPITALRAMOSMEJIA.BA.GOV.AR', N'CONTACTO@HOSPITALRAMOSMEJIA.BA.GOV.AR', N'', N'', N'', N'Dr. Martín Fernández', N'Dr. Laura Martínez', N'', N'', N'', 1144339500, 1144339600, NULL, NULL, NULL, N'Urquiza 609', N'Buenos Aires', N'Buenos Aires', 1144339500, N'Dr. Martín Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (31, N'Hospital de Pediatría Prof. Dr. Juan P. Garrahan', N'INFO@HOSPITALGARRAHAN.GOV.AR', N'CONTACTO@HOSPITALGARRAHAN.GOV.AR', N'', N'', N'', N'Dr. Sebastián Pérez', N'Dr. Ana López', N'', N'', N'', 1143005400, 1143005411, NULL, NULL, NULL, N'Combate de los Pozos 1881', N'Buenos Aires', N'Buenos Aires', 1143005400, N'Dr. Sebastián Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (38, N'Sanatorio Otamendi y Miroli', N'INFO@OTAMENDI.COM.AR', N'CONTACTO@OTAMENDI.COM.AR', N'', N'', N'', N'Dr. Federico López', N'Dra. Ana Martínez', N'', N'', N'', 1143084000, 1143084111, NULL, NULL, NULL, N'Azcuénaga 870', N'Buenos Aires', N'Buenos Aires', 1143084000, N'Dr. Federico López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (40, N'Sanatorio Mater Dei', N'INFO@SANATORIOMATERDEI.COM.AR', N'CONTACTO@SANATORIOMATERDEI.COM.AR', N'', N'', N'', N'Dr. Juan Martínez', N'Dra. María Rodríguez', N'', N'', N'', 1143698700, 1143698711, NULL, NULL, NULL, N'Hidalgo 2390', N'Buenos Aires', N'Buenos Aires', 1143698700, N'Dr. Juan Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (41, N'Sanatorio La Trinidad Palermo', N'INFO@SANATORIOLATRINIDAD.COM.AR', N'CONTACTO@SANATORIOLATRINIDAD.COM.AR', N'', N'', N'', N'Dr. Federico Pérez', N'Dra. Laura Gómez', N'', N'', N'', 1148456000, 1148456111, NULL, NULL, NULL, N'Guardia Vieja 4435', N'Buenos Aires', N'Buenos Aires', 1148456000, N'Dr. Federico Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (42, N'Hospital Allen "Dr. Ernesto Accame"', N'TAURO_53@YAHOO.COM.AR', N'MORDIL@SPEEDY.COM.AR', N'', N'', N'', N'DR Hugo Niz (Medico Pediatra)', N'Bioq Alejandro Moretti', N'', N'', N'', 2941452530, NULL, NULL, NULL, NULL, N'Ing. Quesnel s/n', N'Allen', N'Río Negro', 2941452530, N'Lic. Patricia Osses', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (43, N'Hospital Zonal Bariloche "Ramon Carrillo"', N'NEO@HOSPITALBARILOCHE.COM.AR', N'HOSPITAL@BARILOCHE.COM.AR', N'', N'', N'', N'Dra. Fabiana Herbon', N'Dra. Adriana Ranieri', N'', N'', N'', 2944426117, 29442426100, NULL, NULL, NULL, N'Moreno 601', N'San Carlos de Bariloche', N'Río Negro', 2944426117, N'Dra. Graciela Tapia Massini', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (45, N'Hospital Provincial Neuquén', N'HOSPITALPNNQN@YAHOO.COM.AR', N'', N'', N'', N'', N'Dr. Mario Alcorta', N'', N'', N'', N'', 2994454610, NULL, NULL, NULL, NULL, N'Buenos Aires 700', N'Neuquén', N'Neuquén', 2994454610, N'Bioq. Liliana Guerrero', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (46, N'Clínica Modelo S.A', N'INFO@CLINICAMODELO.COM.AR', N'ADMISION@CLINICAMODELO.COM.AR', N'', N'', N'', N'Dr. Cimadevilla, Jorge D', N'Dr. Pucheu, Hugo L', N'', N'', N'', 2494387500, 2494387587, NULL, NULL, NULL, N'Vélez Sarsfield 55', N'Luján', N'Buenos Aires', 2494387500, N'Ing. Juan Domínguez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (47, N'Sanatorio San Carlos', N'SANATORIOSANCARLOS@HOTMAIL.COM.AR', N'SANATORIOSANCARLOS@HOTMAIL.COM.AR', N'', N'', N'', N'Dr. Pedro Rodriguez', N'', N'', N'', N'', 2926442601, NULL, NULL, NULL, NULL, N'Belgrano 525', N'San Carlos de Bariloche', N'Río Negro', 2926442601, N'Dr. Pedro Rodriguez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (48, N'Hospital Zonal Esquel', N'DIRECCION@HOSPITALESQUEL.COM.AR', N'SAMIC@HOSPITALESQUEL.COM.AR', N'', N'', N'', N'Dra. Viviana Bettini', N'Dra. Claudia Linares', N'', N'', N'', 2945453033, 2945453021, NULL, NULL, NULL, N'Calle Primo Capraro', N'Esquel', N'Chubut', 2945453033, N'Dr. Miguel Huenupan', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (49, N'HOSPITALZONAL@MADRYN.ORG.AR', N'NEUROZONAMADRYN@YAHOO.COM.AR', N'CGONZALEZ@MADRYN.ORG.AR', N'', N'', N'', N'Dr. Pedro Carranza', N'Lic. Mónica Nuñez', N'', N'', N'', 2804479301, 2804479301, NULL, NULL, NULL, N'Avenida Gales 1466', N'Puerto Madryn', N'Chubut', 2804479301, N'Dr. Pedro Carranza', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (50, N'Sanatorio del Sol', N'INFO@SANATORIODELSOL.COM.AR', N'SANATORIODELSOL@YAHOO.COM.AR', N'', N'', N'', N'Dr. Gustavo Piscicelli', N'Dr. Alejandro Pardo', N'', N'', N'', 2615068111, 2614311111, NULL, NULL, NULL, N'Chacras de Coria', N'Luján de Cuyo', N'Mendoza', 2615068111, N'Dr. Gustavo Piscicelli', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (51, N'Hospital Británico', N'INFO@HOSPITALBRITANICO.ORG.AR', N'DIRECCIONDEMAIL1@HOSPITALBRITANICO.ORG.AR', N'', N'', N'', N'Dr. Federico Pérez', N'Dr. Marcos Villar', N'', N'', N'', 1148117000, 1148117222, NULL, NULL, NULL, N'Perdriel 74', N'Buenos Aires', N'Buenos Aires', 1148117000, N'Lic. María Soler', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (52, N'Hospital Italiano', N'INFO@HOSPITALITALIANO.ORG.AR', N'CONTACTO@HOSPITALITALIANO.ORG.AR', N'', N'', N'', N'Dr. Ricardo Peralta', N'Dr. Lucas Martínez', N'', N'', N'', 1154635000, 1154635000, NULL, NULL, NULL, N'Gascón 450', N'Buenos Aires', N'Buenos Aires', 1154635000, N'Lic. Laura Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (53, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', N'', N'', N'', N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', N'', N'', N'', 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (54, N'Sanatorio Allende', N'CONTACTO@SANATORIOALLENDE.COM.AR', N'INFO@SANATORIOALLENDE.COM.AR', N'', N'', N'', N'Dr. Martín Soto', N'Dr. Laura Romero', N'', N'', N'', 3514689400, 3514689401, NULL, NULL, NULL, N'Mariano Larra 345', N'Córdoba', N'Córdoba', 3514689400, N'Dr. Martín Soto', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (55, N'Clínica del Sol', N'INFO@CLINICADELSOL.COM.AR', N'CLINICADELSOL@YAHOO.COM.AR', N'', N'', N'', N'Dr. Eduardo García', N'Dr. Marcos Sánchez', N'', N'', N'', 2615008000, 2615008111, NULL, NULL, NULL, N'Av. Colón 827', N'Mendoza', N'Mendoza', 2615008000, N'Dr. Eduardo García', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (56, N'Hospital Privado de Córdoba', N'INFO@HOSPITALPRIVADO.COM.AR', N'INFO@HOSPITALPRIVADO.COM.AR', N'', N'', N'', N'Dr. Marcelo Quirós', N'Dr. José Gómez', N'', N'', N'', 3514688200, 3514688201, NULL, NULL, NULL, N'Avenida Naciones Unidas 346', N'Córdoba', N'Córdoba', 3514688200, N'Dr. Marcelo Quirós', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (57, N'Sanatorio de la Trinidad', N'INFO@SANATORIOTRINIDAD.COM.AR', N'CONTACTO@SANATORIOTRINIDAD.COM.AR', N'', N'', N'', N'Dr. Andrés López', N'Dr. Santiago Pérez', N'', N'', N'', 1158002500, 1158002600, NULL, NULL, NULL, N'Mitre 2020', N'Buenos Aires', N'Buenos Aires', 1158002500, N'Dr. Andrés López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (58, N'Hospital Alemán', N'INFO@HOSPITALALEMAN.COM.AR', N'CONTACTO@HOSPITALALEMAN.COM.AR', N'', N'', N'', N'Dr. Santiago Olivera', N'Dr. Martín González', N'', N'', N'', 1143758200, 1143758201, NULL, NULL, NULL, N'Av. Pueyrredón 1640', N'Buenos Aires', N'Buenos Aires', 1143758200, N'Dr. Santiago Olivera', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (59, N'Hospital Español', N'INFO@HOSPITALESPAÑOL.COM.AR', N'CONTACTO@HOSPITALESPAÑOL.COM.AR', N'', N'', N'', N'Dr. Enrique Sánchez', N'Dr. Pablo Ramírez', N'', N'', N'', 1154509500, 1154509501, NULL, NULL, NULL, N'Av. Belgrano 2710', N'Buenos Aires', N'Buenos Aires', 1154509500, N'Dr. Enrique Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (60, N'Hospital Italiano de Rosario', N'INFO@HOSPITALITALIANOROSARIO.ORG.AR', N'CONTACTO@HOSPITALITALIANOROSARIO.ORG.AR', N'', N'', N'', N'Dr. Alberto López', N'Dr. María González', N'', N'', N'', 3414994400, 3414994401, NULL, NULL, NULL, N'Bv. Oroño 450', N'Rosario', N'Santa Fe', 3414994400, N'Dr. Alberto López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (61, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', N'', N'', N'', N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', N'', N'', N'', 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (62, N'Hospital Universitario Austral', N'INFO@HUA.ORG.AR', N'CONTACTO@HUA.ORG.AR', N'', N'', N'', N'Dr. Juan López', N'Dr. María García', N'', N'', N'', 2304488000, 2304488111, NULL, NULL, NULL, N'Av. Perón 1500', N'Pilar', N'Buenos Aires', 2304488000, N'Dr. Juan López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (63, N'Hospital El Cruce', N'INFO@HOSPITALELCRUCE.ORG.AR', N'CONTACTO@HOSPITALELCRUCE.ORG.AR', N'', N'', N'', N'Dr. Martín Sánchez', N'Dr. Laura Pérez', N'', N'', N'', 1168178000, 1168178111, NULL, NULL, NULL, N'Camino de Cintura y Mariano Acosta', N'Florencio Varela', N'Buenos Aires', 1168178000, N'Dr. Martín Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (64, N'Hospital Italiano de Buenos Aires', N'INFO@HIBA.ORG.AR', N'CONTACTO@HIBA.ORG.AR', N'', N'', N'', N'Dr. Eduardo Fernández', N'Dr. Ana López', N'', N'', N'', 1145309000, 1145309111, NULL, NULL, NULL, N'Juan D. Perón 4190', N'Buenos Aires', N'Buenos Aires', 1145309000, N'Dr. Eduardo Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (65, N'Hospital de Clínicas José de San Martín', N'INFO@HOSPITALDECLINICAS.UBA.AR', N'CONTACTO@HOSPITALDECLINICAS.UBA.AR', N'', N'', N'', N'Dr. Alejandro López', N'Dr. María Rodríguez', N'', N'', N'', 1145928000, 1145928111, NULL, NULL, NULL, N'Av. Córdoba 2351', N'Buenos Aires', N'Buenos Aires', 1145928000, N'Dr. Alejandro López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (66, N'Hospital de Niños Ricardo Gutiérrez', N'INFO@HNRG.ORG.AR', N'CONTACTO@HNRG.ORG.AR', N'', N'', N'', N'Dr. Carlos Sánchez', N'Dr. Laura Martínez', N'', N'', N'', 1143017000, 1143017111, NULL, NULL, NULL, N'Gallo 1330', N'Buenos Aires', N'Buenos Aires', 1143017000, N'Dr. Carlos Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (67, N'Hospital Posadas', N'INFO@HOSPITALPOSADAS.GOB.AR', N'CONTACTO@HOSPITALPOSADAS.GOB.AR', N'', N'', N'', N'Dr. Juan Pérez', N'Dr. María Rodríguez', N'', N'', N'', 1146620200, 1146620300, NULL, NULL, NULL, N'Av. Presidente Illia s/n', N'El Palomar', N'Buenos Aires', 1146620200, N'Dr. Juan Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (68, N'Hospital Ramos Mejía', N'INFO@HOSPITALRAMOSMEJIA.BA.GOV.AR', N'CONTACTO@HOSPITALRAMOSMEJIA.BA.GOV.AR', N'', N'', N'', N'Dr. Martín Fernández', N'Dr. Laura Martínez', N'', N'', N'', 1144339500, 1144339600, NULL, NULL, NULL, N'Urquiza 609', N'Buenos Aires', N'Buenos Aires', 1144339500, N'Dr. Martín Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (69, N'Hospital Italiano de La Plata', N'INFO@HOSPITALITALIANOLP.ORG.AR', N'CONTACTO@HOSPITALITALIANOLP.ORG.AR', N'', N'', N'', N'Dr. Marcos Pérez', N'Dr. Sofía Gómez', N'', N'', N'', 2216105000, 2216105111, NULL, NULL, NULL, N'Calle 51 Nº 320', N'La Plata', N'Buenos Aires', 2216105000, N'Dr. Marcos Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (70, N'Hospital de Pediatría Prof. Dr. Juan P. Garrahan', N'INFO@HOSPITALGARRAHAN.GOV.AR', N'CONTACTO@HOSPITALGARRAHAN.GOV.AR', N'', N'', N'', N'Dr. Sebastián Pérez', N'Dr. Ana López', N'', N'', N'', 1143005400, 1143005411, NULL, NULL, NULL, N'Combate de los Pozos 1881', N'Buenos Aires', N'Buenos Aires', 1143005400, N'Dr. Sebastián Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (71, N'Hospital Privado de Rosario', N'INFO@HOSPITALPRIVADOROSARIO.COM.AR', N'CONTACTO@HOSPITALPRIVADOROSARIO.COM.AR', N'', N'', N'', N'Dr. Juan Martínez', N'Dr. María Rodríguez', N'', N'', N'', 3414486700, 3414486711, NULL, NULL, NULL, N'Urquiza 3101', N'Rosario', N'Santa Fe', 3414486700, N'Dr. Juan Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (72, N'Hospital Italiano de Mendoza', N'INFO@HOSPITALITALIANOMZA.ORG.AR', N'CONTACTO@HOSPITALITALIANOMZA.ORG.AR', N'', N'', N'', N'Dr. Marcos Gutiérrez', N'Dra. Laura Pérez', N'', N'', N'', 2614478900, 2614478911, NULL, NULL, NULL, N'Patricias Mendocinas 1550', N'Mendoza', N'Mendoza', 2614478900, N'Dr. Marcos Gutiérrez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (73, N'Hospital Italiano de Bahía Blanca', N'INFO@HOSPITALITALIANOBB.ORG.AR', N'CONTACTO@HOSPITALITALIANOBB.ORG.AR', N'', N'', N'', N'Dr. Juan Sánchez', N'Dra. Ana Martínez', N'', N'', N'', 2914567800, 2914567811, NULL, NULL, NULL, N'Donado 401', N'Bahía Blanca', N'Buenos Aires', 2914567800, N'Dr. Juan Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (74, N'Sanatorio Allende', N'INFO@SANATORIOALLENDE.COM.AR', N'CONTACTO@SANATORIOALLENDE.COM.AR', N'', N'', N'', N'Dr. José Martínez', N'Dra. María Sánchez', N'', N'', N'', 3514009000, 3514009111, NULL, NULL, NULL, N'Humberto Primo 1200', N'Córdoba', N'Córdoba', 3514009000, N'Dr. José Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (75, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', N'', N'', N'', N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', N'', N'', N'', 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (76, N'Clínica Santa Isabel', N'INFO@CLINICASANTAISABEL.COM.AR', N'CONTACTO@CLINICASANTAISABEL.COM.AR', N'', N'', N'', N'Dr. Juan Pérez', N'Dra. Laura Sánchez', N'', N'', N'', 3874628700, 3874628711, NULL, NULL, NULL, N'San Martín 1350', N'Salta', N'Salta', 3874628700, N'Dr. Juan Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (77, N'Sanatorio Otamendi y Miroli', N'INFO@OTAMENDI.COM.AR', N'CONTACTO@OTAMENDI.COM.AR', N'', N'', N'', N'Dr. Federico López', N'Dra. Ana Martínez', N'', N'', N'', 1143084000, 1143084111, NULL, NULL, NULL, N'Azcuénaga 870', N'Buenos Aires', N'Buenos Aires', 1143084000, N'Dr. Federico López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (78, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', N'', N'', N'', N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', N'', N'', N'', 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (79, N'Sanatorio Mater Dei', N'INFO@SANATORIOMATERDEI.COM.AR', N'CONTACTO@SANATORIOMATERDEI.COM.AR', N'', N'', N'', N'Dr. Juan Martínez', N'Dra. María Rodríguez', N'', N'', N'', 1143698700, 1143698711, NULL, NULL, NULL, N'Hidalgo 2390', N'Buenos Aires', N'Buenos Aires', 1143698700, N'Dr. Juan Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (80, N'Sanatorio La Trinidad Palermo', N'INFO@SANATORIOLATRINIDAD.COM.AR', N'CONTACTO@SANATORIOLATRINIDAD.COM.AR', N'', N'', N'', N'Dr. Federico Pérez', N'Dra. Laura Gómez', N'', N'', N'', 1148456000, 1148456111, NULL, NULL, NULL, N'Guardia Vieja 4435', N'Buenos Aires', N'Buenos Aires', 1148456000, N'Dr. Federico Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (81, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', N'', N'', N'', N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', N'', N'', N'', 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (82, N'HOSPITAL SECCIONAL DE LOS ANTIGUOS REYNALDO ABIMBI', N'JUANMAYORGA@HOTMAIL.COM', N'LABORATORIO.LA@HOTMAIL.COM', N'', N'', N'', N'BIOQ JUAN MAYORGA', N'', N'', N'', N'', 2963491303, 297154947434, NULL, NULL, NULL, N'PATAGONIA ARGENTINA 68', N'LOS ANTIGUOS', N'SANTA CRUZ', 2963491303, N'BIOQ JUAN MAYORGA', N'LABORATORIO')
SET IDENTITY_INSERT [dbo].[Hospital] OFF
GO
SET IDENTITY_INSERT [dbo].[Muestra] ON 

INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (1, NULL, N'Italiano', 2, N'Gomez', N'Pepito', CAST(N'2024-06-06T10:31:00.000' AS DateTime), CAST(N'2024-06-04T10:31:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-05-31T00:00:00.000' AS DateTime), 40, 2980, N'Sano', N'no', NULL, N'Termino', 0, 0, N'Gonzales', N'Ana', 56417818, N'CABA', N'CABA', 98762967, N'Garrahan', 0, 0, 0, CAST(N'2024-06-07T10:31:00.000' AS DateTime), 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, N'Susana Gimenez', N'partera', N'firma', CAST(N'2024-06-05T10:31:00.000' AS DateTime), CAST(N'2024-06-15T10:31:00.000' AS DateTime), NULL)
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (2, NULL, N'Italiano', 2, N'Gomez', N'Pepito', CAST(N'2024-05-18T10:34:00.000' AS DateTime), CAST(N'2024-06-14T10:34:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-06-06T00:00:00.000' AS DateTime), 40, 2980, N'Sano', N'no', NULL, N'Termino', 0, 0, N'Gonzales', N'Ana', 56417818, N'CABA', N'CABA', 98762967, N'Garrahan', 0, 0, 0, CAST(N'2024-06-01T10:34:00.000' AS DateTime), 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, N'Susana Gimenez', N'partera', N'firma', CAST(N'2024-06-07T10:34:00.000' AS DateTime), CAST(N'2024-06-13T10:34:00.000' AS DateTime), NULL)
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (3, NULL, N'Hospital Italiano', 2, N'g', N'g', CAST(N'2024-06-20T08:58:00.000' AS DateTime), CAST(N'2024-07-01T08:58:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-07-16T00:00:00.000' AS DateTime), 40, 2900, N'Sano', N'no', NULL, N'Termino', 0, 0, N'dss', N'dfsf', 1445, N'dfd', N'gfg', 43, N'fd', 0, 0, 0, CAST(N'2024-06-03T08:59:00.000' AS DateTime), 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, N'fdfd', N'fdfdf', N'dfdf', CAST(N'2024-06-20T08:59:00.000' AS DateTime), CAST(N'2024-07-02T09:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Muestra] OFF
GO
SET IDENTITY_INSERT [dbo].[MuestraResultado] ON 

INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MuestraResultado] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Apellido], [Email], [Telefono], [IdHospital], [LecturaPermiso], [EdicionPermiso], [ImpresionPermiso]) VALUES (1, N'Santiago', N'Butler', N'santiagobutler@gmial.com', 1156247823, 2, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Perfil] OFF
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
/****** Object:  StoredProcedure [dbo].[ActualizarMuestra]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarResultado]    Script Date: 12/7/2024 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizarResultado]
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
GO
/****** Object:  StoredProcedure [dbo].[BuscarMuestraPorFiltros]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarHospital]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarMuestra]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarMuestraYResultado]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarPaciente]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarHospital]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarMuestra]    Script Date: 12/7/2024 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarMuestra]
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
    @ObservacionesMuestra VARCHAR(1000)
AS
BEGIN
    -- Insertar en la tabla Muestra
    INSERT INTO [dbo].[Muestra] (
        InstitucionNacimiento, IdHospitalMuestra, ApellidoBebe, NombreBebe, 
        FechaHoraNacimiento, FechaHoraExtraccion, Sexo, Alimentacion, FechaIngestaLeche,
        SemanasGestacion, Peso, CondicionRN, PatologiaBase, Parto, EmbarazoMultiple,
        EmbarazoGemelar, ApellidoMama, NombreMama, Documento, Domicilio, Localidad,
        Telefono, LugarControlEmbarazo, Antibioticos, DesinfectantesYodados, Transfusion,
        FechaTransfusion, Dopamina, Dobutamina, CorticoidesMadre, CorticoidesBebe,
        Tiroidepatias, Otras, RepiteMuestra, Prematuro, MalaMuestra, ResultadoAlterado,
        Analitico, Responsable, RolResponsable, FirmaSello, FechaEnvio, FechaLlegada, Observaciones
    )
    VALUES (
        @InstitucionNacimiento, @IdHospitalMuestra, @ApellidoBebe, @NombreBebe, 
        @FechaHoraNacimiento, @FechaHoraExtraccion, @Sexo, @Alimentacion, @FechaIngestaLeche,
        @SemanasGestacion, @Peso, @CondicionRN, @PatologiaBase, @Parto, @EmbarazoMultiple,
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
GO
/****** Object:  StoredProcedure [dbo].[InsertarPaciente]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarResultado]    Script Date: 12/7/2024 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*----------------PERFILES----------------*/

/*Insertar muestra y resultados*/
CREATE PROCEDURE [dbo].[InsertarResultado]
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
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitales]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitalPorId]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitalPorNombre]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraPorId]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraPorResultado]    Script Date: 12/7/2024 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarMuestraPorResultado]
    @IdMuestra INT
AS
BEGIN
	
    -- Definir la consulta principal
    SELECT *
    FROM Muestra
	WHERE
	IdMuestra = @IdMuestra 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraResultadoPorFiltro]    Script Date: 12/7/2024 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarMuestraResultadoPorFiltro]
    @Provincia varchar(100) = null,
    @Hospital varchar(100) = null,
    @ApellidoBebe varchar(100) = null,
    @ApellidoMama varchar(100) = null,
    @FechaDesde datetime = null,
    @FechaHasta datetime = null,
    @OrdenadoPor varchar(100) = null
AS
BEGIN
	
    -- Definir la consulta principal
    SELECT *
    FROM MuestraResultado
	INNER JOIN Muestra ON Muestra.IdMuestra = MuestraResultado.IdMuestra
	WHERE
	Localidad = @provincia 
    AND IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE NombreHospital = @hospital) 
    AND ApellidoBebe = @apellidoBebe 
    AND ApellidoMama = @apellidoMama 
    AND FechaEnvio >= @fechaDesde 
    AND FechaLlegada <= @fechaHasta
	ORDER BY
        CASE
            WHEN @ordenadoPor = 'ApellidoBebe' THEN Convert(varchar, ApellidoBebe)
            WHEN @ordenadoPor = 'ApellidoMama' THEN Convert(varchar, ApellidoMama)
            WHEN @ordenadoPor = 'FechaHoraExtraccion' THEN Convert(varchar, FechaHoraExtraccion)
            ELSE Convert(varchar, IdHospitalMuestra)
		END
		DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPacientesPorFiltros]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SeleccionarPerfiles]    Script Date: 12/7/2024 10:51:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SeleccionarPerfilPorId]    Script Date: 12/7/2024 10:51:57 ******/
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
