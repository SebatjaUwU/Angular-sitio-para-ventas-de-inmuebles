USE [master]
GO
/****** Object:  Database [VentasSAE]    Script Date: 07/01/2026 1:11:52 p. m. ******/
CREATE DATABASE [VentasSAE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VentasSAE', FILENAME = N'E:\MSSQLDEVELOPSERVER\DATA\VentasSAE\VentasSAE.mdf' , SIZE = 69632KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VentasSAE_log', FILENAME = N'F:\MSSQLDEVELOPSERVER\LOG\VentasSAE\VentasSAE_log.ldf' , SIZE = 17408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VentasSAE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VentasSAE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VentasSAE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VentasSAE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VentasSAE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VentasSAE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VentasSAE] SET ARITHABORT OFF 
GO
ALTER DATABASE [VentasSAE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VentasSAE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VentasSAE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VentasSAE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VentasSAE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VentasSAE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VentasSAE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VentasSAE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VentasSAE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VentasSAE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VentasSAE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VentasSAE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VentasSAE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VentasSAE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VentasSAE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VentasSAE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VentasSAE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VentasSAE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VentasSAE] SET  MULTI_USER 
GO
ALTER DATABASE [VentasSAE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VentasSAE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VentasSAE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VentasSAE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VentasSAE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VentasSAE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VentasSAE', N'ON'
GO
ALTER DATABASE [VentasSAE] SET QUERY_STORE = ON
GO
ALTER DATABASE [VentasSAE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VentasSAE]
GO
/****** Object:  User [SAE\jparra]    Script Date: 07/01/2026 1:11:52 p. m. ******/
CREATE USER [SAE\jparra] FOR LOGIN [SAE\jparra] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SAE\dtique]    Script Date: 07/01/2026 1:11:52 p. m. ******/
CREATE USER [SAE\dtique] FOR LOGIN [SAE\dtique] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DEVELOPSERVER\Desarrollo]    Script Date: 07/01/2026 1:11:52 p. m. ******/
CREATE USER [DEVELOPSERVER\Desarrollo] FOR LOGIN [DEVELOPSERVER\Desarrollo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Aplicativo_Desarrollo]    Script Date: 07/01/2026 1:11:52 p. m. ******/
CREATE USER [Aplicativo_Desarrollo] FOR LOGIN [Aplicativo_Desarrollo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAE\jparra]
GO
ALTER ROLE [db_owner] ADD MEMBER [SAE\dtique]
GO
ALTER ROLE [db_owner] ADD MEMBER [DEVELOPSERVER\Desarrollo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Aplicativo_Desarrollo]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[id_sucursal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosOcupacion]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosOcupacion](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotosInmueble]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotosInmueble](
	[id_foto] [int] IDENTITY(1,1) NOT NULL,
	[id_inmueble] [int] NOT NULL,
	[foto_url] [varchar](255) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[estado_registro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_foto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inmueble]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmueble](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[folio_matricula] [varchar](100) NOT NULL,
	[id_subtipo] [int] NOT NULL,
	[area_terreno] [decimal](10, 2) NOT NULL,
	[area_construida] [decimal](10, 2) NULL,
	[id_municipio] [int] NOT NULL,
	[id_estado_ocupacion] [int] NOT NULL,
	[precio] [bigint] NULL,
	[id_sucursal] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[estado_registro] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[Direccion] [nvarchar](500) NULL,
	[link_comercializacion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipios]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipios](
	[id] [int] NOT NULL,
	[municipio] [nvarchar](255) NOT NULL,
	[estado] [tinyint] NOT NULL,
	[departamento_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposPropiedad]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposPropiedad](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (5, N'ANTIOQUIA', 4)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (8, N'ATLÁNTICO', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (11, N'BOGOTÁ, D.C.', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (13, N'BOLÍVAR', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (15, N'BOYACÁ', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (17, N'CALDAS', 4)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (18, N'CAQUETÁ', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (19, N'CAUCA', 3)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (20, N'CESAR', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (23, N'CÓRDOBA', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (25, N'CUNDINAMARCA', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (27, N'CHOCÓ', 4)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (41, N'HUILA', 3)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (44, N'LA GUAJIRA', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (47, N'MAGDALENA', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (50, N'META', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (52, N'NARIÑO', 3)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (54, N'NORTE DE SANTANDER', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (63, N'QUINDIO', 4)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (66, N'RISARALDA', 4)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (68, N'SANTANDER', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (70, N'SUCRE', 1)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (73, N'TOLIMA', 3)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (76, N'VALLE DEL CAUCA', 3)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (81, N'ARAUCA', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (85, N'CASANARE', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (86, N'PUTUMAYO', 3)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (88, N'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA', 4)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (91, N'AMAZONAS', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (94, N'GUAINÍA', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (95, N'GUAVIARE', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (97, N'VAUPÉS', 2)
INSERT [dbo].[Departamentos] ([id], [nombre], [id_sucursal]) VALUES (99, N'VICHADA', 2)
GO
INSERT [dbo].[EstadosOcupacion] ([id], [nombre]) VALUES (1, N'Desocupado')
INSERT [dbo].[EstadosOcupacion] ([id], [nombre]) VALUES (2, N'Arrendado')
INSERT [dbo].[EstadosOcupacion] ([id], [nombre]) VALUES (3, N'Ocupado')
GO


GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1, N'Abriaquí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (2, N'Acacías', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (3, N'Acandí', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (4, N'Acevedo', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (5, N'Achí', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (6, N'Agrado', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (7, N'Agua de Dios', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (8, N'Aguachica', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (9, N'Aguada', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (10, N'Aguadas', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (11, N'Aguazul', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (12, N'Agustín Codazzi', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (13, N'Aipe', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (14, N'Albania', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (15, N'Albania', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (16, N'Albania', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (17, N'Albán', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (18, N'Albán (San José)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (19, N'Alcalá', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (20, N'Alejandria', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (21, N'Algarrobo', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (22, N'Algeciras', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (23, N'Almaguer', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (24, N'Almeida', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (25, N'Alpujarra', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (26, N'Altamira', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (27, N'Alto Baudó (Pie de Pato)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (28, N'Altos del Rosario', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (29, N'Alvarado', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (30, N'Amagá', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (31, N'Amalfi', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (32, N'Ambalema', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (33, N'Anapoima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (34, N'Ancuya', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (35, N'Andalucía', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (36, N'Andes', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (37, N'Angelópolis', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (38, N'Angostura', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (39, N'Anolaima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (40, N'Anorí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (41, N'Anserma', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (42, N'Ansermanuevo', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (43, N'Anzoátegui', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (44, N'Anzá', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (45, N'Apartadó', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (46, N'Apulo', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (47, N'Apía', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (48, N'Aquitania', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (49, N'Aracataca', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (50, N'Aranzazu', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (51, N'Aratoca', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (52, N'Arauca', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (53, N'Arauquita', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (54, N'Arbeláez', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (55, N'Arboleda (Berruecos)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (56, N'Arboledas', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (57, N'Arboletes', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (58, N'Arcabuco', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (59, N'Arenal', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (60, N'Argelia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (61, N'Argelia', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (62, N'Argelia', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (63, N'Ariguaní (El Difícil)', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (64, N'Arjona', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (65, N'Armenia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (66, N'Armenia', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (67, N'Armero (Guayabal)', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (68, N'Arroyohondo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (69, N'Astrea', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (70, N'Ataco', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (71, N'Atrato (Yuto)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (72, N'Ayapel', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (73, N'Bagadó', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (74, N'Bahía Solano (Mútis)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (75, N'Bajo Baudó (Pizarro)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (76, N'Balboa', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (77, N'Balboa', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (78, N'Baranoa', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (79, N'Baraya', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (80, N'Barbacoas', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (81, N'Barbosa', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (82, N'Barbosa', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (83, N'Barichara', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (84, N'Barranca de Upía', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (85, N'Barrancabermeja', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (86, N'Barrancas', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (87, N'Barranco de Loba', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (88, N'Barranquilla', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (89, N'Becerríl', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (90, N'Belalcázar', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (91, N'Bello', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (92, N'Belmira', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (93, N'Beltrán', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (94, N'Belén', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (95, N'Belén', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (96, N'Belén de Bajirá', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (97, N'Belén de Umbría', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (98, N'Belén de los Andaquíes', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (99, N'Berbeo', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (100, N'Betania', 1, 5)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (101, N'Beteitiva', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (102, N'Betulia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (103, N'Betulia', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (104, N'Bituima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (105, N'Boavita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (106, N'Bochalema', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (107, N'Bogotá D.C.', 1, 11)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (108, N'Bojacá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (109, N'Bojayá (Bellavista)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (110, N'Bolívar', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (111, N'Bolívar', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (112, N'Bolívar', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (113, N'Bolívar', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (114, N'Bosconia', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (115, N'Boyacá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (116, N'Briceño', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (117, N'Briceño', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (118, N'Bucaramanga', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (119, N'Bucarasica', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (120, N'Buenaventura', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (121, N'Buenavista', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (122, N'Buenavista', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (123, N'Buenavista', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (124, N'Buenavista', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (125, N'Buenos Aires', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (126, N'Buesaco', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (127, N'Buga', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (128, N'Bugalagrande', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (129, N'Burítica', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (130, N'Busbanza', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (131, N'Cabrera', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (132, N'Cabrera', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (133, N'Cabuyaro', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (134, N'Cachipay', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (135, N'Caicedo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (136, N'Caicedonia', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (137, N'Caimito', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (138, N'Cajamarca', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (139, N'Cajibío', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (140, N'Cajicá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (141, N'Calamar', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (142, N'Calamar', 1, 95)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (143, N'Calarcá', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (144, N'Caldas', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (145, N'Caldas', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (146, N'Caldono', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (147, N'California', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (148, N'Calima (Darién)', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (149, N'Caloto', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (150, N'Calí', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (151, N'Campamento', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (152, N'Campo de la Cruz', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (153, N'Campoalegre', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (154, N'Campohermoso', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (155, N'Canalete', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (156, N'Candelaria', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (157, N'Candelaria', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (158, N'Cantagallo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (159, N'Cantón de San Pablo', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (160, N'Caparrapí', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (161, N'Capitanejo', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (162, N'Caracolí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (163, N'Caramanta', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (164, N'Carcasí', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (165, N'Carepa', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (166, N'Carmen de Apicalá', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (167, N'Carmen de Carupa', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (168, N'Carmen de Viboral', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (169, N'Carmen del Darién (CURBARADÓ)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (170, N'Carolina', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (171, N'Cartagena', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (172, N'Cartagena del Chairá', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (173, N'Cartago', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (174, N'Carurú', 1, 97)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (175, N'Casabianca', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (176, N'Castilla la Nueva', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (177, N'Caucasia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (178, N'Cañasgordas', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (179, N'Cepita', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (180, N'Cereté', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (181, N'Cerinza', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (182, N'Cerrito', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (183, N'Cerro San Antonio', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (184, N'Chachaguí', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (185, N'Chaguaní', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (186, N'Chalán', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (187, N'Chaparral', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (188, N'Charalá', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (189, N'Charta', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (190, N'Chigorodó', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (191, N'Chima', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (192, N'Chimichagua', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (193, N'Chimá', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (194, N'Chinavita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (195, N'Chinchiná', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (196, N'Chinácota', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (197, N'Chinú', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (198, N'Chipaque', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (199, N'Chipatá', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (200, N'Chiquinquirá', 1, 15)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (201, N'Chiriguaná', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (202, N'Chiscas', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (203, N'Chita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (204, N'Chitagá', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (205, N'Chitaraque', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (206, N'Chivatá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (207, N'Chivolo', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (208, N'Choachí', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (209, N'Chocontá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (210, N'Chámeza', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (211, N'Chía', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (212, N'Chíquiza', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (213, N'Chívor', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (214, N'Cicuco', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (215, N'Cimitarra', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (216, N'Circasia', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (217, N'Cisneros', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (218, N'Ciénaga', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (219, N'Ciénaga', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (220, N'Ciénaga de Oro', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (221, N'Clemencia', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (222, N'Cocorná', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (223, N'Coello', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (224, N'Cogua', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (225, N'Colombia', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (226, N'Colosó (Ricaurte)', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (227, N'Colón', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (228, N'Colón (Génova)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (229, N'Concepción', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (230, N'Concepción', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (231, N'Concordia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (232, N'Concordia', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (233, N'Condoto', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (234, N'Confines', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (235, N'Consaca', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (236, N'Contadero', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (237, N'Contratación', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (238, N'Convención', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (239, N'Copacabana', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (240, N'Coper', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (241, N'Cordobá', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (242, N'Corinto', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (243, N'Coromoro', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (244, N'Corozal', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (245, N'Corrales', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (246, N'Cota', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (247, N'Cotorra', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (248, N'Covarachía', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (249, N'Coveñas', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (250, N'Coyaima', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (251, N'Cravo Norte', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (252, N'Cuaspud (Carlosama)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (253, N'Cubarral', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (254, N'Cubará', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (255, N'Cucaita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (256, N'Cucunubá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (257, N'Cucutilla', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (258, N'Cuitiva', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (259, N'Cumaral', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (260, N'Cumaribo', 1, 99)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (261, N'Cumbal', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (262, N'Cumbitara', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (263, N'Cunday', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (264, N'Curillo', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (265, N'Curití', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (266, N'Curumaní', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (267, N'Cáceres', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (268, N'Cáchira', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (269, N'Cácota', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (270, N'Cáqueza', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (271, N'Cértegui', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (272, N'Cómbita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (273, N'Córdoba', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (274, N'Córdoba', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (275, N'Cúcuta', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (276, N'Dabeiba', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (277, N'Dagua', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (278, N'Dibulla', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (279, N'Distracción', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (280, N'Dolores', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (281, N'Don Matías', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (282, N'Dos Quebradas', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (283, N'Duitama', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (284, N'Durania', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (285, N'Ebéjico', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (286, N'El Bagre', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (287, N'El Banco', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (288, N'El Cairo', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (289, N'El Calvario', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (290, N'El Carmen', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (291, N'El Carmen', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (292, N'El Carmen de Atrato', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (293, N'El Carmen de Bolívar', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (294, N'El Castillo', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (295, N'El Cerrito', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (296, N'El Charco', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (297, N'El Cocuy', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (298, N'El Colegio', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (299, N'El Copey', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (300, N'El Doncello', 1, 18)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (301, N'El Dorado', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (302, N'El Dovio', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (303, N'El Espino', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (304, N'El Guacamayo', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (305, N'El Guamo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (306, N'El Molino', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (307, N'El Paso', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (308, N'El Paujil', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (309, N'El Peñol', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (310, N'El Peñon', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (311, N'El Peñon', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (312, N'El Peñón', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (313, N'El Piñon', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (314, N'El Playón', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (315, N'El Retorno', 1, 95)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (316, N'El Retén', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (317, N'El Roble', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (318, N'El Rosal', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (319, N'El Rosario', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (320, N'El Tablón de Gómez', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (321, N'El Tambo', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (322, N'El Tambo', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (323, N'El Tarra', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (324, N'El Zulia', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (325, N'El Águila', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (326, N'Elías', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (327, N'Encino', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (328, N'Enciso', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (329, N'Entrerríos', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (330, N'Envigado', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (331, N'Espinal', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (332, N'Facatativá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (333, N'Falan', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (334, N'Filadelfia', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (335, N'Filandia', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (336, N'Firavitoba', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (337, N'Flandes', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (338, N'Florencia', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (339, N'Florencia', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (340, N'Floresta', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (341, N'Florida', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (342, N'Floridablanca', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (343, N'Florián', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (344, N'Fonseca', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (345, N'Fortúl', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (346, N'Fosca', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (347, N'Francisco Pizarro', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (348, N'Fredonia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (349, N'Fresno', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (350, N'Frontino', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (351, N'Fuente de Oro', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (352, N'Fundación', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (353, N'Funes', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (354, N'Funza', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (355, N'Fusagasugá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (356, N'Fómeque', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (357, N'Fúquene', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (358, N'Gachalá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (359, N'Gachancipá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (360, N'Gachantivá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (361, N'Gachetá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (362, N'Galapa', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (363, N'Galeras (Nueva Granada)', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (364, N'Galán', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (365, N'Gama', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (366, N'Gamarra', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (367, N'Garagoa', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (368, N'Garzón', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (369, N'Gigante', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (370, N'Ginebra', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (371, N'Giraldo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (372, N'Girardot', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (373, N'Girardota', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (374, N'Girón', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (375, N'Gonzalez', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (376, N'Gramalote', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (377, N'Granada', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (378, N'Granada', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (379, N'Granada', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (380, N'Guaca', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (381, N'Guacamayas', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (382, N'Guacarí', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (383, N'Guachavés', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (384, N'Guachené', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (385, N'Guachetá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (386, N'Guachucal', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (387, N'Guadalupe', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (388, N'Guadalupe', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (389, N'Guadalupe', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (390, N'Guaduas', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (391, N'Guaitarilla', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (392, N'Gualmatán', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (393, N'Guamal', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (394, N'Guamal', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (395, N'Guamo', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (396, N'Guapota', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (397, N'Guapí', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (398, N'Guaranda', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (399, N'Guarne', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (400, N'Guasca', 1, 25)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (401, N'Guatapé', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (402, N'Guataquí', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (403, N'Guatavita', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (404, N'Guateque', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (405, N'Guavatá', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (406, N'Guayabal de Siquima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (407, N'Guayabetal', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (408, N'Guayatá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (409, N'Guepsa', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (410, N'Guicán', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (411, N'Gutiérrez', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (412, N'Guática', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (413, N'Gámbita', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (414, N'Gámeza', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (415, N'Génova', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (416, N'Gómez Plata', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (417, N'Hacarí', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (418, N'Hatillo de Loba', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (419, N'Hato', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (420, N'Hato Corozal', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (421, N'Hatonuevo', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (422, N'Heliconia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (423, N'Herrán', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (424, N'Herveo', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (425, N'Hispania', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (426, N'Hobo', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (427, N'Honda', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (428, N'Ibagué', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (429, N'Icononzo', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (430, N'Iles', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (431, N'Imúes', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (432, N'Inzá', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (433, N'Inírida', 1, 94)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (434, N'Ipiales', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (435, N'Isnos', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (436, N'Istmina', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (437, N'Itagüí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (438, N'Ituango', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (439, N'Izá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (440, N'Jambaló', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (441, N'Jamundí', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (442, N'Jardín', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (443, N'Jenesano', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (444, N'Jericó', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (445, N'Jericó', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (446, N'Jerusalén', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (447, N'Jesús María', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (448, N'Jordán', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (449, N'Juan de Acosta', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (450, N'Junín', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (451, N'Juradó', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (452, N'La Apartada y La Frontera', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (453, N'La Argentina', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (454, N'La Belleza', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (455, N'La Calera', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (456, N'La Capilla', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (457, N'La Ceja', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (458, N'La Celia', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (459, N'La Cruz', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (460, N'La Cumbre', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (461, N'La Dorada', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (462, N'La Esperanza', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (463, N'La Estrella', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (464, N'La Florida', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (465, N'La Gloria', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (466, N'La Jagua de Ibirico', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (467, N'La Jagua del Pilar', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (468, N'La Llanada', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (469, N'La Macarena', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (470, N'La Merced', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (471, N'La Mesa', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (472, N'La Montañita', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (473, N'La Palma', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (474, N'La Paz', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (475, N'La Paz (Robles)', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (476, N'La Peña', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (477, N'La Pintada', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (478, N'La Plata', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (479, N'La Playa', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (480, N'La Primavera', 1, 99)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (481, N'La Salina', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (482, N'La Sierra', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (483, N'La Tebaida', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (484, N'La Tola', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (485, N'La Unión', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (486, N'La Unión', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (487, N'La Unión', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (488, N'La Unión', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (489, N'La Uvita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (490, N'La Vega', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (491, N'La Vega', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (492, N'La Victoria', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (493, N'La Victoria', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (494, N'La Victoria', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (495, N'La Virginia', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (496, N'Labateca', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (497, N'Labranzagrande', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (498, N'Landázuri', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (499, N'Lebrija', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (500, N'Leiva', 1, 52)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (501, N'Lejanías', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (502, N'Lenguazaque', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (503, N'Leticia', 1, 91)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (504, N'Liborina', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (505, N'Linares', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (506, N'Lloró', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (507, N'Lorica', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (508, N'Los Córdobas', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (509, N'Los Palmitos', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (510, N'Los Patios', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (511, N'Los Santos', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (512, N'Lourdes', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (513, N'Luruaco', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (514, N'Lérida', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (515, N'Líbano', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (516, N'López (Micay)', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (517, N'Macanal', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (518, N'Macaravita', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (519, N'Maceo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (520, N'Machetá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (521, N'Madrid', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (522, N'Magangué', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (523, N'Magüi (Payán)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (524, N'Mahates', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (525, N'Maicao', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (526, N'Majagual', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (527, N'Malambo', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (528, N'Mallama (Piedrancha)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (529, N'Manatí', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (530, N'Manaure', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (531, N'Manaure Balcón del Cesar', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (532, N'Manizales', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (533, N'Manta', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (534, N'Manzanares', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (535, N'Maní', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (536, N'Mapiripan', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (537, N'Margarita', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (538, N'Marinilla', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (539, N'Maripí', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (540, N'Mariquita', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (541, N'Marmato', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (542, N'Marquetalia', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (543, N'Marsella', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (544, N'Marulanda', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (545, N'María la Baja', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (546, N'Matanza', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (547, N'Medellín', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (548, N'Medina', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (549, N'Medio Atrato', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (550, N'Medio Baudó', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (551, N'Medio San Juan (ANDAGOYA)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (552, N'Melgar', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (553, N'Mercaderes', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (554, N'Mesetas', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (555, N'Milán', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (556, N'Miraflores', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (557, N'Miraflores', 1, 95)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (558, N'Miranda', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (559, N'Mistrató', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (560, N'Mitú', 1, 97)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (561, N'Mocoa', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (562, N'Mogotes', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (563, N'Molagavita', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (564, N'Momil', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (565, N'Mompós', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (566, N'Mongua', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (567, N'Monguí', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (568, N'Moniquirá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (569, N'Montebello', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (570, N'Montecristo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (571, N'Montelíbano', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (572, N'Montenegro', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (573, N'Monteria', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (574, N'Monterrey', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (575, N'Morales', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (576, N'Morales', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (577, N'Morelia', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (578, N'Morroa', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (579, N'Mosquera', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (580, N'Mosquera', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (581, N'Motavita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (582, N'Moñitos', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (583, N'Murillo', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (584, N'Murindó', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (585, N'Mutatá', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (586, N'Mutiscua', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (587, N'Muzo', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (588, N'Málaga', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (589, N'Nariño', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (590, N'Nariño', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (591, N'Nariño', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (592, N'Natagaima', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (593, N'Nechí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (594, N'Necoclí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (595, N'Neira', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (596, N'Neiva', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (597, N'Nemocón', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (598, N'Nilo', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (599, N'Nimaima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (600, N'Nobsa', 1, 15)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (601, N'Nocaima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (602, N'Norcasia', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (603, N'Norosí', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (604, N'Novita', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (605, N'Nueva Granada', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (606, N'Nuevo Colón', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (607, N'Nunchía', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (608, N'Nuquí', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (609, N'Nátaga', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (610, N'Obando', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (611, N'Ocamonte', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (612, N'Ocaña', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (613, N'Oiba', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (614, N'Oicatá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (615, N'Olaya', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (616, N'Olaya Herrera', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (617, N'Onzaga', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (618, N'Oporapa', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (619, N'Orito', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (620, N'Orocué', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (621, N'Ortega', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (622, N'Ospina', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (623, N'Otanche', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (624, N'Ovejas', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (625, N'Pachavita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (626, N'Pacho', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (627, N'Padilla', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (628, N'Paicol', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (629, N'Pailitas', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (630, N'Paime', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (631, N'Paipa', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (632, N'Pajarito', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (633, N'Palermo', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (634, N'Palestina', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (635, N'Palestina', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (636, N'Palmar', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (637, N'Palmar de Varela', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (638, N'Palmas del Socorro', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (639, N'Palmira', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (640, N'Palmito', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (641, N'Palocabildo', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (642, N'Pamplona', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (643, N'Pamplonita', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (644, N'Pandi', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (645, N'Panqueba', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (646, N'Paratebueno', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (647, N'Pasca', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (648, N'Patía (El Bordo)', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (649, N'Pauna', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (650, N'Paya', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (651, N'Paz de Ariporo', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (652, N'Paz de Río', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (653, N'Pedraza', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (654, N'Pelaya', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (655, N'Pensilvania', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (656, N'Peque', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (657, N'Pereira', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (658, N'Pesca', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (659, N'Peñol', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (660, N'Piamonte', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (661, N'Pie de Cuesta', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (662, N'Piedras', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (663, N'Piendamó', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (664, N'Pijao', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (665, N'Pijiño', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (666, N'Pinchote', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (667, N'Pinillos', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (668, N'Piojo', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (669, N'Pisva', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (670, N'Pital', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (671, N'Pitalito', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (672, N'Pivijay', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (673, N'Planadas', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (674, N'Planeta Rica', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (675, N'Plato', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (676, N'Policarpa', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (677, N'Polonuevo', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (678, N'Ponedera', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (679, N'Popayán', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (680, N'Pore', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (681, N'Potosí', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (682, N'Pradera', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (683, N'Prado', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (684, N'Providencia', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (685, N'Providencia', 1, 88)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (686, N'Pueblo Bello', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (687, N'Pueblo Nuevo', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (688, N'Pueblo Rico', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (689, N'Pueblorrico', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (690, N'Puebloviejo', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (691, N'Puente Nacional', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (692, N'Puerres', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (693, N'Puerto Asís', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (694, N'Puerto Berrío', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (695, N'Puerto Boyacá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (696, N'Puerto Caicedo', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (697, N'Puerto Carreño', 1, 99)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (698, N'Puerto Colombia', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (699, N'Puerto Concordia', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (700, N'Puerto Escondido', 1, 23)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (701, N'Puerto Gaitán', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (702, N'Puerto Guzmán', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (703, N'Puerto Leguízamo', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (704, N'Puerto Libertador', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (705, N'Puerto Lleras', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (706, N'Puerto López', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (707, N'Puerto Nare', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (708, N'Puerto Nariño', 1, 91)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (709, N'Puerto Parra', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (710, N'Puerto Rico', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (711, N'Puerto Rico', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (712, N'Puerto Rondón', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (713, N'Puerto Salgar', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (714, N'Puerto Santander', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (715, N'Puerto Tejada', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (716, N'Puerto Triunfo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (717, N'Puerto Wilches', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (718, N'Pulí', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (719, N'Pupiales', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (720, N'Puracé (Coconuco)', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (721, N'Purificación', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (722, N'Purísima', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (723, N'Pácora', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (724, N'Páez', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (725, N'Páez (Belalcazar)', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (726, N'Páramo', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (727, N'Quebradanegra', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (728, N'Quetame', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (729, N'Quibdó', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (730, N'Quimbaya', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (731, N'Quinchía', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (732, N'Quipama', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (733, N'Quipile', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (734, N'Ragonvalia', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (735, N'Ramiriquí', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (736, N'Recetor', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (737, N'Regidor', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (738, N'Remedios', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (739, N'Remolino', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (740, N'Repelón', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (741, N'Restrepo', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (742, N'Restrepo', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (743, N'Retiro', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (744, N'Ricaurte', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (745, N'Ricaurte', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (746, N'Rio Negro', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (747, N'Rioblanco', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (748, N'Riofrío', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (749, N'Riohacha', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (750, N'Risaralda', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (751, N'Rivera', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (752, N'Roberto Payán (San José)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (753, N'Roldanillo', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (754, N'Roncesvalles', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (755, N'Rondón', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (756, N'Rosas', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (757, N'Rovira', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (758, N'Ráquira', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (759, N'Río Iró', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (760, N'Río Quito', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (761, N'Río Sucio', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (762, N'Río Viejo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (763, N'Río de oro', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (764, N'Ríonegro', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (765, N'Ríosucio', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (766, N'Sabana de Torres', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (767, N'Sabanagrande', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (768, N'Sabanalarga', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (769, N'Sabanalarga', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (770, N'Sabanalarga', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (771, N'Sabanas de San Angel (SAN ANGEL)', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (772, N'Sabaneta', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (773, N'Saboyá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (774, N'Sahagún', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (775, N'Saladoblanco', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (776, N'Salamina', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (777, N'Salamina', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (778, N'Salazar', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (779, N'Saldaña', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (780, N'Salento', 1, 63)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (781, N'Salgar', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (782, N'Samacá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (783, N'Samaniego', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (784, N'Samaná', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (785, N'Sampués', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (786, N'San Agustín', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (787, N'San Alberto', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (788, N'San Andrés', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (789, N'San Andrés Sotavento', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (790, N'San Andrés de Cuerquía', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (791, N'San Antero', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (792, N'San Antonio', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (793, N'San Antonio de Tequendama', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (794, N'San Benito', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (795, N'San Benito Abad', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (796, N'San Bernardo', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (797, N'San Bernardo', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (798, N'San Bernardo del Viento', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (799, N'San Calixto', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (800, N'San Carlos', 1, 5)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (801, N'San Carlos', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (802, N'San Carlos de Guaroa', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (803, N'San Cayetano', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (804, N'San Cayetano', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (805, N'San Cristobal', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (806, N'San Diego', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (807, N'San Eduardo', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (808, N'San Estanislao', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (809, N'San Fernando', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (810, N'San Francisco', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (811, N'San Francisco', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (812, N'San Francisco', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (813, N'San Gíl', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (814, N'San Jacinto', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (815, N'San Jacinto del Cauca', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (816, N'San Jerónimo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (817, N'San Joaquín', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (818, N'San José', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (819, N'San José de Miranda', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (820, N'San José de Montaña', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (821, N'San José de Pare', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (822, N'San José de Uré', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (823, N'San José del Fragua', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (824, N'San José del Guaviare', 1, 95)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (825, N'San José del Palmar', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (826, N'San Juan de Arama', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (827, N'San Juan de Betulia', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (828, N'San Juan de Nepomuceno', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (829, N'San Juan de Pasto', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (830, N'San Juan de Río Seco', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (831, N'San Juan de Urabá', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (832, N'San Juan del Cesar', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (833, N'San Juanito', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (834, N'San Lorenzo', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (835, N'San Luis', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (836, N'San Luís', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (837, N'San Luís de Gaceno', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (838, N'San Luís de Palenque', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (839, N'San Marcos', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (840, N'San Martín', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (841, N'San Martín', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (842, N'San Martín de Loba', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (843, N'San Mateo', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (844, N'San Miguel', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (845, N'San Miguel', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (846, N'San Miguel de Sema', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (847, N'San Onofre', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (848, N'San Pablo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (849, N'San Pablo', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (850, N'San Pablo de Borbur', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (851, N'San Pedro', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (852, N'San Pedro', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (853, N'San Pedro', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (854, N'San Pedro de Cartago', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (855, N'San Pedro de Urabá', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (856, N'San Pelayo', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (857, N'San Rafael', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (858, N'San Roque', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (859, N'San Sebastián', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (860, N'San Sebastián de Buenavista', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (861, N'San Vicente', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (862, N'San Vicente del Caguán', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (863, N'San Vicente del Chucurí', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (864, N'San Zenón', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (865, N'Sandoná', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (866, N'Santa Ana', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (867, N'Santa Bárbara', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (868, N'Santa Bárbara', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (869, N'Santa Bárbara (Iscuandé)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (870, N'Santa Bárbara de Pinto', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (871, N'Santa Catalina', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (872, N'Santa Fé de Antioquia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (873, N'Santa Genoveva de Docorodó', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (874, N'Santa Helena del Opón', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (875, N'Santa Isabel', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (876, N'Santa Lucía', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (877, N'Santa Marta', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (878, N'Santa María', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (879, N'Santa María', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (880, N'Santa Rosa', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (881, N'Santa Rosa', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (882, N'Santa Rosa de Cabal', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (883, N'Santa Rosa de Osos', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (884, N'Santa Rosa de Viterbo', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (885, N'Santa Rosa del Sur', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (886, N'Santa Rosalía', 1, 99)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (887, N'Santa Sofía', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (888, N'Santana', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (889, N'Santander de Quilichao', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (890, N'Santiago', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (891, N'Santiago', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (892, N'Santo Domingo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (893, N'Santo Tomás', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (894, N'Santuario', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (895, N'Santuario', 1, 66)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (896, N'Sapuyes', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (897, N'Saravena', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (898, N'Sardinata', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (899, N'Sasaima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (900, N'Sativanorte', 1, 15)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (901, N'Sativasur', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (902, N'Segovia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (903, N'Sesquilé', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (904, N'Sevilla', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (905, N'Siachoque', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (906, N'Sibaté', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (907, N'Sibundoy', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (908, N'Silos', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (909, N'Silvania', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (910, N'Silvia', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (911, N'Simacota', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (912, N'Simijaca', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (913, N'Simití', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (914, N'Sincelejo', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (915, N'Sincé', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (916, N'Sipí', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (917, N'Sitionuevo', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (918, N'Soacha', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (919, N'Soatá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (920, N'Socha', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (921, N'Socorro', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (922, N'Socotá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (923, N'Sogamoso', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (924, N'Solano', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (925, N'Soledad', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (926, N'Solita', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (927, N'Somondoco', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (928, N'Sonsón', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (929, N'Sopetrán', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (930, N'Soplaviento', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (931, N'Sopó', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (932, N'Sora', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (933, N'Soracá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (934, N'Sotaquirá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (935, N'Sotara (Paispamba)', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (936, N'Sotomayor (Los Andes)', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (937, N'Suaita', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (938, N'Suan', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (939, N'Suaza', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (940, N'Subachoque', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (941, N'Sucre', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (942, N'Sucre', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (943, N'Sucre', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (944, N'Suesca', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (945, N'Supatá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (946, N'Supía', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (947, N'Suratá', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (948, N'Susa', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (949, N'Susacón', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (950, N'Sutamarchán', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (951, N'Sutatausa', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (952, N'Sutatenza', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (953, N'Suárez', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (954, N'Suárez', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (955, N'Sácama', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (956, N'Sáchica', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (957, N'Tabio', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (958, N'Tadó', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (959, N'Talaigua Nuevo', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (960, N'Tamalameque', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (961, N'Tame', 1, 81)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (962, N'Taminango', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (963, N'Tangua', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (964, N'Taraira', 1, 97)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (965, N'Tarazá', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (966, N'Tarqui', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (967, N'Tarso', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (968, N'Tasco', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (969, N'Tauramena', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (970, N'Tausa', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (971, N'Tello', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (972, N'Tena', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (973, N'Tenerife', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (974, N'Tenjo', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (975, N'Tenza', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (976, N'Teorama', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (977, N'Teruel', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (978, N'Tesalia', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (979, N'Tibacuy', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (980, N'Tibaná', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (981, N'Tibasosa', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (982, N'Tibirita', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (983, N'Tibú', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (984, N'Tierralta', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (985, N'Timaná', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (986, N'Timbiquí', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (987, N'Timbío', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (988, N'Tinjacá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (989, N'Tipacoque', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (990, N'Tiquisio (Puerto Rico)', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (991, N'Titiribí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (992, N'Toca', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (993, N'Tocaima', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (994, N'Tocancipá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (995, N'Toguí', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (996, N'Toledo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (997, N'Toledo', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (998, N'Tolú', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (999, N'Tolú Viejo', 1, 70)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1000, N'Tona', 1, 68)
GO
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1001, N'Topagá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1002, N'Topaipí', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1003, N'Toribío', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1004, N'Toro', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1005, N'Tota', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1006, N'Totoró', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1007, N'Trinidad', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1008, N'Trujillo', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1009, N'Tubará', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1010, N'Tuchín', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1011, N'Tulúa', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1012, N'Tumaco', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1013, N'Tunja', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1014, N'Tunungua', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1015, N'Turbaco', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1016, N'Turbaná', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1017, N'Turbo', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1018, N'Turmequé', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1019, N'Tuta', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1020, N'Tutasá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1021, N'Támara', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1022, N'Támesis', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1023, N'Túquerres', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1024, N'Ubalá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1025, N'Ubaque', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1026, N'Ubaté', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1027, N'Ulloa', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1028, N'Une', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1029, N'Unguía', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1030, N'Unión Panamericana (ÁNIMAS)', 1, 27)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1031, N'Uramita', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1032, N'Uribe', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1033, N'Uribia', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1034, N'Urrao', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1035, N'Urumita', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1036, N'Usiacuri', 1, 8)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1037, N'Valdivia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1038, N'Valencia', 1, 23)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1039, N'Valle de San José', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1040, N'Valle de San Juan', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1041, N'Valle del Guamuez', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1042, N'Valledupar', 1, 20)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1043, N'Valparaiso', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1044, N'Valparaiso', 1, 18)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1045, N'Vegachí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1046, N'Venadillo', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1047, N'Venecia', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1048, N'Venecia (Ospina Pérez)', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1049, N'Ventaquemada', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1050, N'Vergara', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1051, N'Versalles', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1052, N'Vetas', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1053, N'Viani', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1054, N'Vigía del Fuerte', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1055, N'Vijes', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1056, N'Villa Caro', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1057, N'Villa Rica', 1, 19)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1058, N'Villa de Leiva', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1059, N'Villa del Rosario', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1060, N'Villagarzón', 1, 86)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1061, N'Villagómez', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1062, N'Villahermosa', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1063, N'Villamaría', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1064, N'Villanueva', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1065, N'Villanueva', 1, 44)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1066, N'Villanueva', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1067, N'Villanueva', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1068, N'Villapinzón', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1069, N'Villarrica', 1, 73)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1070, N'Villavicencio', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1071, N'Villavieja', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1072, N'Villeta', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1073, N'Viotá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1074, N'Viracachá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1075, N'Vista Hermosa', 1, 50)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1076, N'Viterbo', 1, 17)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1077, N'Vélez', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1078, N'Yacopí', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1079, N'Yacuanquer', 1, 52)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1080, N'Yaguará', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1081, N'Yalí', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1082, N'Yarumal', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1083, N'Yolombó', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1084, N'Yondó (Casabe)', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1085, N'Yopal', 1, 85)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1086, N'Yotoco', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1087, N'Yumbo', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1088, N'Zambrano', 1, 13)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1089, N'Zapatoca', 1, 68)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1090, N'Zapayán (PUNTA DE PIEDRAS)', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1091, N'Zaragoza', 1, 5)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1092, N'Zarzal', 1, 76)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1093, N'Zetaquirá', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1094, N'Zipacón', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1095, N'Zipaquirá', 1, 25)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1096, N'Zona Bananera (PRADO - SEVILLA)', 1, 47)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1097, N'Ábrego', 1, 54)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1098, N'Íquira', 1, 41)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1099, N'Úmbita', 1, 15)
INSERT [dbo].[municipios] ([id], [municipio], [estado], [departamento_id]) VALUES (1100, N'Útica', 1, 25)
GO
SET IDENTITY_INSERT [dbo].[Sucursales] ON 

INSERT [dbo].[Sucursales] ([id], [nombre]) VALUES (1, N'Direccion Territorial Caribe')
INSERT [dbo].[Sucursales] ([id], [nombre]) VALUES (2, N'Direccion Terriorial Centro Oriente')
INSERT [dbo].[Sucursales] ([id], [nombre]) VALUES (3, N'Direccion Terriorial Suroccidente')
INSERT [dbo].[Sucursales] ([id], [nombre]) VALUES (4, N'Direccion Terriorial Occidente')
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
GO
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (1, N'Finca')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (2, N'Apartamento')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (3, N'Local comercial')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (4, N'Habitación hotel')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (5, N'Casa')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (6, N'Bodega')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (7, N'Garaje')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (8, N'Hotel motel')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (9, N'Lote')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (10, N'Edificación para hotel')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (11, N'Oficina')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (12, N'Edificio')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (13, N'Parqueadero privado')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (14, N'Casa recreo')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (15, N'Apartaestudio')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (16, N'Centro industrial')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (17, N'Habitaciones de Hotel y Parqueadero')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (18, N'Lote con construcción')
INSERT [dbo].[TiposPropiedad] ([id], [nombre]) VALUES (19, N'Lote y construcción ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_folio_matricula]    Script Date: 07/01/2026 1:11:52 p. m. ******/
ALTER TABLE [dbo].[Inmueble] ADD  CONSTRAINT [UQ_folio_matricula] UNIQUE NONCLUSTERED 
(
	[folio_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FotosInmueble] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Inmueble] ADD  DEFAULT ((1)) FOR [estado_registro]
GO
ALTER TABLE [dbo].[Inmueble] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[municipios] ADD  DEFAULT ('') FOR [municipio]
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[FotosInmueble]  WITH CHECK ADD FOREIGN KEY([id_inmueble])
REFERENCES [dbo].[Inmueble] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD FOREIGN KEY([id_estado_ocupacion])
REFERENCES [dbo].[EstadosOcupacion] ([id])
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD FOREIGN KEY([id_municipio])
REFERENCES [dbo].[municipios] ([id])
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD FOREIGN KEY([id_subtipo])
REFERENCES [dbo].[TiposPropiedad] ([id])
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[municipios]  WITH CHECK ADD FOREIGN KEY([departamento_id])
REFERENCES [dbo].[Departamentos] ([id])
GO
/****** Object:  StoredProcedure [dbo].[ActivarInmueble]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActivarInmueble]
  @id INT
AS
BEGIN
 SET NOCOUNT ON;
 UPDATE Inmueble
 SET
  estado_registro = 1
  OUTPUT INSERTED.id
  WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[InactivarFoto]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InactivarFoto]
  @id INT
AS
BEGIN
 SET NOCOUNT ON;
 UPDATE FotosInmueble
 SET
  estado_registro = 0
  OUTPUT INSERTED.id_foto
  WHERE id_foto = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[InactivarInmueble]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InactivarInmueble]
  @id INT
AS
BEGIN
 SET NOCOUNT ON;
 UPDATE Inmueble
 SET
  estado_registro = 0
  OUTPUT INSERTED.id
  WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertInmueble]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInmueble]
  @FMI NVARCHAR(100),
  @id_subtipo INT,
  @Area_Terreno FLOAT,
  @Area_Construida FLOAT,
  @Direccion NVARCHAR(255),
  @id_municipio INT,
  @id_estado_ocupacion INT,
  @Precio DECIMAL(18,2),
  @id_sucursal INT,
  @Descripcion NVARCHAR(MAX),
  @link_comercializacion NVARCHAR(255),
  @estadoRegistro NVARCHAR(50)
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO Inmueble (
    folio_matricula, id_subtipo, Area_Terreno, Area_Construida, Direccion,
    id_municipio, id_estado_ocupacion, Precio, id_sucursal,
    Descripcion, link_comercializacion, estado_registro
  )
  OUTPUT INSERTED.id
  VALUES (
    @FMI, @id_subtipo, @Area_Terreno, @Area_Construida, @Direccion,
    @id_municipio, @id_estado_ocupacion, @Precio, @id_sucursal,
    @Descripcion, @link_comercializacion, @estadoRegistro
  );
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDepartamentos]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDepartamentos]
AS
BEGIN
    SELECT *
    FROM Departamentos

END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerFotosInmuebleActivos]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerFotosInmuebleActivos]
 @id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
	foto_url
    FROM FotosInmueble
    WHERE estado_registro = 1 and id_inmueble = @id
   

END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerFotosInmueblesActivos]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerFotosInmueblesActivos]
AS
BEGIN
    SELECT *
    FROM FotosInmueble
    WHERE estado_registro = 1
   

END;

GO
/****** Object:  StoredProcedure [dbo].[ObtenerInmueblesActivos]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerInmueblesActivos]
AS
BEGIN
    SELECT *
    FROM inmueble
    WHERE estado_registro = 1
    ORDER BY 
        CASE WHEN id IN (13, 15) THEN 0 ELSE 1 END,
        id;

END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInmueblesActivosConFotos]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerInmueblesActivosConFotos]
AS
BEGIN
   SELECT
   I.id,
   I.folio_matricula,
   I.id_subtipo,
   I.area_terreno,
   I.area_construida,
   I.id_municipio,
   I.id_estado_ocupacion,
   I.precio,
   I.id_sucursal,
   I.descripcion,
   I.estado_registro as 'estado_registro_inmueble',
   I.fecha_creacion as 'estado_registro_fecha_creacion',
   I.Direccion ,
   I.link_comercializacion,
   fi.id_foto,
   fi.id_inmueble,
   fi.foto_url,
   fi.fecha_creacion as 'fecha_creacion_foto',
   fi.estado_registro as 'estado_registro_foto'
   FROM 
   Inmueble I
   INNER JOIN FotosInmueble  FI ON I.id = FI.id_inmueble
   WHERE I.estado_registro = 1


END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInmueble]    Script Date: 07/01/2026 1:11:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInmueble]
  @id INT,
  @FMI NVARCHAR(100),
  @id_subtipo INT,
  @Area_Terreno FLOAT,
  @Area_Construida FLOAT,
  @Direccion NVARCHAR(255),
  @id_municipio INT,
  @id_estado_ocupacion INT,
  @Precio DECIMAL(18,2),
  @id_sucursal INT,
  @Descripcion NVARCHAR(MAX),
  @link_comercializacion NVARCHAR(255),
  @estadoRegistro NVARCHAR(50)
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE Inmueble
  SET
    folio_matricula = @FMI,
    id_subtipo = @id_subtipo,
    Area_Terreno = @Area_Terreno,
    Area_Construida = @Area_Construida,
    Direccion = @Direccion,
    id_municipio = @id_municipio,
    id_estado_ocupacion = @id_estado_ocupacion,
    Precio = @Precio,
    id_sucursal = @id_sucursal,
    Descripcion = @Descripcion,
    link_comercializacion = @link_comercializacion,
    estado_registro = @estadoRegistro
  OUTPUT INSERTED.id
  WHERE ID = @id;
END;
GO
USE [master]
GO
ALTER DATABASE [VentasSAE] SET  READ_WRITE 
GO
