USE [master]
GO
/****** Object:  Database [ProyectoFinal]    Script Date: 4/12/2019 1:37:35 p. m. ******/
CREATE DATABASE [ProyectoFinal] ON  PRIMARY 
( NAME = N'ProyectoFinal', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\ProyectoFinal.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProyectoFinal_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\ProyectoFinal_log.LDF' , SIZE = 512KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProyectoFinal] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinal] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoFinal] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinal] SET DB_CHAINING OFF 
GO
USE [ProyectoFinal]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 4/12/2019 1:37:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[cargoId] [int] IDENTITY(1,1) NOT NULL,
	[cargo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 4/12/2019 1:37:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[departamentoId] [int] IDENTITY(1,1) NOT NULL,
	[dep_codigo] [int] NULL,
	[nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[departamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[empleadoId] [int] IDENTITY(1,1) NOT NULL,
	[departamentoId] [int] NULL,
	[cargoId] [int] NULL,
	[mes_ingreso] [int] NULL,
	[año_ingreso] [int] NULL,
	[emp_codigo] [varchar](20) NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[telefono] [varchar](10) NULL,
	[salario] [money] NULL,
	[estatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[empleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licencias]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licencias](
	[licenciaId] [int] IDENTITY(1,1) NOT NULL,
	[emp_Id] [int] NULL,
	[desde] [date] NULL,
	[hasta] [date] NULL,
	[motivo] [varchar](200) NULL,
	[comentario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[licenciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mes]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mes](
	[mesId] [int] IDENTITY(1,1) NOT NULL,
	[mes] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[mesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nominas]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nominas](
	[nominaId] [int] IDENTITY(1,1) NOT NULL,
	[año] [int] NULL,
	[mes] [int] NULL,
	[monto_total] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[nominaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[permisoId] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[desde] [date] NULL,
	[hasta] [date] NULL,
	[comentario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[permisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salidas]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salidas](
	[salidaId] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[tipo_salida] [int] NULL,
	[motivo] [varchar](100) NULL,
	[fecha_salida] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[salidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_salida]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_salida](
	[tipo_salida_id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tipo_salida_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacaciones]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacaciones](
	[vacacionesId] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[desde] [date] NULL,
	[hasta] [date] NULL,
	[año_correspondiente] [int] NULL,
	[comentario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[vacacionesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON 

INSERT [dbo].[Cargo] ([cargoId], [cargo]) VALUES (1, N'Soporte Técnico')
INSERT [dbo].[Cargo] ([cargoId], [cargo]) VALUES (2, N'Asesor Financiero')
SET IDENTITY_INSERT [dbo].[Cargo] OFF
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([departamentoId], [dep_codigo], [nombre]) VALUES (1, 1, N'Financiero')
INSERT [dbo].[Departamentos] ([departamentoId], [dep_codigo], [nombre]) VALUES (2, 2, N'Tecnología de la información')
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([empleadoId], [departamentoId], [cargoId], [mes_ingreso], [año_ingreso], [emp_codigo], [nombre], [apellido], [telefono], [salario], [estatus]) VALUES (1, 1, 2, 5, 2019, N'1', N'camil', N'Beltre', N'8298695642', 20000.0000, 1)
INSERT [dbo].[Empleados] ([empleadoId], [departamentoId], [cargoId], [mes_ingreso], [año_ingreso], [emp_codigo], [nombre], [apellido], [telefono], [salario], [estatus]) VALUES (2, 2, 1, 10, 2018, N'2', N'randolph', N'Marte', N'8298904141', 22000.0000, 0)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[Mes] ON 

INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (1, N'Enero')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (2, N'Febrero')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (3, N'Marzo')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (4, N'Abril')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (5, N'Mayo')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (6, N'Junio')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (7, N'Julio')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (8, N'Agosto')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (9, N'Septiembre')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (10, N'Octubre')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (11, N'Noviembre')
INSERT [dbo].[Mes] ([mesId], [mes]) VALUES (12, N'Diciembre')
SET IDENTITY_INSERT [dbo].[Mes] OFF
SET IDENTITY_INSERT [dbo].[Nominas] ON 

INSERT [dbo].[Nominas] ([nominaId], [año], [mes], [monto_total]) VALUES (4, 2019, 1, 42000)
INSERT [dbo].[Nominas] ([nominaId], [año], [mes], [monto_total]) VALUES (5, 2018, 6, 20000)
SET IDENTITY_INSERT [dbo].[Nominas] OFF
SET IDENTITY_INSERT [dbo].[Salidas] ON 

INSERT [dbo].[Salidas] ([salidaId], [emp_id], [tipo_salida], [motivo], [fecha_salida]) VALUES (1, 2, 1, N'Consiguio un nuevo trabajo', CAST(N'2019-12-04' AS Date))
SET IDENTITY_INSERT [dbo].[Salidas] OFF
SET IDENTITY_INSERT [dbo].[Tipo_salida] ON 

INSERT [dbo].[Tipo_salida] ([tipo_salida_id], [descripcion]) VALUES (1, N'Renuncia')
INSERT [dbo].[Tipo_salida] ([tipo_salida_id], [descripcion]) VALUES (2, N'Despido')
INSERT [dbo].[Tipo_salida] ([tipo_salida_id], [descripcion]) VALUES (3, N'Desahucio')
SET IDENTITY_INSERT [dbo].[Tipo_salida] OFF
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([cargoId])
REFERENCES [dbo].[Cargo] ([cargoId])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([departamentoId])
REFERENCES [dbo].[Departamentos] ([departamentoId])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([mes_ingreso])
REFERENCES [dbo].[Mes] ([mesId])
GO
ALTER TABLE [dbo].[Licencias]  WITH CHECK ADD FOREIGN KEY([emp_Id])
REFERENCES [dbo].[Empleados] ([empleadoId])
GO
ALTER TABLE [dbo].[Nominas]  WITH CHECK ADD FOREIGN KEY([mes])
REFERENCES [dbo].[Mes] ([mesId])
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[Empleados] ([empleadoId])
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[Empleados] ([empleadoId])
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD FOREIGN KEY([tipo_salida])
REFERENCES [dbo].[Tipo_salida] ([tipo_salida_id])
GO
ALTER TABLE [dbo].[Vacaciones]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[Empleados] ([empleadoId])
GO
/****** Object:  StoredProcedure [dbo].[Usp_select_depar]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_select_depar] 
@depar varchar(20)
as
begin
declare @depa int = (select departamentoId from Departamentos where nombre = @depar)
end
select @depa as html
GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_empleados]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Select_empleados] as
begin
select * from Empleados
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_Select_MontoTotal]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_Select_MontoTotal]
as
begin
Declare @MontoTotal bigint = (Select sum(salario) from Empleados where estatus = 1)
end
Select @MontoTotal as Html
GO
/****** Object:  StoredProcedure [dbo].[Usp_Update_Empleado]    Script Date: 4/12/2019 1:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Usp_Update_Empleado]
@emp_id int
as
begin
Update Empleados set estatus=0 where emp_codigo = @emp_id
end
Select 1 as Html
GO
USE [master]
GO
ALTER DATABASE [ProyectoFinal] SET  READ_WRITE 
GO
