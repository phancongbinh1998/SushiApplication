USE [master]
GO
/****** Object:  Database [sushi]    Script Date: 12/7/2018 1:20:48 PM ******/
CREATE DATABASE [sushi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sushi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.BINHPCSE62805\MSSQL\DATA\sushi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sushi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.BINHPCSE62805\MSSQL\DATA\sushi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [sushi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sushi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sushi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sushi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sushi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sushi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sushi] SET ARITHABORT OFF 
GO
ALTER DATABASE [sushi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sushi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sushi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sushi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sushi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sushi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sushi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sushi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sushi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sushi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sushi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sushi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sushi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sushi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sushi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sushi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sushi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sushi] SET RECOVERY FULL 
GO
ALTER DATABASE [sushi] SET  MULTI_USER 
GO
ALTER DATABASE [sushi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sushi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sushi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sushi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sushi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sushi', N'ON'
GO
ALTER DATABASE [sushi] SET QUERY_STORE = OFF
GO
USE [sushi]
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
USE [sushi]
GO
/****** Object:  Table [dbo].[tblCount]    Script Date: 12/7/2018 1:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCount](
	[count] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetail]    Script Date: 12/7/2018 1:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetail](
	[ID] [nvarchar](10) NOT NULL,
	[address] [nvarchar](10) NOT NULL,
	[tel] [nvarchar](10) NOT NULL,
	[email] [nvarchar](10) NOT NULL,
	[openingHours] [nvarchar](10) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_tblDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImg]    Script Date: 12/7/2018 1:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImg](
	[ID] [nvarchar](10) NOT NULL,
	[imgDesc] [nvarchar](100) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_tblImg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenuu]    Script Date: 12/7/2018 1:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenuu](
	[ID] [nvarchar](10) NOT NULL,
	[menuName] [nvarchar](100) NOT NULL,
	[menuDesc] [nvarchar](100) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_tblMenuu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 12/7/2018 1:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ID] [nvarchar](10) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[imgDes] [nvarchar](100) NOT NULL,
	[detail] [nvarchar](100) NOT NULL,
	[date] [date] NOT NULL,
	[price] [real] NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRef]    Script Date: 12/7/2018 1:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRef](
	[IDMenu] [nvarchar](10) NOT NULL,
	[IDSushi] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblCount] ([count]) VALUES (45)
INSERT [dbo].[tblImg] ([ID], [imgDesc], [date]) VALUES (N'1', N'./Home - us-123sushi.simplesite.com_files/45879625_516211862194198_8178880890055688192_n.jpg', CAST(N'2018-04-25' AS Date))
INSERT [dbo].[tblImg] ([ID], [imgDesc], [date]) VALUES (N'2', N'./Home - us-123sushi.simplesite.com_files/45702481_2068553476808515_7218263333491703808_n.jpg', CAST(N'2018-03-02' AS Date))
INSERT [dbo].[tblImg] ([ID], [imgDesc], [date]) VALUES (N'3', N'./Home - us-123sushi.simplesite.com_files/45266156_581569582260564_7153965181989552128_n.jpg', CAST(N'2018-04-16' AS Date))
INSERT [dbo].[tblMenuu] ([ID], [menuName], [menuDesc], [date]) VALUES (N'1', N'SushiPr0vjp', N'menu provjp', CAST(N'2017-02-03' AS Date))
INSERT [dbo].[tblMenuu] ([ID], [menuName], [menuDesc], [date]) VALUES (N'2', N'Sushiiiiiii', N'menu vjppro', CAST(N'2018-05-04' AS Date))
INSERT [dbo].[tblMenuu] ([ID], [menuName], [menuDesc], [date]) VALUES (N'3', N'SushiDinner', N'menu sushi', CAST(N'2017-04-12' AS Date))
INSERT [dbo].[tblProduct] ([ID], [title], [imgDes], [detail], [date], [price]) VALUES (N'1', N'sushi fish', N'./Home - us-123sushi.simplesite.com_files/45702481_2068553476808515_7218263333491703808_n.jpg', N'ngon bo re', CAST(N'2017-02-05' AS Date), 125)
INSERT [dbo].[tblProduct] ([ID], [title], [imgDes], [detail], [date], [price]) VALUES (N'2', N'sushi beff', N'./Home - us-123sushi.simplesite.com_files/45266156_581569582260564_7153965181989552128_n.jpg', N'ngon vai lin', CAST(N'2017-02-01' AS Date), 145)
INSERT [dbo].[tblProduct] ([ID], [title], [imgDes], [detail], [date], [price]) VALUES (N'3', N'sushi rabbit', N'./Home - us-123sushi.simplesite.com_files/45668814_2108389469476046_396781684533493760_n.jpg', N'do ghe', CAST(N'2017-04-23' AS Date), 102)
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'1', N'1')
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'1', N'2')
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'1', N'3')
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'2', N'3')
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'2', N'2')
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'3', N'1')
INSERT [dbo].[tblRef] ([IDMenu], [IDSushi]) VALUES (N'3', N'3')
ALTER TABLE [dbo].[tblRef]  WITH CHECK ADD  CONSTRAINT [FK_tblRef_tblMenuu] FOREIGN KEY([IDMenu])
REFERENCES [dbo].[tblMenuu] ([ID])
GO
ALTER TABLE [dbo].[tblRef] CHECK CONSTRAINT [FK_tblRef_tblMenuu]
GO
ALTER TABLE [dbo].[tblRef]  WITH CHECK ADD  CONSTRAINT [FK_tblRef_tblProduct] FOREIGN KEY([IDSushi])
REFERENCES [dbo].[tblProduct] ([ID])
GO
ALTER TABLE [dbo].[tblRef] CHECK CONSTRAINT [FK_tblRef_tblProduct]
GO
USE [master]
GO
ALTER DATABASE [sushi] SET  READ_WRITE 
GO
