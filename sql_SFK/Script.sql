USE [master]
GO
/****** Object:  Database [Ecomerce2019]    Script Date: 2/11/2019 13:40:46 ******/
--IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Ecomerce2019')
--BEGIN
CREATE DATABASE [Ecomerce2019]
 --END
GO
ALTER DATABASE [Ecomerce2019] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecomerce2019].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecomerce2019] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecomerce2019] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecomerce2019] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecomerce2019] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecomerce2019] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecomerce2019] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ecomerce2019] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecomerce2019] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecomerce2019] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecomerce2019] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecomerce2019] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecomerce2019] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecomerce2019] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecomerce2019] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecomerce2019] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ecomerce2019] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecomerce2019] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecomerce2019] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecomerce2019] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecomerce2019] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecomerce2019] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecomerce2019] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecomerce2019] SET RECOVERY FULL 
GO
ALTER DATABASE [Ecomerce2019] SET  MULTI_USER 
GO
ALTER DATABASE [Ecomerce2019] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecomerce2019] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecomerce2019] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecomerce2019] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ecomerce2019] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ecomerce2019', N'ON'
GO
ALTER DATABASE [Ecomerce2019] SET QUERY_STORE = OFF
GO
USE [Ecomerce2019]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Ecomerce2019]
GO
/****** Object:  User [saa]    Script Date: 2/11/2019 13:40:46 ******/
CREATE USER [saa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/11/2019 13:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdDoctor] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Review] [varchar](500) NULL,
	[Rate] [int] NULL,
	[Fecha] [datetime] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_admin]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_admin](
	[idAdmin] [int] IDENTITY(1,1) NOT NULL,
	[usuarioAdmin] [varchar](30) NOT NULL,
	[contraseñaAdmin] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Categoria]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nomCtegoria] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Cliente]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nomCliente] [varchar](50) NOT NULL,
	[apeCliente] [varchar](50) NOT NULL,
	[dniCliente] [char](8) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[edad] [int] NULL,
	[genero] [varchar](50) NULL,
	[fechaNacimiento] [date] NULL,
	[idDistrito] [int] NULL,
	[correo] [varchar](50) NULL,
	[telefono] [char](9) NULL,
	[direccion] [varchar](50) NULL,
	[foto] [varchar](200) NULL,
	[notas] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ClienteEx]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ClienteEx](
	[id] [nvarchar](250) NOT NULL,
	[nomCliente] [varchar](50) NOT NULL,
	[apeCliente] [varchar](50) NOT NULL,
	[dniCliente] [char](8) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](50) NOT NULL,
	[edad] [int] NULL,
	[genero] [varchar](50) NULL,
	[fechaNacimiento] [date] NULL,
	[idDistrito] [int] NULL,
	[Email] [varchar](256) NULL,
	[telefono] [char](9) NULL,
	[direccion] [varchar](50) NULL,
	[foto] [varchar](200) NULL,
	[notas] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_DetalleEnvio]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_DetalleEnvio](
	[idDetalleEnvio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[idDistrito] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_detalleOrden]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_detalleOrden](
	[idDetalleOrde] [int] IDENTITY(1,1) NOT NULL,
	[idOrden] [int] NOT NULL,
	[idDoctor] [int] NOT NULL,
	[precioUnidad] [decimal](18, 0) NULL,
	[cantidad] [int] NULL,
	[descuento] [decimal](18, 0) NULL,
	[cantidadTotal] [decimal](18, 0) NULL,
	[fechaOrden] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleOrde] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Distrito]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Distrito](
	[idDistrito] [int] IDENTITY(1,1) NOT NULL,
	[nomDistrito] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Doctor]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Doctor](
	[idDoctor] [int] IDENTITY(1,1) NOT NULL,
	[nomDoctor] [varchar](50) NOT NULL,
	[dniDoctor] [char](8) NOT NULL,
	[cmpDoctor] [char](6) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[id_Horario] [int] NOT NULL,
	[dirDoctor] [varchar](50) NOT NULL,
	[idDistrito] [int] NULL,
	[telDoctor] [varchar](50) NOT NULL,
	[emailDoctor] [varchar](50) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
	[PrecioAnterior] [decimal](18, 0) NULL,
	[ImageURL] [varchar](500) NULL,
	[TextoAlternativo] [varchar](50) NULL,
	[caracteristica1] [varchar](50) NULL,
	[caracteristica2] [varchar](50) NULL,
	[caracteristica3] [varchar](50) NULL,
	[caracteristica4] [varchar](50) NULL,
	[caracteristica5] [varchar](50) NULL,
	[Placa] [bit] NULL,
	[TituloOferta] [varchar](50) NULL,
	[ClaseDistintaOferta] [varchar](50) NULL,
	[DescripcionCorta] [varchar](300) NULL,
	[DescripcionLarga] [varchar](2000) NULL,
	[nota] [varchar](250) NULL,
	[agregarCarro] [bit] NULL,
	[caracteristica6] [nvarchar](50) NULL,
	[caracteristica7] [nvarchar](50) NULL,
	[caracteristica8] [nvarchar](50) NULL,
	[porc1] [nvarchar](50) NULL,
	[porc2] [nvarchar](50) NULL,
	[porc3] [nvarchar](50) NULL,
	[porc4] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Horario]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Horario](
	[id_Horario] [int] IDENTITY(1,1) NOT NULL,
	[dia] [varchar](50) NOT NULL,
	[horaApertura] [varchar](50) NULL,
	[horaCierre] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ListaDeseos]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ListaDeseos](
	[idListaDeseos] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idDoctor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idListaDeseos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ListaDeseosExt]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ListaDeseosExt](
	[idListaDeseos] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [nvarchar](128) NOT NULL,
	[idDoctor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idListaDeseos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Orden]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Orden](
	[idOrden] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idPago] [int] NULL,
	[idDetalleEnvio] [int] NULL,
	[descuento] [int] NULL,
	[impuestos] [int] NULL,
	[cantidadTotal] [int] NULL,
	[fechaOrden] [datetime] NULL,
	[fechaEnvio] [datetime] NULL,
	[enviado] [bit] NULL,
	[entregar] [bit] NULL,
	[fechaEntrega] [datetime] NULL,
	[notas] [varchar](500) NULL,
	[cancelarOrden] [bit] NULL,
	[Completo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_OrdenExt]    Script Date: 2/11/2019 13:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_OrdenExt](
	[idOrden] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [nvarchar](128) NOT NULL,
	[idPago] [int] NULL,
	[idDetalleEnvio] [int] NULL,
	[descuento] [int] NULL,
	[impuestos] [int] NULL,
	[cantidadTotal] [int] NULL,
	[fechaOrden] [datetime] NULL,
	[fechaEnvio] [datetime] NULL,
	[enviado] [bit] NULL,
	[entregar] [bit] NULL,
	[fechaEntrega] [datetime] NULL,
	[notas] [varchar](500) NULL,
	[cancelarOrden] [bit] NULL,
	[Completo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Pago]    Script Date: 2/11/2019 13:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPago] [int] NOT NULL,
	[MontoCrediyo] [money] NULL,
	[CantidadDebito] [money] NULL,
	[FechaPago] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TipoPago]    Script Date: 2/11/2019 13:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[nomTipoPago] [varchar](50) NOT NULL,
	[Deescripcion] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_VistaReciente]    Script Date: 2/11/2019 13:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_VistaReciente](
	[idVistaReciente] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idDoctor] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[notas] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVistaReciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201911010357144_Init', N'MvcAuth.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D05376E1B47CC90C668D7602A76DEF1A195F30ED09F236604BECB63012A548946363912FDB877C527E618B1275E345A2BAE5EE7630C0A045164F158B45B2582CFACFFFFD31FDE1390CAC279CA47E44CEECA3C9A16D61E2469E4F5667764697DF7EB07FF8FEEF7F9B5E7AE1B3F5734977C2E8A02549CFEC474AE353C749DD471CA27412FA6E12A5D1924EDC2874901739C78787FF728E8E1C0C10366059D6F45346A81FE2FC033E671171714C3314DC441E0E525E0E35F31CD5BA45214E63E4E233FBE6C93DCFE8E3A4A0B4ADF3C04720C51C074BDB428444145190F1F4738AE73489C86A1E43010A1E5E620C744B14A498CB7E5A939B76E3F09875C3A91B96506E96D2281C087874C2F5E288CDD7D2AE5DE90D3477091AA62FACD7B9F6CEEC6B0FE7459FA2001420323C9D0509230605572CCED3F816D349D97052405E2500F75B947C9D34110F2CE37607951D1D4F0ED9BF036B9605344BF019C1194D507060DD678BC0777FC22F0FD1574CCE4E8E16CB930FEFDE23EFE4FD77F8E45DB3A7D057A06B1540D17D12C53801D9F0B2EABF6D39ED768ED8B06AD6685368056C09A6846DDDA0E78F98ACE8234C96E30FB675E53F63AF2CE1C6F599F83083A0114D32F8BCCD82002D025CD53B9D3CD9FF1D5C8FDFBD1F85EB2D7AF257F9D00BFC61E22430AF3EE120AF4D1FFDB8985EADF1FEC2C9AE922864DF6DFB2A6ABFCCA32C715967222DC9034A5698B6A59B3AB5F11A9934831ADFAC4BD4FD376D26A96CDE4A52D6A1756642C962DBB3A194F775F91A5BDC791CC3E0E5A6C534D26970AD8D6A22B404A32AEA6B9339323519025DF92BAF809721F283119640032EE0792CFD24C4552F7F8CC0E010192CF33D4A535801BCFFA0F4B14374F83982E873EC660918E69CA2307E756EF78F11C1B759B860F6BE3D5EA30DCDC36FD1157269945C12D66A63BC8F91FB35CAE825F12E10C59FA95B02B2CF073F340718459C73D7C5697A05C68CBD59048E7509784DE8C9F16038B638EDDA059905C80FD53E88B08C7E29496B3F444D21F9221A32953FD225EAC768E51333514B52BDA80545AFA89C6CA8A80CCC4C524EA9173427E895B3A01ACDC3CB47687C172F87DD7F1F6FB3CD5BB71634D438871512FF1B139CC032E6DD234A7142EA1130593776E12CE4C3C798BEFADE9473FA1905D9D8ACD69A0DF92230FE6CC861F77F36E46242F193EF31AFC4E0E0531203BC11BDFA4CD53FE704C9B63D1D5ADDDC36F3EDAC01BAE9729EA691EBE7B34011F2E2018BB6FCE0C359FDD18BA2376204043A0686EEB32D0F4AA06FB6685477E402079862EBDC2D42823394BAC893D5081DF2060856EEA80AC1EA48485BB87F4A3CC1D271C21A2176084A61A6FA84CAD3C227AE1FA3A0574B424BC32D8CF5BDE221D65CE01813C6B0571326CCD5810F2640C54718943E0D4D9D86C5751BA2C66BD58D799F0B5B8FBB148FD88A4DF6F8CE1ABBE4FEDBAB1866B7C6B6609CDD2A3111401BC4DB8581F2B38AA9018807977D3350E1C4A43150EE526DC540DB1ADB8181B655F2E60CB438A29A8EBF705EDD37F36C1F94B7BFAD77AA6B07B6D9D2C79E9966E17B421B0A2D70229BE7C58255E267AA389C819CFC7C967257573411063EC7B41DB2A9FD5DA51FEA74838846D405581B5A0F28BFFE9380A4093540B83296D7291DF72206C09671B74E58BEF60BB00D1B90B19BD7A00D42FD65A9689C46A78FAA67953548466E745868E0280C425CBCDA1D37508A2E2E2B2BC6C4171EE20D373AC607A343413D9EAB4649656746D752699AFD5A523964435CB28DB424B84F1A2D959D195D4BDC46FB95A4700A06B8051BA9A8BD858F34D9CA4847B5DB547553A7C88CE2055347934235BD4171EC935523A58A9758F3229F6AF6ED7C78B2515860386EAAC839AAA4AD38D128412B2CD4026B90F4CA4F527A81285A2016E79979A144A6DC5B35CB7FC9B2B97DCA8358EE032535FB5DB4102EED5BFBACEC88F0F657D0BB90793379085D31F6EAE6164B6F43014A1451FB59146421D13B57FAD6C5DD5DB37D5122234C1D417EC979923425B9B86DB51B0D8A3C214618A0CA6F597F90F4103A55975E6753D93A4F548F5206A69A28BA60D5CE064DE7C0180F94E8170E1FA75E84D7994F3C19A509C08B066234F21924B0469D396A3BE5A489D9AE314714F24A9A9042D500299BD9232D219B156BE16934AAA630E720E78B34D1E55A736445E648135A51BD06B64266B1CE1C55915CD20456549B63D79926E202BAC73B96F6B4B2D696551C6637DBB33418AFB31A8EB3E535EEEC9B408DE28158FC565E02E3E57B6949DA13DD5A9654C42F36B3240D867EC569DD74B7179CCEEB793D66EBFABAB5A8775DDFEBF186D9EBAB5A85749813492AEED5A14E38BC4DF941AAFF918C74B22A486CAB54236CE82F29C5E184114CE6BF06B3C0C76CF92E096E10F19738A545CA867D7C78742CBCB5D99F772F4E9A7A81E220AA7BFCD21EB32D645F912794B88F2891732136781B52834A61E66BE2E1E733FBBF79ABD33C62C17EE5C507D675FA99F8BF6650F19064D8FA5DCEED1C2757DEE0754625E8EF6FE2D983B9CAAF7FF952343DB0EE12984EA7D6A1A0E87586BFFD1862903445D30DA459FB89C4DB9D6DAD77084A5461B6ACFFEC60E1D3519E1C94527E13A2E77F0C154DF9AC602344C5D381B1F04651A1EE69C03A58DA67011E7CD2FC59C0B0CEAA9F09AC239AF689804F8683890F04CC97A1B2E50EF721C561691B4B52AEE7DE04EB8DB22D77BD374979D81B4D7439D77A00DCA8F9D49BB9286F2C4F79B4AD5391863C1AF62EEDFED5738FF725DDB876DA779B65BCCDC4E28E4BA4BF543EF11E64C029327A769F35BC6D5BD3457FF73CF572586EF09E191BDFE6779F01BC6D63D30588F7DCD806E5F9EE99ADED6AFFDCB1A5196FA13BCFDA95139034B738AA28725F566E117287E3FF220223283CCAE231A53A0DAC2B85B587614DA267AACF3F13194B1347E22B5174B31DD657BEE1777696D374B3D5646D76F1E6EB7F276F4ED3CD5B930BB98B7C626536A22AC7BB671DEB4A997A4BF9C3AD9EF4A4ABF7F9AC9D57F26F295D7814A5B4668FE676F9ED64078FA29231A7CE806C60F9A218F6CEC6DF5C84FD3BF5573504FB0B8C04BBAD5DB3A2B926CBA8DCBC05894A122142738329F2604B3D4FA8BF442E856A1680CE5F83E7413D760DB2C0DE35B9CB689C51E8320E17412BE0C59C802EFE79CA735BE6E95DCCBED231BA0062FA2C707F477ECCFCC0ABE4BE52C4843410CCBBE0E15E369694857D572F15D26D440C81B8FA2AA7E80187710060E91D99A327BC8E6C607E1FF10AB92F75045007D23F106DB54F2F7CB44A5098728CBA3D7C820D7BE1F3F7FF07AEFF5E9C7A540000, N'6.2.0-61023')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'117187948848402819628', N'32c8ff64-d235-44a5-932a-e1dd7e986cd6')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'107090609728393799639', N'd59731ff-602f-404a-a728-4bb65f321c82')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'111017498902521593357', N'df48190e-26eb-491d-a1c4-e7087ccc5aad')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'32c8ff64-d235-44a5-932a-e1dd7e986cd6', N'maria.gonzalespineda14@gmail.com', 0, NULL, N'8403bfdc-b74f-46f9-b4fc-9d319188d16f', NULL, 0, 0, NULL, 1, 0, N'maria.gonzalespineda14@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd59731ff-602f-404a-a728-4bb65f321c82', N'geralhq@gmail.com', 0, NULL, N'ea71e018-f169-4753-b639-6a11945031d7', NULL, 0, 0, NULL, 1, 0, N'geralhq@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df48190e-26eb-491d-a1c4-e7087ccc5aad', N'ronal12.rhr@gmail.com', 0, NULL, N'e4225049-c698-4134-abe2-bc2580bb98c5', NULL, 0, 0, NULL, 1, 0, N'ronal12.rhr@gmail.com')
SET IDENTITY_INSERT [dbo].[tb_admin] ON 

INSERT [dbo].[tb_admin] ([idAdmin], [usuarioAdmin], [contraseñaAdmin]) VALUES (1, N'admin', N'123')
SET IDENTITY_INSERT [dbo].[tb_admin] OFF
SET IDENTITY_INSERT [dbo].[tb_Categoria] ON 

INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (1, N'Medicina General')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (2, N'Cardiología')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (3, N'Medicina Interna')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (4, N'Dermatologia')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (5, N'Psiquiatría')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (6, N'Ginecología')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (7, N'Pediatría')
INSERT [dbo].[tb_Categoria] ([idCategoria], [nomCtegoria]) VALUES (8, N'Oftalmología')
SET IDENTITY_INSERT [dbo].[tb_Categoria] OFF
INSERT [dbo].[tb_ClienteEx] ([id], [nomCliente], [apeCliente], [dniCliente], [UserName], [PasswordHash], [edad], [genero], [fechaNacimiento], [idDistrito], [Email], [telefono], [direccion], [foto], [notas]) VALUES (N'0b6fcd0c-8f8f-4be7-b56c-6379c9f16223', N'Maria ', N'Gonzales', N'54545420', N'mariagonzales', N'123456ABC', 21, N'F', NULL, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_DetalleEnvio] ON 

INSERT [dbo].[tb_DetalleEnvio] ([idDetalleEnvio], [nombre], [apellido], [correo], [telefono], [direccion], [idDistrito]) VALUES (1, N'demo', N'demo', N'demo@gmail.com', N'992960498', N'av. demo', 4)
INSERT [dbo].[tb_DetalleEnvio] ([idDetalleEnvio], [nombre], [apellido], [correo], [telefono], [direccion], [idDistrito]) VALUES (2, N'demo1', N'demo1', N'demo1@gmail.com', N'992960498', N'av. demo', 7)
SET IDENTITY_INSERT [dbo].[tb_DetalleEnvio] OFF
SET IDENTITY_INSERT [dbo].[tb_detalleOrden] ON 

INSERT [dbo].[tb_detalleOrden] ([idDetalleOrde], [idOrden], [idDoctor], [precioUnidad], [cantidad], [descuento], [cantidadTotal], [fechaOrden]) VALUES (2, 2, 3, CAST(24 AS Decimal(18, 0)), 1, NULL, CAST(24 AS Decimal(18, 0)), CAST(N'2019-11-02T13:35:34.773' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_detalleOrden] OFF
SET IDENTITY_INSERT [dbo].[tb_Distrito] ON 

INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (1, N'Miraflores')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (2, N'Surco')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (3, N'San Isidro')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (4, N'Barranco')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (5, N'Chorrillos')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (6, N'Los Olivos')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (7, N'San Miguel')
INSERT [dbo].[tb_Distrito] ([idDistrito], [nomDistrito]) VALUES (8, N'Callao')
SET IDENTITY_INSERT [dbo].[tb_Distrito] OFF
SET IDENTITY_INSERT [dbo].[tb_Doctor] ON 

INSERT [dbo].[tb_Doctor] ([idDoctor], [nomDoctor], [dniDoctor], [cmpDoctor], [idCategoria], [id_Horario], [dirDoctor], [idDistrito], [telDoctor], [emailDoctor], [Precio], [PrecioAnterior], [ImageURL], [TextoAlternativo], [caracteristica1], [caracteristica2], [caracteristica3], [caracteristica4], [caracteristica5], [Placa], [TituloOferta], [ClaseDistintaOferta], [DescripcionCorta], [DescripcionLarga], [nota], [agregarCarro], [caracteristica6], [caracteristica7], [caracteristica8], [porc1], [porc2], [porc3], [porc4]) VALUES (1, N'Bill Cárdenas', N'75148982', N'124563', 1, 1, N'Av las Rosas', 1, N'958845215', N'bill@gmail.com', CAST(15 AS Decimal(18, 0)), NULL, N'../Assets/img/team/1.png', NULL, N'Universidad Nacional Mayor de San Marcos', N'Boston University', N'Cambridge University ', N'Medico General en Hospital del Niño', N'Médico General en Hospital Cayetano Heredia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Urgencias y emergencias pedagógicas', N'Investigación y docencia en salud', N'95%', N'65%', N'85%', N'85%')
INSERT [dbo].[tb_Doctor] ([idDoctor], [nomDoctor], [dniDoctor], [cmpDoctor], [idCategoria], [id_Horario], [dirDoctor], [idDistrito], [telDoctor], [emailDoctor], [Precio], [PrecioAnterior], [ImageURL], [TextoAlternativo], [caracteristica1], [caracteristica2], [caracteristica3], [caracteristica4], [caracteristica5], [Placa], [TituloOferta], [ClaseDistintaOferta], [DescripcionCorta], [DescripcionLarga], [nota], [agregarCarro], [caracteristica6], [caracteristica7], [caracteristica8], [porc1], [porc2], [porc3], [porc4]) VALUES (2, N'Patricia Mulder', N'15896250', N'521486', 2, 2, N'Av Los Cipreces', 2, N'918520658', N'patricia@gmail.com', CAST(25 AS Decimal(18, 0)), NULL, N'../Assets/img/team/2.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'85%', N'55%', N'85%', N'85%')
INSERT [dbo].[tb_Doctor] ([idDoctor], [nomDoctor], [dniDoctor], [cmpDoctor], [idCategoria], [id_Horario], [dirDoctor], [idDistrito], [telDoctor], [emailDoctor], [Precio], [PrecioAnterior], [ImageURL], [TextoAlternativo], [caracteristica1], [caracteristica2], [caracteristica3], [caracteristica4], [caracteristica5], [Placa], [TituloOferta], [ClaseDistintaOferta], [DescripcionCorta], [DescripcionLarga], [nota], [agregarCarro], [caracteristica6], [caracteristica7], [caracteristica8], [porc1], [porc2], [porc3], [porc4]) VALUES (3, N'Carlos Villaran', N'25014782', N'102589', 3, 3, N'Av Jupiter ', 3, N'945821524', N'carlos@gmail.com', CAST(24 AS Decimal(18, 0)), NULL, N'../Assets/img/team/3.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Doctor] ([idDoctor], [nomDoctor], [dniDoctor], [cmpDoctor], [idCategoria], [id_Horario], [dirDoctor], [idDistrito], [telDoctor], [emailDoctor], [Precio], [PrecioAnterior], [ImageURL], [TextoAlternativo], [caracteristica1], [caracteristica2], [caracteristica3], [caracteristica4], [caracteristica5], [Placa], [TituloOferta], [ClaseDistintaOferta], [DescripcionCorta], [DescripcionLarga], [nota], [agregarCarro], [caracteristica6], [caracteristica7], [caracteristica8], [porc1], [porc2], [porc3], [porc4]) VALUES (4, N'Christopher Andrade', N'10258452', N'751205', 4, 4, N'Av Los Jasminez', 4, N'942151515', N'chris@gmail.com', CAST(25 AS Decimal(18, 0)), NULL, N'../Assets/img/team/4.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tb_Doctor] ([idDoctor], [nomDoctor], [dniDoctor], [cmpDoctor], [idCategoria], [id_Horario], [dirDoctor], [idDistrito], [telDoctor], [emailDoctor], [Precio], [PrecioAnterior], [ImageURL], [TextoAlternativo], [caracteristica1], [caracteristica2], [caracteristica3], [caracteristica4], [caracteristica5], [Placa], [TituloOferta], [ClaseDistintaOferta], [DescripcionCorta], [DescripcionLarga], [nota], [agregarCarro], [caracteristica6], [caracteristica7], [caracteristica8], [porc1], [porc2], [porc3], [porc4]) VALUES (5, N'Valentina Paredes', N'74541112', N'785412', 5, 5, N'Av Los Tulipanes', 5, N'955112154', N'val@gmail.com', CAST(30 AS Decimal(18, 0)), NULL, N'../Assets/img/team/5.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Doctor] OFF
SET IDENTITY_INSERT [dbo].[tb_Horario] ON 

INSERT [dbo].[tb_Horario] ([id_Horario], [dia], [horaApertura], [horaCierre]) VALUES (1, N'Domingo', N'09:00', N'00:00')
INSERT [dbo].[tb_Horario] ([id_Horario], [dia], [horaApertura], [horaCierre]) VALUES (2, N'Lunes -Martes', N'09:00', N'11:00')
INSERT [dbo].[tb_Horario] ([id_Horario], [dia], [horaApertura], [horaCierre]) VALUES (3, N'Miercoles - Sabado', N'09:00', N'20:00')
INSERT [dbo].[tb_Horario] ([id_Horario], [dia], [horaApertura], [horaCierre]) VALUES (4, N'Jueves - Viernes', N'09:00', N'21:00')
INSERT [dbo].[tb_Horario] ([id_Horario], [dia], [horaApertura], [horaCierre]) VALUES (5, N'Sabado - Martes', N'09:00', N'21:00')
SET IDENTITY_INSERT [dbo].[tb_Horario] OFF
SET IDENTITY_INSERT [dbo].[tb_ListaDeseosExt] ON 

INSERT [dbo].[tb_ListaDeseosExt] ([idListaDeseos], [idCliente], [idDoctor]) VALUES (7, N'32c8ff64-d235-44a5-932a-e1dd7e986cd6', 2)
INSERT [dbo].[tb_ListaDeseosExt] ([idListaDeseos], [idCliente], [idDoctor]) VALUES (8, N'32c8ff64-d235-44a5-932a-e1dd7e986cd6', 3)
INSERT [dbo].[tb_ListaDeseosExt] ([idListaDeseos], [idCliente], [idDoctor]) VALUES (9, N'32c8ff64-d235-44a5-932a-e1dd7e986cd6', 1)
SET IDENTITY_INSERT [dbo].[tb_ListaDeseosExt] OFF
SET IDENTITY_INSERT [dbo].[tb_OrdenExt] ON 

INSERT [dbo].[tb_OrdenExt] ([idOrden], [idCliente], [idPago], [idDetalleEnvio], [descuento], [impuestos], [cantidadTotal], [fechaOrden], [fechaEnvio], [enviado], [entregar], [fechaEntrega], [notas], [cancelarOrden], [Completo]) VALUES (1, N'df48190e-26eb-491d-a1c4-e7087ccc5aad', 1, 1, NULL, NULL, NULL, CAST(N'2019-11-02T13:32:55.853' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tb_OrdenExt] ([idOrden], [idCliente], [idPago], [idDetalleEnvio], [descuento], [impuestos], [cantidadTotal], [fechaOrden], [fechaEnvio], [enviado], [entregar], [fechaEntrega], [notas], [cancelarOrden], [Completo]) VALUES (2, N'df48190e-26eb-491d-a1c4-e7087ccc5aad', 2, 2, NULL, NULL, NULL, CAST(N'2019-11-02T13:35:34.653' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tb_OrdenExt] OFF
SET IDENTITY_INSERT [dbo].[tb_Pago] ON 

INSERT [dbo].[tb_Pago] ([idPago], [idTipoPago], [MontoCrediyo], [CantidadDebito], [FechaPago]) VALUES (1, 3, NULL, NULL, NULL)
INSERT [dbo].[tb_Pago] ([idPago], [idTipoPago], [MontoCrediyo], [CantidadDebito], [FechaPago]) VALUES (2, 3, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Pago] OFF
SET IDENTITY_INSERT [dbo].[tb_TipoPago] ON 

INSERT [dbo].[tb_TipoPago] ([idTipoPago], [nomTipoPago], [Deescripcion]) VALUES (1, N'Pago al contado', NULL)
INSERT [dbo].[tb_TipoPago] ([idTipoPago], [nomTipoPago], [Deescripcion]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[tb_TipoPago] ([idTipoPago], [nomTipoPago], [Deescripcion]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[tb_TipoPago] ([idTipoPago], [nomTipoPago], [Deescripcion]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[tb_TipoPago] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/11/2019 13:40:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/11/2019 13:40:48 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/11/2019 13:40:48 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2/11/2019 13:40:48 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/11/2019 13:40:48 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/11/2019 13:40:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customers] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Doctor] FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Doctor]
GO
ALTER TABLE [dbo].[tb_Cliente]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_Cliente]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_Cliente]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_ClienteEx]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_ClienteEx]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_ClienteEx]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_DetalleEnvio]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_DetalleEnvio]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_detalleOrden]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_detalleOrden]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([id_Horario])
REFERENCES [dbo].[tb_Horario] ([id_Horario])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([id_Horario])
REFERENCES [dbo].[tb_Horario] ([id_Horario])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([id_Horario])
REFERENCES [dbo].[tb_Horario] ([id_Horario])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[tb_Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[tb_Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[tb_Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_Doctor]  WITH CHECK ADD FOREIGN KEY([idDistrito])
REFERENCES [dbo].[tb_Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_ListaDeseos]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_ListaDeseosExt]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tb_ListaDeseosExt]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idDetalleEnvio])
REFERENCES [dbo].[tb_DetalleEnvio] ([idDetalleEnvio])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idDetalleEnvio])
REFERENCES [dbo].[tb_DetalleEnvio] ([idDetalleEnvio])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idDetalleEnvio])
REFERENCES [dbo].[tb_DetalleEnvio] ([idDetalleEnvio])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idPago])
REFERENCES [dbo].[tb_Pago] ([idPago])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idPago])
REFERENCES [dbo].[tb_Pago] ([idPago])
GO
ALTER TABLE [dbo].[tb_Orden]  WITH CHECK ADD FOREIGN KEY([idPago])
REFERENCES [dbo].[tb_Pago] ([idPago])
GO
ALTER TABLE [dbo].[tb_OrdenExt]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tb_OrdenExt]  WITH CHECK ADD FOREIGN KEY([idDetalleEnvio])
REFERENCES [dbo].[tb_DetalleEnvio] ([idDetalleEnvio])
GO
ALTER TABLE [dbo].[tb_OrdenExt]  WITH CHECK ADD FOREIGN KEY([idPago])
REFERENCES [dbo].[tb_Pago] ([idPago])
GO
ALTER TABLE [dbo].[tb_Pago]  WITH CHECK ADD FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[tb_TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[tb_Pago]  WITH CHECK ADD FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[tb_TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[tb_Pago]  WITH CHECK ADD FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[tb_TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[tb_VistaReciente]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_VistaReciente]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_VistaReciente]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_VistaReciente]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_VistaReciente]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
ALTER TABLE [dbo].[tb_VistaReciente]  WITH CHECK ADD FOREIGN KEY([idDoctor])
REFERENCES [dbo].[tb_Doctor] ([idDoctor])
GO
/****** Object:  StoredProcedure [dbo].[sp_cod]    Script Date: 2/11/2019 13:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_cod]
as
select top 1 idOrden from tb_Orden order by idOrden desc

GO
/****** Object:  StoredProcedure [dbo].[sp_listaDistrito]    Script Date: 2/11/2019 13:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_listaDistrito]
as
begin
select * from tb_Distrito
end

GO
/****** Object:  StoredProcedure [dbo].[sp_reportez]    Script Date: 2/11/2019 13:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*create proc [dbo].[sp_reporteq](@cod int)
as 
SELECT    dbo.tb_Orden.idOrden, dbo.tb_Cliente.nomCliente, dbo.tb_Cliente.apeCliente, dbo.tb_Producto.nomProducto, dbo.tb_detalleOrden.precioUnidad, dbo.tb_detalleOrden.cantidad, dbo.tb_Cliente.telefono, 
                         dbo.tb_Cliente.direccion, dbo.tb_TipoPago.nomTipoPago, dbo.tb_Orden.cantidadTotal
FROM            dbo.tb_Producto INNER JOIN
                         dbo.tb_detalleOrden ON dbo.tb_Producto.idProducto = dbo.tb_detalleOrden.idProducto INNER JOIN
                         dbo.tb_Orden INNER JOIN
                         dbo.tb_Cliente ON dbo.tb_Orden.idCliente = dbo.tb_Cliente.idCliente ON dbo.tb_detalleOrden.idOrden = dbo.tb_Orden.idOrden INNER JOIN
                         dbo.tb_Pago ON dbo.tb_Orden.idPago = dbo.tb_Pago.idPago INNER JOIN
                         dbo.tb_TipoPago ON dbo.tb_Pago.idTipoPago = dbo.tb_TipoPago.idTipoPago
						 where tb_Cliente.idCliente = @cod and tb_Orden.idOrden=(select top 1 idOrden from tb_Orden order by idOrden desc)
GO*/
/****** Object:  StoredProcedure [dbo].[sp_reportex]    Script Date: 03/07/2019 18:44:27 ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO*/
/*create procedure [dbo].[sp_reportex](@cod int)
as
begin
SELECT        dbo.tb_Orden.idOrden, dbo.tb_Cliente.nomCliente, dbo.tb_Cliente.apeCliente, dbo.tb_Producto.nomProducto, dbo.tb_detalleOrden.precioUnidad, dbo.tb_detalleOrden.cantidad, dbo.tb_Cliente.telefono, 
                         dbo.tb_Cliente.direccion, dbo.tb_TipoPago.nomTipoPago, dbo.tb_Orden.cantidadTotal
FROM            dbo.tb_Producto INNER JOIN
                         dbo.tb_detalleOrden ON dbo.tb_Producto.idProducto = dbo.tb_detalleOrden.idProducto INNER JOIN
                         dbo.tb_Orden INNER JOIN
                         dbo.tb_Cliente ON dbo.tb_Orden.idCliente = dbo.tb_Cliente.idCliente ON dbo.tb_detalleOrden.idOrden = dbo.tb_Orden.idOrden INNER JOIN
                         dbo.tb_Pago ON dbo.tb_Orden.idPago = dbo.tb_Pago.idPago INNER JOIN
                         dbo.tb_TipoPago ON dbo.tb_Pago.idTipoPago = dbo.tb_TipoPago.idTipoPago
						 where tb_Cliente.idCliente = @cod 
end
GO*/
/****** Object:  StoredProcedure [dbo].[sp_reportez]    Script Date: 03/07/2019 18:44:27 ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO*/
CREATE procedure [dbo].[sp_reportez](@cod int,@codb int)
as
begin
SELECT        dbo.tb_Orden.idOrden, dbo.tb_Cliente.nomCliente, dbo.tb_Cliente.apeCliente, dbo.tb_Doctor.nomDoctor, dbo.tb_detalleOrden.precioUnidad, dbo.tb_Doctor.telDoctor, dbo.tb_Cliente.telefono, 
                         dbo.tb_Cliente.direccion, dbo.tb_TipoPago.nomTipoPago, dbo.tb_Orden.cantidadTotal
FROM            dbo.tb_Doctor INNER JOIN
                         dbo.tb_detalleOrden ON dbo.tb_Doctor.idDoctor = dbo.tb_detalleOrden.idDoctor INNER JOIN
                         dbo.tb_Orden INNER JOIN
                         dbo.tb_Cliente ON dbo.tb_Orden.idCliente = dbo.tb_Cliente.idCliente ON dbo.tb_detalleOrden.idOrden = dbo.tb_Orden.idOrden INNER JOIN
                         dbo.tb_Pago ON dbo.tb_Orden.idPago = dbo.tb_Pago.idPago INNER JOIN
                         dbo.tb_TipoPago ON dbo.tb_Pago.idTipoPago = dbo.tb_TipoPago.idTipoPago
						 where tb_Cliente.idCliente = @cod and tb_Orden.idOrden=@codb
end

GO
USE [master]
GO
ALTER DATABASE [Ecomerce2019] SET  READ_WRITE 
GO
