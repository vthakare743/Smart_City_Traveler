USE [master]
GO
/****** Object:  Database [TRAVEL_REC]    Script Date: 26-06-2023 12:18:25 ******/
CREATE DATABASE [TRAVEL_REC] ON  PRIMARY 
( NAME = N'TRAVEL_REC', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\TRAVEL_REC.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TRAVEL_REC_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\TRAVEL_REC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TRAVEL_REC] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRAVEL_REC].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TRAVEL_REC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TRAVEL_REC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRAVEL_REC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRAVEL_REC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRAVEL_REC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRAVEL_REC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRAVEL_REC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TRAVEL_REC] SET  MULTI_USER 
GO
ALTER DATABASE [TRAVEL_REC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRAVEL_REC] SET DB_CHAINING OFF 
GO
USE [TRAVEL_REC]
GO
/****** Object:  Table [dbo].[AdminReg]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminReg](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdminReg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[pid] [int] NULL,
	[regdate] [nvarchar](50) NULL,
	[bookdate] [nvarchar](50) NULL,
	[feedback_allow_date] [nvarchar](50) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] NOT NULL,
	[details] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[travel_username] [nvarchar](50) NULL,
	[pid] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OtpData]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtpData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[otp] [int] NULL,
	[username] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_OtpData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Packages]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[id] [int] NOT NULL,
	[pname] [nvarchar](50) NULL,
	[season] [nvarchar](50) NULL,
	[theme] [nvarchar](50) NULL,
	[duration] [int] NULL,
	[location] [nvarchar](50) NULL,
	[details] [nvarchar](50) NULL,
	[subpack] [nvarchar](50) NULL,
	[cost] [int] NULL,
	[photo] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[hotelname] [nvarchar](50) NULL,
	[hoteldetails] [nvarchar](max) NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[occupation] [nvarchar](50) NULL,
	[salary] [nvarchar](max) NULL,
	[address] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[qua] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[photo] [nvarchar](50) NULL,
	[interest_status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SearchResult]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchResult](
	[username] [nvarchar](50) NULL,
	[pid] [int] NULL,
	[rating] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stud_Data]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stud_Data](
	[name] [nvarchar](max) NULL,
	[rollno] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRatings]    Script Date: 26-06-2023 12:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [smallint] NULL,
	[status] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[pid] [int] NULL,
 CONSTRAINT [PK_UserRatings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (1, N'Raj Travels', N'Panchwati', N'9503351933', N'rajtravel@gmail.com', N'raj', N'raj', N'p_1.jpg')
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (2, N'Purple Travels', N'Panchwati Amravati', N'9865321455', N'purple@gmail.com', N'purple', N'123', N'p_2.jpg')
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (3, N'Kesari Patil', N'Rathi Nagar', N'9503351933', N'kesaripatil@gmail.com', N'kesari', N'kesari', N'p_3.jpg')
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (4, N'Aniket', N'Melghat', N'5469781235', N'aniket@gmail.com', N'aniket', N'aniket123', N'p_4.jpg')
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (5, N'ram', N'chikhaldara', N'5894671296', N'ram@gmail.com', N'ram', N'ram06', N'p_5.jpg')
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (6, N'vaibhav', N'Amravati', N'9635812635', N'vaibhav@gmail.com', N'vaibhav', N'vaibhv', N'p_6.jpg')
INSERT [dbo].[AdminReg] ([id], [name], [address], [mobile], [email], [username], [pwd], [photo]) VALUES (7, N'ram patil', N'nagpur', N'9545228634', N'ram@gmail.com', N'ram', N'ram', N'p_7.jpg')
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (5, N'mayuresh', 5, N'06/04/2017', N'08/04/2017', N'20/04/2017')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (6, N'mayuresh', 3, N'06/04/2017', N'06/04/2017', N'12/04/2017')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (8, N'amol', 7, N'11/04/2017', N'11/04/2017', N'15/04/2017')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (9, N'ram', 6, N'11/04/2017', N'11/04/2017', N'17/04/2017')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (10, N'ranjit', 2, N'11/04/2017', N'12/04/2017', N'20/04/2017')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (11, N'pranali', 5, N'10/02/2018', N'12/02/2018', N'24/02/2018')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (12, N'krishna', 2, N'22/03/2018', N'29/03/2018', N'06/04/2018')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (13, N'arun', 8, N'27/03/2018', N'28/03/2018', N'02/04/2018')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (14, N'radha', 6, N'27/03/2018', N'01/04/2018', N'07/04/2018')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (15, N'viraj', 5, N'05/05/2018', N'07/05/2018', N'19/05/2018')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (16, N'bhumi', 9, N'20-04-2023', N'24-04-2023', N'29-04-2023')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (17, N'aish', 10, N'21-04-2023', N'25-04-2023', N'01-05-2023')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (18, N'aachal', 5, N'30-05-2023', N'30-05-2023', N'11-06-2023')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (19, N'aachal', 11, N'30-05-2023', N'30-05-2023', N'31-05-2023')
INSERT [dbo].[Booking] ([id], [username], [pid], [regdate], [bookdate], [feedback_allow_date]) VALUES (20, N'abhay', 8, N'02-06-2023', N'12-06-2023', N'17-06-2023')
SET IDENTITY_INSERT [dbo].[Booking] OFF
INSERT [dbo].[Feedback] ([id], [details], [username], [travel_username], [pid]) VALUES (1, N'it was awesome tour.', N'rani', N'purple', N'5')
INSERT [dbo].[Feedback] ([id], [details], [username], [travel_username], [pid]) VALUES (2, N'it was awesome tour.', N'rani', N'purple', N'5')
INSERT [dbo].[Feedback] ([id], [details], [username], [travel_username], [pid]) VALUES (3, N'Awesome Tour', N'rani', N'raj', N'1')
INSERT [dbo].[Feedback] ([id], [details], [username], [travel_username], [pid]) VALUES (4, N'it is best pakage', N'mayuresh', N'raj', N'6')
SET IDENTITY_INSERT [dbo].[OtpData] ON 

INSERT [dbo].[OtpData] ([id], [otp], [username], [status]) VALUES (1, 4818, N'raj', N'Pending')
INSERT [dbo].[OtpData] ([id], [otp], [username], [status]) VALUES (2, 7050, N'ram', N'Pending')
INSERT [dbo].[OtpData] ([id], [otp], [username], [status]) VALUES (3, 7212, N'ranjit', N'Pending')
SET IDENTITY_INSERT [dbo].[OtpData] OFF
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (1, N'Melghat tour', N'Winter', N'Historical', 7, N'melghat', N'Good Place', N'gugamal national park', 10000, N'pk_2.jpg', N'raj', N'Active', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (2, N'Dharkhora tour', N'Winter', N'Historical', 8, N'dharkhora', N'Good Package', N'banur madhay pradesh', 12000, N'pk_2.jpg', N'raj', N'Active', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (3, N'chikhaldara tour', N'Winter', N'Historical', 6, N'chikhaldara', N'Good One', N'Bhimkund', 17000, N'pk_3.jpg', N'raj', N'Deactive', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (4, N'muktagiri tour', N'Spring', N'Jungle Safari', 10, N'muktagiri', N'Good', N'balaji puram', 12000, N'pk_4.jpg', N'purple', N'Active', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (5, N'melghat tour', N'Spring', N'Adventure', 12, N'tiger reserve', N'Best', N'Semadoh', 15000, N'pk_5.jpg', N'purple', N'Active', N'Nisarg Hotel', N'AC rooms Available')
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (6, N'chikhaldara tour', N'Summer', N'Historical', 6, N'devi point', N'its good place', N'panchbol', 6000, N'pk_6.jpg', N'raj', N'Active', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (7, N'chikhaldara tour', N'Select', N'Select', 4, N'panch bol', N'Good Place', N'gawilgadh fort', 4500, N'pk_7.jpg', N'raj', N'Active', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (8, N'Ramtek tour', N'Summer', N'Adventure', 5, N'Mulund beach', N'good', N'karpur baoli ', 20000, N'pk_8.jpg', N'raj', N'Active', NULL, NULL)
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (9, N'chikhaldara tour', N'Summer', N'Jungle Safari', 5, N'melghat', N'this is best tour in vidhrdha', N'Semadoh', 10000, N'pk_9.jpg', N'aniket', N'Active', N'Nisargh hotel', N'3 star hotel')
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (10, N'chikhaldara tour', N'Summer', N'Jungle Safari', 6, N'melghat', N'this is best tour', N'panchbol', 8000, N'pk_10.gif', N'ram', N'Active', N'Nisargh hotel', N'4 star hotel')
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (11, N'aamzari tour', N'Winter', N'Adventure', 1, N'chikhaldara', N'its a nice place for adventure', N'', 500, N'pk_11.jpg', N'ram', N'Active', N'Nisargh hotel', N'Ac/non ac hotel')
INSERT [dbo].[Packages] ([id], [pname], [season], [theme], [duration], [location], [details], [subpack], [cost], [photo], [username], [status], [hotelname], [hoteldetails]) VALUES (12, N'Ramtek', N'Summer', N'Historical', 10, N'Nagpur', N'best tour ever', N'cemado', 8000, N'pk_12.jpg', N'ram', N'Active', N'5 star hotel', N'5 star hotel best service ')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (1, N'Amit Sawant', N'Male', N'Software Engineer', N'25000', N'Rathi Nagar', N'9865856885', N'MCA', N'amit@gmail.com', N'amit', N'amit', N'p_1.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (2, N'Manoj Tiwari', N'Male', N'Software Engineer', N'25000', N'Kathora Naka Amravati', N'9865745522', N'MCA', N'manoj@gmail.com', N'manoj', N'manu', N'p_2.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (3, N'Rani Patel', N'Female', N'Software Engineer', N'45000', N'Kathora Naka', N'9865324578', N'MCA', N'rani@gmail.com', N'rani', N'rani', N'p_3.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (4, N'Mayuresh Patel', N'Male', N'Software Engineer', N'40000', N'Rathi Nagar', N'9865225545', N'ME', N'mayur@gmail.com', N'mayuresh', N'm123', N'p_4.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (5, N'Amol Rana', N'Male', N'Software Engineer', N'25000', N'Ravi Nagar', N'9503351933', N'MCA', N'amolrana@gmail.com', N'amol', N'123', N'DummyPhoto.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (6, N'Ram Pradhan', N'Male', N'Software Engineer', N'20000', N'Rathi Nagar', N'8983692376', N'Mcom', N'rampradhan@gmail.com', N'ram', N'seeta', N'p_6.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (7, N'Ranjit Tarale', N'Male', N'Software Engineer', N'450000', N'Ravi Nagar', N'8149168160', N'BE', N'ranjit@gmail.com', N'ranjit', N'ranjit', N'p_7.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (8, N'Arun Pratap', N'Male', N'Clerk', N'40000', N'Rathi Nagar', N'7845125544', N'Bcom', N'arun@gmail.com', N'arun', N'arun123', N'p_8.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (9, N'Pranali Jadhav', N'Female', N'Clerk', N'35000', N'Ravi Nagar', N'7845125566', N'BCom', N'pranalijadhav@gmail.com', N'pranali', N'p123', N'p_9.jpg', NULL)
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (10, N'Sachin Deshmukh', N'Male', N'Clerk', N'35000', N'Ravi Nagar', N'9503351933', N'Mcom', N'sachin@gmail.com', N'sachin', N'sachin123', N'p_10.jpg', N'Historical')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (11, N'Radha Rane', N'Female', N'Clerk', N'40000', N'rathi nagar', N'7387303968', N'Mcom', N'radha@gmail.com', N'radha', N'r1234', N'p_11.jpg', N'Historical')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (12, N'Viraj Sahay', N'Male', N'webdevloper', N'35000', N'Ram Nagar', N'9503351933', N'Mcom', N'virajsahay@gmail.com', N'viraj', N'viraj', N'p_12.jpg', N'Adventure')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (13, N'Rushi Patil', N'Male', N'Clerk', N'45000', N'Rathi nagar', N'9503351933', N'Mcom', N'rushi@gmail.com', N'rushi', N'rushi', N'p_13.jpg', N'Adventure')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (14, N'Bhumika', N'Female', N'cleark', N'4000', N'Rathi nagar,Amravti', N'7767947905', N'MCA', N'bhumi@gmail.com', N'Bhumi', N'bhumi05', N'p_14.jpg', N'Adventure')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (15, N'shreya', N'Female', N'web devloper', N'3,00000', N'Amravti', N'8723526644', N'BE', N'shreya@gmail.com', N'shreya', N'shreya31', N'DummyPhoto.jpg', N'Select')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (16, N'srushti', N'Female', N'web devloper', N'3,00000', N'chandur railway', N'2185964732', N'MCA', N'srushti@gmail.com', N'srushti', N's123', N'p_16.gif', N'Jungle Safari')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (17, N'aishwarya', N'Female', N'web devloper', N'3,00000', N'amravati', N'2589746312', N'MCA', N'aishwarya@gmail.com', N'aish', N'aish123', N'p_17.gif', N'Jungle Safari')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (18, N'aisha', N'Female', N'web devloper', N'3,00000', N'nagpur', N'7945862535', N'MCM', N'aishjoshi@gmail.com', N'aisha', N'aisha', N'p_18.jpg', N'Jungle Safari')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (19, N'aachal', N'Female', N'web devloper', N'50000', N'Amravati', N'9635824156', N'MCM', N'aachal@gmail.com', N'aachal', N'aachal', N'p_19.jpg', N'Jungle Safari')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (20, N'Abhay dhanuka', N'Male', N'web devloper', N'3,00000', N'Amravati', N'7854961236', N'MCA', N'abhay@gmail.com', N'abhay', N'123', N'p_20.jpg', N'Jungle Safari')
INSERT [dbo].[Registration] ([id], [name], [gender], [occupation], [salary], [address], [mobile], [qua], [email], [username], [pwd], [photo], [interest_status]) VALUES (21, N'aman', N'Male', N'web devloper', N'28,000', N'Amravati', N'7896784589', N'MCA', N'aman@gmail.com', N'aman', N'@123', N'p_21.jpg', N'Historical')
INSERT [dbo].[SearchResult] ([username], [pid], [rating]) VALUES (N'purple', 4, 13)
INSERT [dbo].[SearchResult] ([username], [pid], [rating]) VALUES (N'purple', 5, 9)
INSERT [dbo].[Stud_Data] ([name], [rollno]) VALUES (N'Ram', 1)
SET IDENTITY_INSERT [dbo].[UserRatings] ON 

INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (38, 3, N'Cost', N'purple', 4)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (39, 4, N'Cost', N'purple', 4)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (40, 2, N'Location', N'purple', 4)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (41, 3, N'Location', N'purple', 4)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (42, 4, N'Location', N'purple', 5)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (43, 5, N'Location', N'purple', 5)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (44, 4, N'Location', N'purple', 4)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (45, 4, N'Location', N'purple', 4)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (46, 4, N'Location', N'raj', 1)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (47, 3, N'Service', N'purple', 5)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (48, 5, N'Cost', N'purple', 5)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (49, 1, N'Service', N'raj', 2)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (50, 5, N'Cost', N'raj', 1)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (51, 3, N'Cost', N'raj', 6)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (52, 5, N'Location', N'raj', 6)
INSERT [dbo].[UserRatings] ([Id], [Rating], [status], [username], [pid]) VALUES (53, 5, N'Service', N'raj', 6)
SET IDENTITY_INSERT [dbo].[UserRatings] OFF
USE [master]
GO
ALTER DATABASE [TRAVEL_REC] SET  READ_WRITE 
GO
