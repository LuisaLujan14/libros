USE [master]
GO
/****** Object:  Database [libreria]    Script Date: 1/04/2024 4:24:58 p.m. ******/
CREATE DATABASE [libreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libreria', FILENAME = N'D:\SQLData\libreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libreria_log', FILENAME = N'D:\SQLData\libreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [libreria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [libreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [libreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libreria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [libreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libreria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [libreria] SET  MULTI_USER 
GO
ALTER DATABASE [libreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [libreria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [libreria] SET QUERY_STORE = ON
GO
ALTER DATABASE [libreria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [libreria]
GO
/****** Object:  Table [dbo].[tbl_autor]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_autor](
	[id_autor] [int] NOT NULL,
	[autor_nombre] [varchar](50) NOT NULL,
	[autor_fecha_nacimiento] [date] NOT NULL,
	[fk_id_pais] [int] NOT NULL,
 CONSTRAINT [PK_tbl_autor] PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_editorial]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_editorial](
	[id_editorial] [int] NOT NULL,
	[nombre_editorial] [varchar](50) NOT NULL,
	[fk_id_pais] [int] NOT NULL,
	[fk_id_geolocalizacion] [int] NOT NULL,
 CONSTRAINT [PK_tbl_editorial] PRIMARY KEY CLUSTERED 
(
	[id_editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_genero]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_genero](
	[id_genero] [int] NOT NULL,
	[genero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_genero] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_geolocalizacion]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_geolocalizacion](
	[id_geolocalizacion] [int] NOT NULL,
	[latitud] [varchar](50) NOT NULL,
	[longitud] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_geolocalizacion] PRIMARY KEY CLUSTERED 
(
	[id_geolocalizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_libro]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_libro](
	[id_libro] [int] NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[isbn] [varchar](25) NOT NULL,
	[fk_id_genero] [int] NOT NULL,
	[fk_id_stock] [int] NOT NULL,
	[fk_id_precio] [int] NOT NULL,
	[fk_id_autor] [int] NOT NULL,
	[fk_id_editorial] [int] NOT NULL,
 CONSTRAINT [PK_tbl_libro] PRIMARY KEY CLUSTERED 
(
	[id_libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pais]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pais](
	[id_pais] [int] NOT NULL,
	[pais] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_pais] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_precio]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_precio](
	[id_precio] [int] NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_tbl_precio] PRIMARY KEY CLUSTERED 
(
	[id_precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_stock]    Script Date: 1/04/2024 4:24:58 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_stock](
	[id_stock] [int] NOT NULL,
	[stock] [int] NOT NULL,
 CONSTRAINT [PK_tbl_stock] PRIMARY KEY CLUSTERED 
(
	[id_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (1, N'J.R.R. Tolkien', CAST(N'1892-01-03' AS Date), 4)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (2, N'Gabriel García Márquez', CAST(N'1927-03-06' AS Date), 1)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (3, N'George Orwell', CAST(N'1903-06-25' AS Date), 5)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (4, N'Herman Melville', CAST(N'1819-08-01' AS Date), 3)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (5, N'Jane Austen', CAST(N'1775-12-16' AS Date), 5)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (6, N'F. Scott Fitzgerald', CAST(N'1896-09-24' AS Date), 3)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (7, N'Miguel de Cervantes', CAST(N'1547-09-29' AS Date), 2)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (8, N'Harper Lee', CAST(N'1926-04-28' AS Date), 3)
INSERT [dbo].[tbl_autor] ([id_autor], [autor_nombre], [autor_fecha_nacimiento], [fk_id_pais]) VALUES (9, N'Fyodor Dostoevsky', CAST(N'1821-11-11' AS Date), 6)
GO
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (1, N'Minotauro', 2, 1)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (2, N'Diana', 1, 2)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (3, N'Secker & Warburg', 5, 3)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (4, N'Harper & Brothers', 3, 4)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (5, N'Thomas Egerton', 5, 5)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (6, N'Charles Scribner''s Sons', 3, 6)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (7, N'Francisco de Robles', 2, 7)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (8, N'J. B. Lippincott & Co.', 3, 8)
INSERT [dbo].[tbl_editorial] ([id_editorial], [nombre_editorial], [fk_id_pais], [fk_id_geolocalizacion]) VALUES (9, N'The Russian Messenger', 6, 9)
GO
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (1, N'Fantasía')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (2, N'Realismo mágico')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (3, N'Ciencia ficción')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (4, N'Ficción de aventuras')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (5, N'Novela romántica')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (6, N'Novela contemporánea')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (7, N'Novela picaresca')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (8, N'Novela dramática')
INSERT [dbo].[tbl_genero] ([id_genero], [genero]) VALUES (9, N'Novela psicológica')
GO
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (1, N'40.4168', N'-3.7038')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (2, N'4.5709', N'-74.2973')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (3, N'51.5074', N'-0.1278')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (4, N'37.0902', N'-95.7129')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (5, N'51.5074', N'-0.1278')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (6, N'37.0902', N'-95.7129')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (7, N'40.4168', N'-3.7038')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (8, N'37.0902', N'-95.7129')
INSERT [dbo].[tbl_geolocalizacion] ([id_geolocalizacion], [latitud], [longitud]) VALUES (9, N'61.5240', N'105.3188')
GO
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (1, N'El señor de los anillos', N'9788445072515', 1, 1, 1, 1, 1)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (2, N'Cien años de soledad', N'9788423349802', 2, 2, 2, 2, 2)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (3, N'1984', N'9780451524935', 3, 3, 3, 3, 3)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (4, N'Moby Dick', N'9780142000083', 4, 4, 4, 4, 4)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (5, N'Orgullo y prejuicio', N'9780141439518', 5, 5, 5, 5, 5)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (6, N'El gran Gatsby', N'9780743273565', 6, 6, 6, 6, 6)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (7, N'Don Quijote de la Mancha', N'9788424119656', 7, 7, 7, 7, 7)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (8, N'Matar un ruiseñor', N'9780061120084', 8, 8, 8, 8, 8)
INSERT [dbo].[tbl_libro] ([id_libro], [titulo], [isbn], [fk_id_genero], [fk_id_stock], [fk_id_precio], [fk_id_autor], [fk_id_editorial]) VALUES (9, N'Crimen y castigo', N'9780486415871', 9, 9, 9, 9, 9)
GO
INSERT [dbo].[tbl_pais] ([id_pais], [pais]) VALUES (1, N'Colombia')
INSERT [dbo].[tbl_pais] ([id_pais], [pais]) VALUES (2, N'España')
INSERT [dbo].[tbl_pais] ([id_pais], [pais]) VALUES (3, N'Estados Unidos')
INSERT [dbo].[tbl_pais] ([id_pais], [pais]) VALUES (4, N'Inglaterra')
INSERT [dbo].[tbl_pais] ([id_pais], [pais]) VALUES (5, N'Reino Unido')
INSERT [dbo].[tbl_pais] ([id_pais], [pais]) VALUES (6, N'Rusia')
GO
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (1, 20.5)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (2, 18.75)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (3, 15.99)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (4, 22.99)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (5, 17.5)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (6, 19.95)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (7, 16)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (8, 21.99)
INSERT [dbo].[tbl_precio] ([id_precio], [precio]) VALUES (9, 18.5)
GO
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (1, 100)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (2, 75)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (3, 50)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (4, 80)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (5, 90)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (6, 60)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (7, 70)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (8, 85)
INSERT [dbo].[tbl_stock] ([id_stock], [stock]) VALUES (9, 95)
GO
ALTER TABLE [dbo].[tbl_autor]  WITH CHECK ADD  CONSTRAINT [FK_tbl_autor_tbl_pais] FOREIGN KEY([fk_id_pais])
REFERENCES [dbo].[tbl_pais] ([id_pais])
GO
ALTER TABLE [dbo].[tbl_autor] CHECK CONSTRAINT [FK_tbl_autor_tbl_pais]
GO
ALTER TABLE [dbo].[tbl_editorial]  WITH CHECK ADD  CONSTRAINT [FK_tbl_editorial_tbl_geolocalizacion] FOREIGN KEY([fk_id_geolocalizacion])
REFERENCES [dbo].[tbl_geolocalizacion] ([id_geolocalizacion])
GO
ALTER TABLE [dbo].[tbl_editorial] CHECK CONSTRAINT [FK_tbl_editorial_tbl_geolocalizacion]
GO
ALTER TABLE [dbo].[tbl_editorial]  WITH CHECK ADD  CONSTRAINT [FK_tbl_editorial_tbl_pais] FOREIGN KEY([fk_id_pais])
REFERENCES [dbo].[tbl_pais] ([id_pais])
GO
ALTER TABLE [dbo].[tbl_editorial] CHECK CONSTRAINT [FK_tbl_editorial_tbl_pais]
GO
ALTER TABLE [dbo].[tbl_libro]  WITH CHECK ADD  CONSTRAINT [FK_tbl_libro_tbl_autor] FOREIGN KEY([fk_id_autor])
REFERENCES [dbo].[tbl_autor] ([id_autor])
GO
ALTER TABLE [dbo].[tbl_libro] CHECK CONSTRAINT [FK_tbl_libro_tbl_autor]
GO
ALTER TABLE [dbo].[tbl_libro]  WITH CHECK ADD  CONSTRAINT [FK_tbl_libro_tbl_editorial] FOREIGN KEY([fk_id_editorial])
REFERENCES [dbo].[tbl_editorial] ([id_editorial])
GO
ALTER TABLE [dbo].[tbl_libro] CHECK CONSTRAINT [FK_tbl_libro_tbl_editorial]
GO
ALTER TABLE [dbo].[tbl_libro]  WITH CHECK ADD  CONSTRAINT [FK_tbl_libro_tbl_genero] FOREIGN KEY([fk_id_genero])
REFERENCES [dbo].[tbl_genero] ([id_genero])
GO
ALTER TABLE [dbo].[tbl_libro] CHECK CONSTRAINT [FK_tbl_libro_tbl_genero]
GO
ALTER TABLE [dbo].[tbl_libro]  WITH CHECK ADD  CONSTRAINT [FK_tbl_libro_tbl_precio] FOREIGN KEY([fk_id_precio])
REFERENCES [dbo].[tbl_precio] ([id_precio])
GO
ALTER TABLE [dbo].[tbl_libro] CHECK CONSTRAINT [FK_tbl_libro_tbl_precio]
GO
ALTER TABLE [dbo].[tbl_libro]  WITH CHECK ADD  CONSTRAINT [FK_tbl_libro_tbl_stock] FOREIGN KEY([fk_id_stock])
REFERENCES [dbo].[tbl_stock] ([id_stock])
GO
ALTER TABLE [dbo].[tbl_libro] CHECK CONSTRAINT [FK_tbl_libro_tbl_stock]
GO
USE [master]
GO
ALTER DATABASE [libreria] SET  READ_WRITE 
GO
