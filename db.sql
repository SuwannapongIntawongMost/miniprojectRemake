USE [master]
GO
/****** Object:  Database [mydbp]    Script Date: 4/30/2019 3:54:17 PM ******/
CREATE DATABASE [mydbp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mydbp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\mydbp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mydbp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\mydbp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mydbp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mydbp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mydbp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mydbp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mydbp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mydbp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mydbp] SET ARITHABORT OFF 
GO
ALTER DATABASE [mydbp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mydbp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mydbp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mydbp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mydbp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mydbp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mydbp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mydbp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mydbp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mydbp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mydbp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mydbp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mydbp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mydbp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mydbp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mydbp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mydbp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mydbp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mydbp] SET  MULTI_USER 
GO
ALTER DATABASE [mydbp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mydbp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mydbp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mydbp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mydbp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mydbp] SET QUERY_STORE = OFF
GO
USE [mydbp]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/30/2019 3:54:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[img_money_slip] [varchar](255) NOT NULL,
	[bill_date_time] [datetime] NOT NULL,
	[booking_id] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_food]    Script Date: 4/30/2019 3:54:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_food](
	[F_id] [int] NULL,
	[bill_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/30/2019 3:54:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[C_name] [varchar](50) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[seat] [varchar](50) NOT NULL,
	[floor] [varchar](50) NOT NULL,
	[C_number] [int] NOT NULL,
	[book_date_time] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
	[booking_id_type] [int] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 4/30/2019 3:54:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[F_id] [int] IDENTITY(1,1) NOT NULL,
	[F_name] [varchar](max) NOT NULL,
	[F_img] [varchar](255) NULL,
	[F_price] [int] NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[F_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[S_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_food]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_food](
	[booking_id] [int] NULL,
	[F_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_type]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_type](
	[booking_type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_book_type] PRIMARY KEY CLUSTERED 
(
	[booking_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bill_id], [img_money_slip], [bill_date_time], [booking_id]) VALUES (3, N'loli', CAST(N'2004-05-23T14:25:10.000' AS DateTime), 1)
INSERT [dbo].[Bill] ([bill_id], [img_money_slip], [bill_date_time], [booking_id]) VALUES (5, N'lol', CAST(N'2004-05-23T14:25:10.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Bill] OFF
INSERT [dbo].[Bill_food] ([F_id], [bill_id]) VALUES (NULL, 3)
INSERT [dbo].[Bill_food] ([F_id], [bill_id]) VALUES (NULL, 5)
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([booking_id], [C_name], [phone_number], [seat], [floor], [C_number], [book_date_time], [status_id], [booking_id_type]) VALUES (1, N'most', N'0933278406', N'5', N'1', 30, CAST(N'2004-05-23T14:25:10.000' AS DateTime), 1, 2)
INSERT [dbo].[Booking] ([booking_id], [C_name], [phone_number], [seat], [floor], [C_number], [book_date_time], [status_id], [booking_id_type]) VALUES (4, N'toey', N'0888888888', N'3', N'2', 3, CAST(N'2004-05-23T14:25:10.000' AS DateTime), 1, 1)
INSERT [dbo].[Booking] ([booking_id], [C_name], [phone_number], [seat], [floor], [C_number], [book_date_time], [status_id], [booking_id_type]) VALUES (5, N'abc', N'0901315596', N'11', N'2', 5, CAST(N'2019-04-30T20:20:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Booking] ([booking_id], [C_name], [phone_number], [seat], [floor], [C_number], [book_date_time], [status_id], [booking_id_type]) VALUES (7, N'lolipop', N'0884013282', N'2', N'3', 3, CAST(N'2019-05-02T17:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([F_id], [F_name], [F_img], [F_price]) VALUES (8, N'ขาหมูเยอรมัน', N'img/c8e6d5a3-ef9d-447c-a26c-61cd660ac7d2.jpg', 256)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([status_id], [S_name]) VALUES (1, N'จอง')
INSERT [dbo].[Status] ([status_id], [S_name]) VALUES (2, N'ยกเลิก')
SET IDENTITY_INSERT [dbo].[Status] OFF
INSERT [dbo].[book_food] ([booking_id], [F_id]) VALUES (1, NULL)
INSERT [dbo].[book_food] ([booking_id], [F_id]) VALUES (4, NULL)
INSERT [dbo].[book_food] ([booking_id], [F_id]) VALUES (1, NULL)
SET IDENTITY_INSERT [dbo].[book_type] ON 

INSERT [dbo].[book_type] ([booking_type_id], [type_name]) VALUES (1, N'จองแบบธรรมดา')
INSERT [dbo].[book_type] ([booking_type_id], [type_name]) VALUES (2, N'จองแบบสั่งอาหาร')
SET IDENTITY_INSERT [dbo].[book_type] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Booking]
GO
ALTER TABLE [dbo].[Bill_food]  WITH CHECK ADD  CONSTRAINT [FK_Bill_food_Bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[Bill_food] CHECK CONSTRAINT [FK_Bill_food_Bill]
GO
ALTER TABLE [dbo].[Bill_food]  WITH CHECK ADD  CONSTRAINT [FK_Bill_food_Food] FOREIGN KEY([F_id])
REFERENCES [dbo].[Food] ([F_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Bill_food] CHECK CONSTRAINT [FK_Bill_food_Food]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Status]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_book_type] FOREIGN KEY([booking_id_type])
REFERENCES [dbo].[book_type] ([booking_type_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_book_type]
GO
ALTER TABLE [dbo].[book_food]  WITH CHECK ADD  CONSTRAINT [FK_book_food_Booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[book_food] CHECK CONSTRAINT [FK_book_food_Booking]
GO
ALTER TABLE [dbo].[book_food]  WITH CHECK ADD  CONSTRAINT [FK_book_food_Food] FOREIGN KEY([F_id])
REFERENCES [dbo].[Food] ([F_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[book_food] CHECK CONSTRAINT [FK_book_food_Food]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFood]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteFood]
	@F_id int
AS
BEGIN
	
	SET NOCOUNT ON;
	DELETE TOP (200)
FROM            Food
WHERE        (F_id = @F_id)
 
END
GO
/****** Object:  StoredProcedure [dbo].[GetFoodByID]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFoodByID]

     @F_id int
AS
BEGIN

	SET NOCOUNT ON;
	SELECT        TOP (200) F_id, F_name, F_img, F_price
FROM            Food
WHERE        (F_id = @F_id)
  
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBookFromDB]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertBookFromDB]
	@C_name varchar(MAX),
	@phone_number varchar(50),
	@seat int,
	@floor int,
	@C_number int,
	@book_date_time datetime,
	@status_id int,
	@booking_id_type int
AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT        TOP (200)
INTO              Booking(C_name, phone_number, seat, floor, C_number, book_date_time, status_id, booking_id_type)
VALUES        (@C_name,@phone_number,@seat,@floor,@C_number,@book_date_time,@status_id,@booking_id_type)

    
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFoodFromDB]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertFoodFromDB]
		@F_img varchar(255),
		@F_name varchar(Max),
		@F_price int

AS
BEGIN

	SET NOCOUNT ON;
	INSERT        TOP (200)
INTO              Food(F_name, F_img, F_price)
VALUES        (@F_name,@F_img,@F_price)



END
GO
/****** Object:  StoredProcedure [dbo].[UpdateFood]    Script Date: 4/30/2019 3:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFood]
	@F_name varchar(Max),
	@F_img varchar(255),
	@F_price int,
	@F_id int
AS
BEGIN
	
	SET NOCOUNT ON;
	UPDATE       Food
SET                F_name = @F_name, F_img = @F_img, F_price = @F_price
WHERE        (F_id = @F_id)
   
END
GO
USE [master]
GO
ALTER DATABASE [mydbp] SET  READ_WRITE 
GO
