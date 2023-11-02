USE [master]
GO
/****** Object:  Database [StoreStore]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE DATABASE [StoreStore]
GO
ALTER DATABASE [StoreStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StoreStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StoreStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreStore] SET  MULTI_USER 
GO
ALTER DATABASE [StoreStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StoreStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [StoreStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StoreStore]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [nvarchar](450) NOT NULL,
	[ColorName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginID] [nvarchar](450) NOT NULL,
	[LoginName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleID] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [nvarchar](450) NOT NULL,
	[OrderID] [nvarchar](450) NOT NULL,
	[ProductID] [nvarchar](450) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [nvarchar](450) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nvarchar](450) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[ProductImagePath] [nvarchar](max) NOT NULL,
	[ColorID] [nvarchar](450) NOT NULL,
	[SizeID] [nvarchar](450) NOT NULL,
	[TypeID] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [nvarchar](450) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [nvarchar](450) NOT NULL,
	[SizeName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [nvarchar](450) NOT NULL,
	[TypeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/2/2023 10:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[LoginID] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO01', N'Màu đỏ')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO02', N'Màu xanh')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO03', N'Màu vàng')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO04', N'Màu trắng')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO05', N'Màu đen')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO06', N'Màu cam')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO07', N'Màu hồng')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO08', N'Màu tím')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO09', N'Màu xám')
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (N'CO10', N'Màu nâu')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO01', N'User1', N'password1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO02', N'User2', N'password2', N'R002')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO03', N'User3', N'password3', N'R002')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO1', N'aaa', N'1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO10', N'111111', N'1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO11', N'aaa', N'1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO15', N'aaa', N'1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO7', N'aaa', N'1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO8', N'aaa', N'1', N'R001')
GO
INSERT [dbo].[Login] ([LoginID], [LoginName], [Password], [RoleID]) VALUES (N'LO9', N'11111', N'1', N'R001')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD01', N'OR01', N'PR01', 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD02', N'OR02', N'PR02', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD03', N'OR02', N'PR03', 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD04', N'OR03', N'PR01', 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD05', N'OR03', N'PR04', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD06', N'OR06', N'PR06', 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD07', N'OR06', N'PR07', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD08', N'OR07', N'PR08', 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD09', N'OR07', N'PR09', 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD10', N'OR08', N'PR10', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD11', N'OR08', N'PR11', 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD12', N'OR09', N'PR12', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD13', N'OR09', N'PR13', 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD14', N'OR10', N'PR14', 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD15', N'OR10', N'PR15', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD16', N'OR16', N'PR16', 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD17', N'OR16', N'PR17', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD18', N'OR17', N'PR18', 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD19', N'OR17', N'PR19', 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD20', N'OR18', N'PR20', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD21', N'OR18', N'PR21', 3)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD22', N'OR19', N'PR22', 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD23', N'OR19', N'PR23', 4)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD24', N'OR20', N'PR24', 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (N'OD25', N'OR20', N'PR25', 2)
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR01', N'US002', CAST(N'2023-10-30T08:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR02', N'US002', CAST(N'2023-10-30T08:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR03', N'US002', CAST(N'2023-10-30T09:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR04', N'US002', CAST(N'2023-10-30T09:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR05', N'US002', CAST(N'2023-10-30T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR06', N'US002', CAST(N'2023-10-31T08:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR07', N'US002', CAST(N'2023-10-31T08:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR08', N'US002', CAST(N'2023-10-31T09:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR09', N'US002', CAST(N'2023-10-31T09:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR10', N'US002', CAST(N'2023-10-31T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR11', N'US002', CAST(N'2023-10-31T10:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR12', N'US002', CAST(N'2023-10-31T11:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR13', N'US002', CAST(N'2023-10-31T11:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR14', N'US002', CAST(N'2023-10-31T12:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR15', N'US002', CAST(N'2023-10-31T12:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR16', N'US002', CAST(N'2023-10-31T08:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR17', N'US002', CAST(N'2023-10-31T08:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR18', N'US002', CAST(N'2023-10-31T09:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR19', N'US002', CAST(N'2023-10-31T09:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR20', N'US002', CAST(N'2023-10-31T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR21', N'US002', CAST(N'2023-10-31T10:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR22', N'US002', CAST(N'2023-10-31T11:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR23', N'US002', CAST(N'2023-10-31T11:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR24', N'US002', CAST(N'2023-10-31T12:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [CreatedDate]) VALUES (N'OR25', N'US002', CAST(N'2023-10-31T12:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR01', N'S?n ph?m 1', CAST(29.99 AS Decimal(18, 2)), N'/img/product/1.png', N'CO01', N'SI01', N'TY01')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR02', N'S?n ph?m 2', CAST(39.99 AS Decimal(18, 2)), N'/img/product/2.png', N'CO02', N'SI02', N'TY02')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR03', N'S?n ph?m 3', CAST(19.99 AS Decimal(18, 2)), N'/img/product/3.png', N'CO03', N'SI03', N'TY03')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR04', N'S?n ph?m 4', CAST(49.99 AS Decimal(18, 2)), N'/img/product/4.png', N'CO04', N'SI04', N'TY04')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR05', N'S?n ph?m 5', CAST(59.99 AS Decimal(18, 2)), N'/img/product/5.png', N'CO05', N'SI05', N'TY05')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR06', N'S?n ph?m 6', CAST(29.99 AS Decimal(18, 2)), N'/img/product/6.png', N'CO06', N'SI06', N'TY06')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR07', N'S?n ph?m 7', CAST(39.99 AS Decimal(18, 2)), N'/img/product/7.png', N'CO07', N'SI07', N'TY07')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR08', N'S?n ph?m 8', CAST(19.99 AS Decimal(18, 2)), N'/img/product/8.png', N'CO08', N'SI08', N'TY08')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR09', N'S?n ph?m 9', CAST(49.99 AS Decimal(18, 2)), N'/img/product/9.png', N'CO09', N'SI09', N'TY09')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR10', N'S?n ph?m 10', CAST(59.99 AS Decimal(18, 2)), N'/img/product/10.png', N'CO10', N'SI10', N'TY10')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR11', N'S?n ph?m 11', CAST(29.99 AS Decimal(18, 2)), N'/img/product/11.png', N'CO01', N'SI01', N'TY01')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR12', N'S?n ph?m 12', CAST(39.99 AS Decimal(18, 2)), N'/img/product/12.png', N'CO02', N'SI02', N'TY02')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR13', N'S?n ph?m 13', CAST(19.99 AS Decimal(18, 2)), N'/img/product/13.png', N'CO03', N'SI03', N'TY03')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR14', N'S?n ph?m 14', CAST(49.99 AS Decimal(18, 2)), N'/img/product/14.png', N'CO04', N'SI04', N'TY04')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR15', N'S?n ph?m 15', CAST(59.99 AS Decimal(18, 2)), N'/img/product/15.png', N'CO05', N'SI05', N'TY05')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR16', N'S?n ph?m 16', CAST(29.99 AS Decimal(18, 2)), N'/img/product/16.png', N'CO01', N'SI01', N'TY01')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR17', N'S?n ph?m 17', CAST(39.99 AS Decimal(18, 2)), N'/img/product/17.png', N'CO02', N'SI02', N'TY02')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR18', N'S?n ph?m 18', CAST(19.99 AS Decimal(18, 2)), N'/img/product/18.png', N'CO03', N'SI03', N'TY03')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR19', N'S?n ph?m 19', CAST(49.99 AS Decimal(18, 2)), N'/img/product/19.png', N'CO04', N'SI04', N'TY04')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR20', N'S?n ph?m 20', CAST(59.99 AS Decimal(18, 2)), N'/img/product/20.png', N'CO05', N'SI05', N'TY05')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR21', N'S?n ph?m 21', CAST(29.99 AS Decimal(18, 2)), N'/img/product/21.png', N'CO06', N'SI06', N'TY06')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR22', N'S?n ph?m 22', CAST(39.99 AS Decimal(18, 2)), N'/img/product/22.png', N'CO07', N'SI07', N'TY07')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR23', N'S?n ph?m 23', CAST(19.99 AS Decimal(18, 2)), N'/img/product/23.png', N'CO08', N'SI08', N'TY08')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR24', N'S?n ph?m 24', CAST(49.99 AS Decimal(18, 2)), N'/img/product/24.png', N'CO09', N'SI09', N'TY09')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductPrice], [ProductImagePath], [ColorID], [SizeID], [TypeID]) VALUES (N'PR25', N'S?n ph?m 25', CAST(59.99 AS Decimal(18, 2)), N'/img/product/25.png', N'CO10', N'SI10', N'TY10')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (N'R001', N'Admin', N'Vai trò quản trị viên')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (N'R002', N'User', N'Vai trò người dùng thông thường')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (N'R003', N'Employee', N'Vai trò nhân viên')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI01', N'S', N'Kích thước cho đồ nhỏ')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI02', N'M', N'Kích thước tiêu chuẩn')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI03', N'L', N'Kích thước cho đồ lớn')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI04', N'XL', N'Kích thước rất lớn')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI05', N'XXL', N'Kích thước siêu lớn')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI06', N'N1', N'Kích thước mới 1')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI07', N'N2', N'Kích thước mới 2')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI08', N'N3', N'Kích thước mới 3')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI09', N'N4', N'Kích thước mới 4')
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [Description]) VALUES (N'SI10', N'N5', N'Kích thước mới 5')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY01', N'Loại A')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY02', N'Loại B')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY03', N'Loại C')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY04', N'Loại D')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY05', N'Loại E')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY06', N'Loại F')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY07', N'Loại G')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY08', N'Loại H')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY09', N'Loại I')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (N'TY10', N'Loại J')
GO
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Phone], [Address], [LoginID]) VALUES (N'US001', N'Quản trị Viên', N'admin@example.com', N'123456789', N'123 Đường Quản trị, Hà Nội', N'LO01')
GO
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Phone], [Address], [LoginID]) VALUES (N'US002', N'Người dùng khách hàng 1', N'customer1@example.com', N'987654321', N'456 Đường Khách hàng, Hà Nội', N'LO02')
GO
INSERT [dbo].[Users] ([UserID], [Name], [Email], [Phone], [Address], [LoginID]) VALUES (N'US003', N'Người dùng nhân viên 1', N'employee1@example.com', N'789123456', N'789 Đường Nhân viên, Hà Nội', N'LO03')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Login_RoleID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Login_RoleID] ON [dbo].[Login]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderDetails_OrderID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderID] ON [dbo].[OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderDetails_ProductID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductID] ON [dbo].[OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_UserID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserID] ON [dbo].[Orders]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_ColorID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_ColorID] ON [dbo].[Products]
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_SizeID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_SizeID] ON [dbo].[Products]
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_TypeID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_TypeID] ON [dbo].[Products]
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_LoginID]    Script Date: 11/2/2023 10:58:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_LoginID] ON [dbo].[Users]
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Roles_RoleID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Colors_ColorID] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Colors] ([ColorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Colors_ColorID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sizes_SizeID] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Sizes] ([SizeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sizes_SizeID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Types_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Types_TypeID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Login_LoginID] FOREIGN KEY([LoginID])
REFERENCES [dbo].[Login] ([LoginID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Login_LoginID]
GO
USE [master]
GO
ALTER DATABASE [StoreStore] SET  READ_WRITE 
GO
