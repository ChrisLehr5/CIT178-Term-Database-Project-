USE [master]
GO
/****** Object:  Database [myFictionalBusiness]    Script Date: 3/1/2020 6:30:53 PM ******/
CREATE DATABASE [myFictionalBusiness]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myFictionalBusiness', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\myFictionalBusiness.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myFictionalBusiness_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\myFictionalBusiness_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [myFictionalBusiness] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myFictionalBusiness].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myFictionalBusiness] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET ARITHABORT OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myFictionalBusiness] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myFictionalBusiness] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET  ENABLE_BROKER 
GO
ALTER DATABASE [myFictionalBusiness] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myFictionalBusiness] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET RECOVERY FULL 
GO
ALTER DATABASE [myFictionalBusiness] SET  MULTI_USER 
GO
ALTER DATABASE [myFictionalBusiness] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myFictionalBusiness] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myFictionalBusiness] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myFictionalBusiness] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myFictionalBusiness] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'myFictionalBusiness', N'ON'
GO
ALTER DATABASE [myFictionalBusiness] SET QUERY_STORE = OFF
GO
USE [myFictionalBusiness]
GO
/****** Object:  Table [dbo].[AnimalType]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalType](
	[PetCode] [char](10) NOT NULL,
	[PetType] [char](50) NOT NULL,
 CONSTRAINT [PK_animaltype] PRIMARY KEY CLUSTERED 
(
	[PetCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Balance]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[BillingID] [int] NOT NULL,
	[OfficeID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[Balance] [money] NOT NULL,
	[Comments] [varchar](100) NOT NULL,
	[LastDateBilled] [varchar](100) NOT NULL,
	[LastDatePaid] [varchar](100) NOT NULL,
 CONSTRAINT [PK_balance] PRIMARY KEY CLUSTERED 
(
	[BillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[OfficeID] [int] NOT NULL,
	[VetID] [int] NOT NULL,
 CONSTRAINT [PK_office] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerID] [int] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Zip] [nvarchar](20) NULL,
	[PhoneNumber] [nvarchar](30) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[AnimalID] [int] NOT NULL,
	[PetName] [nvarchar](100) NOT NULL,
	[PetCode] [char](10) NOT NULL,
	[OwnerID] [int] NOT NULL,
 CONSTRAINT [PK_pet] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vet]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet](
	[VetID] [int] NOT NULL,
	[VetName] [nvarchar](30) NOT NULL,
	[TechLevel] [int] NOT NULL,
 CONSTRAINT [PK_vet] PRIMARY KEY CLUSTERED 
(
	[VetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zip]    Script Date: 3/1/2020 6:30:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zip](
	[zipcode] [nvarchar](20) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_zipcode] PRIMARY KEY CLUSTERED 
(
	[zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_OfficeID_Balance] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Office] ([OfficeID])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_OfficeID_Balance]
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_OwnerID_Balance] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_OwnerID_Balance]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_VetID_Office] FOREIGN KEY([VetID])
REFERENCES [dbo].[Vet] ([VetID])
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_VetID_Office]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_zip_owner] FOREIGN KEY([Zip])
REFERENCES [dbo].[Zip] ([zipcode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [FK_zip_owner]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_OwnerID_Pet] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_OwnerID_Pet]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_PetCode_Pet] FOREIGN KEY([PetCode])
REFERENCES [dbo].[AnimalType] ([PetCode])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_PetCode_Pet]
GO
USE [master]
GO
ALTER DATABASE [myFictionalBusiness] SET  READ_WRITE 
GO
