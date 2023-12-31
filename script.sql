USE [master]
GO
/****** Object:  Database [AraçKiralama]    Script Date: 22.08.2023 19:04:45 ******/
CREATE DATABASE [AraçKiralama]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AraçKiralama', FILENAME = N'D:\Yeni klasör (4)\MSSQL16.MSSQLSERVER\MSSQL\DATA\AraçKiralama.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'Araçlar', FILENAME = N'D:\Yeni klasör (4)\MSSQL16.MSSQLSERVER\MSSQL\DATA\Araçlar.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'Faturalar', FILENAME = N'D:\Yeni klasör (4)\MSSQL16.MSSQLSERVER\MSSQL\DATA\Faturalar.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'Müşteriler', FILENAME = N'D:\Yeni klasör (4)\MSSQL16.MSSQLSERVER\MSSQL\DATA\Müşteriler.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'Rezervasyonlar', FILENAME = N'D:\Yeni klasör (4)\MSSQL16.MSSQLSERVER\MSSQL\DATA\Rezervasyonlar.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AraçKiralama_log', FILENAME = N'D:\Yeni klasör (4)\MSSQL16.MSSQLSERVER\MSSQL\DATA\AraçKiralama_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AraçKiralama] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AraçKiralama].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AraçKiralama] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AraçKiralama] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AraçKiralama] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AraçKiralama] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AraçKiralama] SET ARITHABORT OFF 
GO
ALTER DATABASE [AraçKiralama] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AraçKiralama] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AraçKiralama] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AraçKiralama] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AraçKiralama] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AraçKiralama] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AraçKiralama] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AraçKiralama] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AraçKiralama] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AraçKiralama] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AraçKiralama] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AraçKiralama] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AraçKiralama] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AraçKiralama] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AraçKiralama] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AraçKiralama] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AraçKiralama] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AraçKiralama] SET RECOVERY FULL 
GO
ALTER DATABASE [AraçKiralama] SET  MULTI_USER 
GO
ALTER DATABASE [AraçKiralama] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AraçKiralama] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AraçKiralama] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AraçKiralama] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AraçKiralama] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AraçKiralama] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AraçKiralama', N'ON'
GO
ALTER DATABASE [AraçKiralama] SET QUERY_STORE = ON
GO
ALTER DATABASE [AraçKiralama] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AraçKiralama]
GO
/****** Object:  DatabaseRole [Editor]    Script Date: 22.08.2023 19:04:45 ******/
CREATE ROLE [Editor]
GO
/****** Object:  DatabaseRole [Admin]    Script Date: 22.08.2023 19:04:45 ******/
CREATE ROLE [Admin]
GO
/****** Object:  Table [dbo].[Araclar]    Script Date: 22.08.2023 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Araclar](
	[AracID] [int] NOT NULL,
	[Marka] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[PlakaNumarasi] [varchar](10) NULL,
	[YakitTipi] [varchar](50) NULL,
	[VitesTipi] [varchar](50) NULL,
	[UretimYili] [datetime] NULL,
	[KiralamaUcreti] [varchar](50) NULL,
	[Durum] [varchar](50) NULL,
	[AracFoto] [image] NULL,
 CONSTRAINT [PK_Araçlar] PRIMARY KEY CLUSTERED 
(
	[AracID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faturalar]    Script Date: 22.08.2023 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faturalar](
	[FaturalarID] [int] NOT NULL,
	[RezervasyonID] [int] NULL,
	[FaturaTarihi] [datetime] NULL,
	[ToplamTutar] [varchar](50) NULL,
	[OdemeDurumu] [varchar](50) NULL,
 CONSTRAINT [PK_Faturalar] PRIMARY KEY CLUSTERED 
(
	[FaturalarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 22.08.2023 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] NOT NULL,
	[Adi] [varchar](50) NULL,
	[Soyadi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[Adres] [varchar](max) NULL,
	[TelefonNumarasi] [varchar](50) NULL,
	[KimlikBilgileri] [varchar](11) NULL,
 CONSTRAINT [PK_Müşteri] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciYetki]    Script Date: 22.08.2023 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciYetki](
	[KullaniciID] [int] NOT NULL,
	[YetkiID] [int] NULL,
 CONSTRAINT [PK_KullanıcıYetki] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervasyonlar]    Script Date: 22.08.2023 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervasyonlar](
	[RezervasyonID] [int] NOT NULL,
	[KullaniciID] [int] NULL,
	[AracID] [int] NULL,
	[BaslangicTarihi] [date] NULL,
	[BitisTarihi] [date] NULL,
	[TeslimAlimSaati] [time](7) NULL,
	[TeslimEdilmeSaati] [time](7) NULL,
	[KiralamaUcreti] [varchar](50) NULL,
	[EkHizmetler] [varchar](max) NULL,
 CONSTRAINT [PK_Rezervasyonlar] PRIMARY KEY CLUSTERED 
(
	[RezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YetkiTür]    Script Date: 22.08.2023 19:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YetkiTür](
	[YetkiID] [int] NOT NULL,
	[YetkiAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_YetkiTür] PRIMARY KEY CLUSTERED 
(
	[YetkiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Faturalar]  WITH CHECK ADD  CONSTRAINT [FK_Faturalar_Rezervasyonlar] FOREIGN KEY([RezervasyonID])
REFERENCES [dbo].[Rezervasyonlar] ([RezervasyonID])
GO
ALTER TABLE [dbo].[Faturalar] CHECK CONSTRAINT [FK_Faturalar_Rezervasyonlar]
GO
ALTER TABLE [dbo].[KullaniciYetki]  WITH CHECK ADD  CONSTRAINT [FK_KullanıcıYetki_Kullanıcı] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[KullaniciYetki] CHECK CONSTRAINT [FK_KullanıcıYetki_Kullanıcı]
GO
ALTER TABLE [dbo].[KullaniciYetki]  WITH CHECK ADD  CONSTRAINT [FK_KullanıcıYetki_YetkiTür] FOREIGN KEY([YetkiID])
REFERENCES [dbo].[YetkiTür] ([YetkiID])
GO
ALTER TABLE [dbo].[KullaniciYetki] CHECK CONSTRAINT [FK_KullanıcıYetki_YetkiTür]
GO
ALTER TABLE [dbo].[Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyonlar_Araçlar] FOREIGN KEY([AracID])
REFERENCES [dbo].[Araclar] ([AracID])
GO
ALTER TABLE [dbo].[Rezervasyonlar] CHECK CONSTRAINT [FK_Rezervasyonlar_Araçlar]
GO
ALTER TABLE [dbo].[Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyonlar_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[Rezervasyonlar] CHECK CONSTRAINT [FK_Rezervasyonlar_Kullanici]
GO
USE [master]
GO
ALTER DATABASE [AraçKiralama] SET  READ_WRITE 
GO
