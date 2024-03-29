USE [master]
GO
/****** Object:  Database [db_Simplicity]    Script Date: 11/27/2019 7:51:41 PM ******/
CREATE DATABASE [db_Simplicity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_Simplicity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\db_Simplicity.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_Simplicity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\db_Simplicity_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_Simplicity] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_Simplicity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_Simplicity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_Simplicity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_Simplicity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_Simplicity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_Simplicity] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_Simplicity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_Simplicity] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db_Simplicity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_Simplicity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_Simplicity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_Simplicity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_Simplicity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_Simplicity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_Simplicity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_Simplicity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_Simplicity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_Simplicity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_Simplicity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_Simplicity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_Simplicity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_Simplicity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_Simplicity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_Simplicity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_Simplicity] SET RECOVERY FULL 
GO
ALTER DATABASE [db_Simplicity] SET  MULTI_USER 
GO
ALTER DATABASE [db_Simplicity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_Simplicity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_Simplicity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_Simplicity] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_Simplicity', N'ON'
GO
USE [db_Simplicity]
GO
/****** Object:  StoredProcedure [dbo].[SP_VisitorList_Select]    Script Date: 11/27/2019 7:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_VisitorList_Select]
as
Begin
Select top 10
ipAddress, dateTime
from
tb_visitorInfo
order by
dateTime desc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_VistorInfo_INSERT]    Script Date: 11/27/2019 7:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_VistorInfo_INSERT]
@ipAddress nvarchar(50),
@dateTime smalldatetime
as
Begin
Insert into tb_visitorInfo
values(@ipAddress,@dateTime)
End
GO
/****** Object:  Table [dbo].[tb_visitorInfo]    Script Date: 11/27/2019 7:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_visitorInfo](
	[visitorID] [int] IDENTITY(1,1) NOT NULL,
	[ipAddress] [nvarchar](50) NOT NULL,
	[dateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_visitorInfo] PRIMARY KEY CLUSTERED 
(
	[visitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [db_Simplicity] SET  READ_WRITE 
GO
