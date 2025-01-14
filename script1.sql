USE [Honya]
GO
/****** Object:  Database [Honya]    Script Date: 11/10/2023 8:36:25 AM ******/

 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Honya', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Honya.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Honya_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Honya_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Honya] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Honya].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Honya] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Honya] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Honya] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Honya] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Honya] SET ARITHABORT OFF 
GO
ALTER DATABASE [Honya] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Honya] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Honya] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Honya] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Honya] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Honya] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Honya] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Honya] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Honya] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Honya] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Honya] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Honya] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Honya] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Honya] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Honya] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Honya] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Honya] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Honya] SET RECOVERY FULL 
GO
ALTER DATABASE [Honya] SET  MULTI_USER 
GO
ALTER DATABASE [Honya] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Honya] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Honya] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Honya] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Honya] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Honya] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Honya', N'ON'
GO
ALTER DATABASE [Honya] SET QUERY_STORE = OFF
GO
USE [Honya]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NULL,
	[maCart] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[maCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailProduct]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailProduct](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[maHD] [int] NULL,
	[accountID] [int] NULL,
	[productID] [int] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_DetailProduct] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[tongGia] [float] NULL,
	[ngayXuat] [datetime] NULL,
	[email] [nvarchar](500) NULL,
	[name] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[deliveryAddress] [nvarchar](500) NULL,
	[shippingID] [int] NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[accountID] [int] NULL,
	[productID] [int] NULL,
	[contentReview] [nvarchar](500) NULL,
	[dateReview] [date] NULL,
	[maReview] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[maReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[sID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](500) NULL,
	[price] [money] NULL,
	[day] [int] NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[sID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoLuongDaBan]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuongDaBan](
	[productID] [int] NULL,
	[soLuongDaBan] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[stID] [int] IDENTITY(1,1) NOT NULL,
	[status] [nchar](500) NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[stID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TongChiTieuBanHang]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TongChiTieuBanHang](
	[userID] [int] NULL,
	[TongChiTieu] [float] NULL,
	[TongBanHang] [float] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Minh', N'Minh123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'Hai', N'Hai123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'Lam', N'Lam123', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'Tung', N'Tung123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'Viet', N'Viet123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (6, N'tuan', N'tuan123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (7, N'Cuong', N'Cuong123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (8, N'Quynh', N'Quynh123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (9, N'Thang', N'Thang123', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (10, N'Tai', N'Tai123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (11, N'Quy', N'Quy123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (12, N'Manh', N'Manh123', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (13, N'Huy', N'Huy123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (14, N'Thuy', N'Thuy123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (15, N'Duc', N'Duc123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (16, N'Quang', N'Quang123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (17, N'Nghia', N'Nghia123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (18, N'Dai', N'Dai123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (28, N'Huong', N'Huong123', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (32, N'My', N'My123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (33, N'Quynhcc', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (34, N'Vy', N'Vy123', 0, 0)

SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'N5-N4')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'N3')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'N2')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'N1')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'Combo Books')
GO
SET IDENTITY_INSERT [dbo].[DetailProduct] ON 

INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (15, 57, 9, 3, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (16, 57, 9, 35, 3)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (17, 57, 9, 4, 3)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (18, 58, 9, 46, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (19, 58, 9, 50, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (20, 58, 9, 7, 9)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (21, 59, 9, 27, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (22, 59, 9, 28, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (23, 59, 9, 31, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (24, 59, 9, 1, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (25, 60, 11, 17, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (26, 60, 11, 21, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (27, 60, 11, 24, 4)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (28, 60, 11, 49, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (29, 61, 11, 7, 2)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (30, 61, 11, 14, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (31, 62, 8, 17, 6)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (32, 62, 8, 5, 6)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (33, 63, 8, 45, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (34, 63, 8, 46, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (35, 63, 8, 52, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (36, 64, 9, 17, 5)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (37, 65, 9, 34, 1)
INSERT [dbo].[DetailProduct] ([detailID], [maHD], [accountID], [productID], [amount]) VALUES (38, 66, 9, 34, 1)
SET IDENTITY_INSERT [dbo].[DetailProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (57, 9, 375.3, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'thangnshe176011@fpt.edu.vn', N'Ngo Sy Thang', N'0123456789', N'Hoa lac', 1, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (58, 9, 1061.4, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'thangnshe176011@fpt.edu.vn', N'Ngo Sy Thang', N'0123456789', N'Hoa lac', 3, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (59, 9, 403.6, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'thangnshe176011@fpt.edu.vn', N'Ngo Sy Thang', N'0123456789', N'Hoa lac', 3, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (60, 11, 669, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'ngosythang123456@gmail.com', N'Dao Xuan Quy', N'0123456789', N'Hoa lac', 1, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (61, 11, 186.4, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'ngosythang123456@gmail.com', N'Dao Xuan Quy', N'0123456789', N'Hoa lac', 2, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (62, 8, 826, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'quynhk15c34@gmail.com', N'Nguyễn Thị Quỳnh', N'0123456789', N'Hoa lac', 3, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (63, 8, 797.4, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'quynhk15c34@gmail.com', N'Nguyễn Thị Quỳnh', N'0123456789', N'Hoa lac', 3, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (64, 9, 418.5, CAST(N'2023-11-03T00:00:00.000' AS DateTime), N'thangnshe176011@fpt.edu.vn', N'Ngo Sy Thang', N'0123456789', N'Hoa lac', 2, 5)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (65, 9, 98.4, CAST(N'2023-11-06T00:00:00.000' AS DateTime), N'thangnshe176011@fpt.edu.vn', N'Ngo Sy Thang', N'0123456789', N'Hoa lac', 2, 1)
INSERT [dbo].[Invoice] ([maHD], [accountID], [tongGia], [ngayXuat], [email], [name], [phone], [deliveryAddress], [shippingID], [statusID]) VALUES (66, 9, 148.4, CAST(N'2023-11-06T00:00:00.000' AS DateTime), N'thangnshe176011@fpt.edu.vn', N'Ngo Sy Thang', N'0123456789', N'Hoa lac', 3, 1)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (1, N'Minna no Nihongo Sơ Cấp 1 – Sách Giáo Khoa tiếng Nhật', N'https://vnjpbook.com/wp-content/uploads/2020/09/MN0001.jpg', 54.0000, N'Minna no Nihongo Sơ Cấp 1 – Sách Giáo Khoa tiếng Nhật (Bản Mới)', N'Minna no Nihongo Sơ cấp 1 – Sách Giáo Khoa tiếng Nhật tái bản lần 2 vẫn giữ nguyên cách bố trí với cấu trúc “dễ học, dễ dạy” như phiên bản cũ. Bổ sung thêm các phần luyện tập, bài tập. Nét chính trong thay đổi lần này là nâng cao khả năng vận dụng và thay đổi những từ ngữ, tình huống không còn phù hợp với dòng chảy của thời đại.', 1, 1, 83)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (2, N'Minna no Nihongo Sơ Cấp 1 – Bản Dịch Ngữ Pháp tiếng Việt', N'https://vnjpbook.com/wp-content/uploads/2020/09/MN0002.jpg', 46.0000, N'Minna no Nihongo Sơ Cấp 1 – Bản Dịch và Giải Thích Ngữ Pháp tiếng Việt (Bản Mới)', N'Minna no Nihongo Sơ cấp 1 – Bản dịch tiếng Việt là cuốn sách rất cần thiết để học song song với giáo trình Minna no Nihongo – bản tiếng Nhật. Cuốn sách giúp người mới học tiếng Nhật tiếp thu bài tốt hơn.', 1, 6, 87)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (3, N'Minna no Nihongo Sơ Cấp 1 – Bài tập Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/01MN003-2.jpg', 32.0000, N'Minna no Nihongo Sơ Cấp 1 – Bài tập Ngữ Pháp (Bản Mới)
', N'Minna no Nihongo Sơ cấp 1 – Bài tập Ngữ Pháp (Hyoujun mondaishuu) với mục đích giúp người học định hình và củng cố lại những kiến thức ngữ pháp đã học và là cuốn sách không thể thiếu để hoàn thành bộ giáo trình Minna no Nihongo Sơ cấp 1.', 1, 7, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (4, N'Minna no Nihongo Sơ cấp 2 – Sách Giáo Khoa tiếng Nhật', N'https://vnjpbook.com/wp-content/uploads/2020/09/01MN009-2.jpg', 53.0000, N'Minna no Nihongo Sơ cấp 2 – Sách Giáo Khoa tiếng Nhật (Bản Mới)
', N'Giáo trình Minna no Nihongo sơ cấp 2 – Bản tiếng Nhật là phần tiếp theo của cuốn giáo trình Minna no Nihongo sơ cấp 1 – Bản tiếng Nhật, bao gồm từ bài 26 đến bài 50.', 1, 1, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (5, N'Minna no Nihongo Sơ cấp 2 – Bản dịch tiếng Việt', N'https://vnjpbook.com/wp-content/uploads/2020/09/01MN010-2-600x849.jpg', 43.0000, N'Minna no Nihongo Sơ cấp 2 – Bản dịch tiếng Việt (Bản Mới)
', N'Giáo trình Minna no Nihongo Sơ cấp 2 – Bản dịch và giải thích ngữ pháp tiếng Việt là cuốn sách đi kèm với cuốn sách chính của bộ giáo trình Minna no Nihongo được biên soạn song song với từng bài trong bộ sách chính từ bài 26 đến bài 50.', 1, 6, 87)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (7, N'Soumatome N3 Từ Vựng', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N3029-1-2.jpg', 33.0000, N'Soumatome N3 Từ Vựng – Kèm dịch tiếng Việt
', N'Sách luyện thi N3 Soumatome Từ Vựng không những là cuốn sách luyện thi hay và hiệu quả mà còn là cuốn sách luyện từ vựng hữu ích dành cho những ai muốn nâng cao vốn từ vựng.', 2, 14, 87)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (8, N'Soumatome N3 Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N3026-1-2.jpg', 33.0000, N'Soumatome N3 Ngữ Pháp – Kèm dịch tiếng Việt', N'Sách luyện thi N3 Soumatome Ngữ Pháp là cuốn sách hay và hiệu quả. Hy vọng rằng với sách luyện thi N3 Soumatome ngữ pháp bạn học sẽ vượt qua kỳ thi N3 một cách nhẹ nhàng.', 2, 15, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (9, N'Soumatome N3 Hán Tự', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N3027-1-2.jpg', 33.0000, N'Soumatome N3 Hán Tự – Kèm dịch tiếng Việt', N'Sách luyện thi N3 Soumatome Hán tự là cuốn sách hay và hiệu quả. Hy vọng rằng với Sách luyện thi N3 Soumatome Hán tự bạn học sẽ vượt qua kỳ thi N3 một cách nhẹ nhàng.', 2, 14, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (10, N'Soumatome N3 Đọc Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N3030-1-2.jpg', 33.0000, N'Soumatome N3 Đọc Hiểu – Kèm dịch tiếng Việt', N'Sách luyện thi N3 Soumatome Đọc hiểu là cuốn sách hay và hiệu quả. Hy vọng rằng với sách luyện thi N3 Soumatome đọc hiểu bạn học sẽ vượt qua kỳ thi N3 một cách nhẹ nhàng', 2, 15, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (11, N'Soumatome N3 Nghe Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N3028-1-2.jpg', 33.0000, N'Soumatome N3 Nghe Hiểu – Kèm dịch tiếng Việt', N'Sách luyện thi N3 Soumatome Đọc hiểu là cuốn sách hay và hiệu quả. Hy vọng rằng với sách luyện thi N3 Soumatome Nghe hiểu bạn học sẽ vượt qua kỳ thi N3 một cách nhẹ nhàng', 2, 17, 97)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (12, N'Shinkanzen Master N3 Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/N3nguphap.jpg', 57.0000, N'Shinkanzen Master N3 Ngữ Pháp – Dịch tiếng Việt trọng tâm', N'Sách luyện thi N3 Shinkanzen masuta ngữ pháp là một cuốn sách luyện ngữ pháp hay và hữu ích dành riêng cho kỳ thi Năng lực Nhật ngữ N3 cũng như dành cho những ai muốn nâng cao và chuyên sâu về ngữ pháp.', 2, 19, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (13, N'Shinkanzen Master N3 Hán Tự', N'https://vnjpbook.com/wp-content/uploads/2020/09/N3hantu-600x843.jpg', 55.0000, N'Shinkanzen Master N3 Hán Tự – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N3 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N3: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 2, 5, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (14, N'Shinkanzen Master N3 Nghe Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N3nghehieu.jpg', 58.0000, N'Shinkanzen Master N3 Nghe Hiểu – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N3 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N3: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 2, 1, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (15, N'Shinkanzen Master N3 Đọc Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N3dochieu.jpg', 58.0000, N'Shinkanzen Master N3 Đọc Hiểu – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N3 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N3: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 2, 6, 89)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (16, N'Shinkanzen Master N3 Từ Vựng', N'https://vnjpbook.com/wp-content/uploads/2020/09/N3tuvung-600x858.jpg', 58.0000, N'Shinkanzen Master N3 Từ Vựng – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N3 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N3: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 2, 7, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (17, N'Shinkanzen Master N2 Từ Vựng', N'https://vnjpbook.com/wp-content/uploads/2020/09/N2-tuvung-2-600x839.jpg', 67.0000, N'Shinkanzen Master N2 Từ Vựng – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 1, 85)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (18, N'Shinkanzen Master N2 Nghe Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N2-nghehieu-2-600x851.jpg', 58.0000, N'Shinkanzen Master N2 Nghe Hiểu – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 7, 104)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (19, N'Shinkanzen Master N2 Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/N2-nguphap-2-600x841.jpg', 58.0000, N'Shinkanzen Master N2 Ngữ Pháp – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 7, 105)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (20, N'Shinkanzen Master N2 Hán Tự', N'https://vnjpbook.com/wp-content/uploads/2020/09/shinkanzen-master-N2-han-tu-kanji-co-tieng-viet-1-600x846.jpg', 58.0000, N'Shinkanzen Master N2 Hán Tự – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 5, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (21, N'Shinkanzen Master N2 Đọc Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N2-dochieu-2-600x831.jpg', 58.0000, N'Shinkanzen Master N2 Đọc Hiểu – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 7, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (22, N'Soumatome N2 Từ Vựng', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N2029-2.jpg', 39.0000, N'Soumatome N2 Từ Vựng – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 7, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (23, N'Soumatome N2 Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N2026-2.jpg', 39.0000, N'Soumatome N2 Ngữ Pháp – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 10, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (24, N'Soumatome N2 Hán Tự', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N2027-2.jpg', 39.0000, N'Soumatome N2 Hán Tự – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 1, 87)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (26, N'Soumatome N2 Nghe Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N2028-2.jpg', 39.0000, N'Soumatome N2 Nghe Hiểu – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N2: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 3, 5, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (27, N'Shinkanzen Master N1 Từ Vựng', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N1006-2.jpg', 74.0000, N'Shinkanzen Master N1 Từ Vựng – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 9, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (28, N'Shinkanzen Master N1 Nghe Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N113-2.jpg', 74.0000, N'Shinkanzen Master N1 Nghe Hiểu – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 9, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (29, N'Shinkanzen Master N1 Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/N110-2.jpg', 74.0000, N'Shinkanzen Master N1 Ngữ Pháp – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 9, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (30, N'Shinkanzen Master N1 Hán Tự', N'https://vnjpbook.com/wp-content/uploads/2020/09/N111-2.jpg', 74.0000, N'Shinkanzen Master N1 Hán Tự – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 5, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (31, N'Shinkanzen Master N1 Đọc Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N112-2.jpg', 74.0000, N'Shinkanzen Master N1 Đọc Hiểu – Dịch tiếng Việt trọng tâm', N'Shinkanzen master N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 6, 94)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (32, N'Soumatome N1 Từ Vựng', N'https://vnjpbook.com/wp-content/uploads/2020/09/N101-2-600x826.jpg', 44.0000, N'Soumatome N1 Từ Vựng – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 7, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (33, N'Soumatome N1 Ngữ Pháp', N'https://vnjpbook.com/wp-content/uploads/2020/09/N102-2-600x814.jpg', 44.0000, N'Soumatome N1 Ngữ Pháp – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 9, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (34, N'Soumatome N1 Hán Tự', N'https://vnjpbook.com/wp-content/uploads/2020/09/N103-2-600x814.jpg', 44.0000, N'Soumatome N1 Hán Tự – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 9, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (35, N'Soumatome N1 Đọc Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/01N1004-2.jpg', 44.0000, N'Soumatome N1 Đọc Hiểu – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 10, 95)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (36, N'Soumatome N1 Nghe Hiểu', N'https://vnjpbook.com/wp-content/uploads/2020/09/N105-2.jpg', 44.0000, N'Soumatome N1 Nghe Hiểu – Kèm chú thích tiếng Việt', N'Soumatome N2 là bộ sách luyện thi được đông đảo học giả yêu thích và lựa chọn. Bộ sách này bao gồm đầy đủ các kỹ năng tương ứng với các phần thi của đề thi N1: sách luyện kỹ năng hán tự, từ vựng, ngữ pháp,  nghe hiểu và đọc hiểu', 4, 9, 84)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (45, N'Bộ Minna no Nihongo Sơ Cấp 1 Bản Mới – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2022/10/bo-5q-Minna-1-moi-600x842.jpg', 203.0000, N'Bộ Minna no Nihongo Sơ Cấp 1 Bản Mới – Bộ 5 cuốn (Sách in màu)', N'Bộ giáo trình Minna no Nihongo Trình độ N5 là bộ sách tiếng Nhật cần thiết dành cho các bạn đã hoàn thành xong 2 bảng chữ cái Hiragana, Katakana và muốn học tiếng Nhật lâu dài. Tất cả các bài tập trong sách đều đi kèm đáp án, do đó đây là bộ sách hiệu quả giúp bạn tự học tại nhà.', 5, 11, 81)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (46, N'Bộ Minna no Nihongo Sơ Cấp 2 – Bộ 7 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-7q-minna-2-moi-600x842.jpg', 278.0000, N'Bộ Minna no Nihongo Sơ Cấp 2 – Bộ 7 cuốn (Sách in màu)', N'Bộ giáo trình Minna no Nihongo Trình độ N5 là bộ sách tiếng Nhật cần thiết dành cho các bạn đã hoàn thành xong 2 bảng chữ cái Hiragana, Katakana và muốn học tiếng Nhật lâu dài. Tất cả các bài tập trong sách đều đi kèm đáp án, do đó đây là bộ sách hiệu quả giúp bạn tự học tại nhà.', 5, 11, 94)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (47, N'Bộ Shinkanzen Masuta N4 – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-5q-shinkanzen-N4-1-600x842.jpg', 204.0000, N'Bộ Shinkanzen Masuta N4 – Bộ 5 cuốn (Dịch tiếng Việt trọng tâm)', N'Bộ sách Shinkanzen Masuta N4 bao gồm 5 quyển với 4 kĩ năng như sau:

Shinkanzen Masuta –　Từ vựng

Shinkanzen Masuta – Ngữ Pháp

Shinkanzen Masuta – Hán Tự

Shinkanzen Masuta – Đọc Hiểu

Shinkanzen Masuta – Nghe Hiểu', 5, 11, 100)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (48, N'Bộ Shinkanzen Masuta N3 – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/Shinkanzen-N3-MCB-logo-600x842.jpg', 264.0000, N'Bộ Shinkanzen Masuta N3 – Bộ 5 cuốn (Dịch tiếng Việt trọng tâm)', N'Bộ sách Shinkanzen Masuta N3 bao gồm 5 quyển với 5 kĩ năng như sau:

1. Shinkanzen Masuta N3 – Từ vựng

2. Shinkanzen Masuta N3 – Ngữ pháp

3. Shinkanzen Masuta N3 – Hán tự

4. Shinkanzen Masuta N3 – Đọc hiểu

5. Shinkanzen Masuta N3 – Nghe hiểu', 5, 11, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (49, N'Bộ Shinkanzen Masuta N2 – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-5q-shinkanzen-N2-600x842.jpg', 309.0000, N'Bộ Shinkanzen Masuta N2 – Bộ 5 cuốn (Dịch tiếng Việt chi tiết)', N'Bộ sách Shinkanzen Masuta N2 bao gồm 5 quyển với 5 kĩ năng như sau:

1. Shinkanzen Masuta N2 – Từ vựng

2. Shinkanzen Masuta N2 – Ngữ pháp

3. Shinkanzen Masuta N2 – Hán tự

4. Shinkanzen Masuta N2 – Đọc hiểu

5. Shinkanzen Masuta N2 – Nghe hiểu', 5, 11, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (50, N'Bộ Shinkanzen Masuta N1 – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-5q-shinkanzen-N1-600x842.jpg', 299.0000, N'Bộ Shinkanzen Masuta N1 – Bộ 5 cuốn (Dịch tiếng Việt chi tiết)', N'Bộ sách Shinkanzen Masuta N1 bao gồm 5 quyển với 5 kĩ năng như sau:

1. Shinkanzen Masuta N1 – Từ vựng

2. Shinkanzen Masuta N1 – Ngữ pháp

3. Shinkanzen Masuta N1 – Hán tự

4. Shinkanzen Masuta N1 – Đọc hiểu

5. Shinkanzen Masuta N1 – Nghe hiểu', 5, 11, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (51, N'Bộ Somatome N1 – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-5q-soumatome-N1-600x842.jpg', 185.0000, N'Bộ Somatome N1 – Bộ 5 cuốn (Kèm chú thích tiếng Việt)', N'Soumatome N1 bản tiếng việt là một phần trong bộ sách luyện thi N3 Soumatome bao gồm tất cả các kỹ năng cần thiết cho kỳ thi này bao gồm: từ vựng, ngữ pháp, hán tự, đọc hiểu và nghe hiểu.', 5, 11, 99)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (52, N'Bộ Soumatome N3 – Bộ 5 cuốn', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-5q-soumatome-N3-600x842.jpg', 153.0000, N'Bộ Soumatome N3 – Bộ 5 cuốn (Kèm chú thích tiếng Việt)', N'Soumatome N3 bản tiếng việt là một phần trong bộ sách luyện thi N3 Soumatome bao gồm tất cả các kỹ năng cần thiết cho kỳ thi này bao gồm: từ vựng, ngữ pháp, hán tự, đọc hiểu và nghe hiểu.', 5, 11, 98)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [quantity]) VALUES (53, N'Bộ Sách Shin Nihongo 500 Câu Hỏi Luyện Thi N5 – N1', N'https://vnjpbook.com/wp-content/uploads/2020/09/bo-5q-soumatome-N3-600x842.jpg', 153.0000, N'Bộ Sách Shin Nihongo 500 Câu Hỏi Luyện Thi N5 – N1 (Kèm chú thích tiếng Việt)', N'Điểm đặc biệt là sách được thiết kế theo ngày, mỗi ngày người học có thể ôn cả 3 kỹ năng : Từ vựng, Ngữ pháp, Hán tự chỉ với 15 phút.
Khổ sách cầm tay, thuận tiện cho người học có thể học mọi lúc mọi nơi.
Tập hợp 500 câu hỏi thường gặp trong đề thi Năng lực Nhật ngữ.
Ôn cả Từ vựng, Hán tự, Ngữ pháp chỉ với 01 quyển sách nhỏ gọn.', 5, 11, 100)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (9, 1, N'Good', CAST(N'2023-10-26' AS Date), 1)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (9, 1, N'gg', CAST(N'2023-10-26' AS Date), 2)
INSERT [dbo].[Review] ([accountID], [productID], [contentReview], [dateReview], [maReview]) VALUES (9, 1, N'gg', CAST(N'2023-10-26' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([sID], [name], [price], [day]) VALUES (1, N'Normal Shipping                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', 20.0000, 5)
INSERT [dbo].[Shipping] ([sID], [name], [price], [day]) VALUES (2, N'Fast Shipping                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 50.0000, 3)
INSERT [dbo].[Shipping] ([sID], [name], [price], [day]) VALUES (3, N'Express Shipping                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 100.0000, 1)
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (3, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (50, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (7, 11)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (1, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (17, 12)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (21, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (24, 4)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (49, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (14, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (5, 6)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (52, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (34, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (35, 3)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (46, 2)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (31, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (28, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (4, 3)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (27, 1)
INSERT [dbo].[SoLuongDaBan] ([productID], [soLuongDaBan]) VALUES (45, 1)
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([stID], [status], [statusID]) VALUES (1, N'Ordered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', NULL)
INSERT [dbo].[Status] ([stID], [status], [statusID]) VALUES (2, N'In Transit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', NULL)
INSERT [dbo].[Status] ([stID], [status], [statusID]) VALUES (3, N'Out for delivery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', NULL)
INSERT [dbo].[Status] ([stID], [status], [statusID]) VALUES (4, N'Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', NULL)
INSERT [dbo].[Status] ([stID], [status], [statusID]) VALUES (5, N'Cancelled                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (7, 0, 90)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (10, 0, 132)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (1, 0, 1231)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (11, 855.4, 1520)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (14, 0, 363)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (9, 2505.64, 236)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (8, 1623.4, 0)
INSERT [dbo].[TongChiTieuBanHang] ([userID], [TongChiTieu], [TongBanHang]) VALUES (6, 0, 332)
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[DetailProduct]  WITH CHECK ADD  CONSTRAINT [FK_DetailProduct_Invoice] FOREIGN KEY([maHD])
REFERENCES [dbo].[Invoice] ([maHD])
GO
ALTER TABLE [dbo].[DetailProduct] CHECK CONSTRAINT [FK_DetailProduct_Invoice]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Account]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Shipping] FOREIGN KEY([shippingID])
REFERENCES [dbo].[Shipping] ([sID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Shipping]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([stID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Status]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Product]
GO
ALTER TABLE [dbo].[SoLuongDaBan]  WITH CHECK ADD  CONSTRAINT [FK_SoLuongDaBan_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[SoLuongDaBan] CHECK CONSTRAINT [FK_SoLuongDaBan_Product]
GO
ALTER TABLE [dbo].[TongChiTieuBanHang]  WITH CHECK ADD  CONSTRAINT [FK_TongChiTieuBanHang_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[TongChiTieuBanHang] CHECK CONSTRAINT [FK_TongChiTieuBanHang_Account]
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatSoLuongDaBan]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CapNhatSoLuongDaBan] @productID int, @soLuongBanThem int
as
begin
	update SoLuongDaBan set [soLuongDaBan]=[soLuongDaBan] + @soLuongBanThem where productID=@productID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongBanHang]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_CapNhatTongBanHang] @sell_ID int, @banHangThem float
as
begin
	update TongChiTieuBanHang set TongBanHang= TongBanHang + @banHangThem where [userID]=@sell_ID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_CapNhatTongChiTieu]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_CapNhatTongChiTieu] @userID int, @chiTieuThem float
as
begin
	update TongChiTieuBanHang set TongChiTieu= TongChiTieu + @chiTieuThem where [userID]=@userID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_GiamSoLuongBanHang]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GiamSoLuongBanHang] @productID int, @soLuongBanThem int
as
begin
	update SoLuongDaBan set [soLuongDaBan]=[soLuongDaBan] - @soLuongBanThem where productID=@productID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_GiamTienTongBanHang]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GiamTienTongBanHang] @sell_ID int, @banHangThem float
as
begin
	update TongChiTieuBanHang set TongBanHang= TongBanHang - @banHangThem where [userID]=@sell_ID
end
GO
/****** Object:  StoredProcedure [dbo].[proc_GiamTienTongChiTieu]    Script Date: 11/10/2023 8:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GiamTienTongChiTieu] @userID int, @chiTieuThem float
as
begin
	update TongChiTieuBanHang set TongChiTieu= TongChiTieu - @chiTieuThem where [userID]=@userID
end
GO
USE [master]
GO
ALTER DATABASE [Honya] SET  READ_WRITE 
GO
