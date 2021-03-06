USE [master]
GO
/****** Object:  Database [QL_BanHoa]    Script Date: 11/18/2019 11:48:59 AM ******/
CREATE DATABASE [QL_BanHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_BanHoa', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_BanHoa.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_BanHoa_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_BanHoa_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_BanHoa] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_BanHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_BanHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_BanHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_BanHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_BanHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_BanHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_BanHoa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QL_BanHoa] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BanHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_BanHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BanHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_BanHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_BanHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_BanHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_BanHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_BanHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_BanHoa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_BanHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_BanHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_BanHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_BanHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_BanHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_BanHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_BanHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_BanHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_BanHoa] SET  MULTI_USER 
GO
ALTER DATABASE [QL_BanHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_BanHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_BanHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_BanHoa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_BanHoa]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[TaikhoanAD] [nchar](10) NULL,
	[MatKhauAD] [nchar](50) NULL,
	[TenAD] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blogs](
	[MaBlogs] [nvarchar](50) NOT NULL,
	[TieuDe] [nvarchar](50) NULL,
	[NoiDung] [varchar](1) NULL,
	[MaHoa] [char](7) NULL,
 CONSTRAINT [pk_Blogs] PRIMARY KEY CLUSTERED 
(
	[MaBlogs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChitietHDBan]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChitietHDBan](
	[MaHD] [int] NOT NULL,
	[MaHoa] [char](7) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK_ChitietHDBan] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HDBan]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HDBan](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayBan] [date] NULL,
	[MaKH] [int] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_HDBan] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hoa]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hoa](
	[MaHoa] [char](7) NOT NULL,
	[TenHoa] [nvarchar](50) NULL,
	[MaLoai] [char](3) NULL,
	[HinhAnh] [varchar](50) NULL,
	[Giaban] [int] NULL,
	[SoLuong] [int] NULL,
	[Mota] [nvarchar](400) NULL,
 CONSTRAINT [PK_MatHang] PRIMARY KEY CLUSTERED 
(
	[MaHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [char](10) NULL,
	[TaiKhoan] [nchar](50) NULL,
	[MatKhau] [nchar](50) NULL,
	[Email] [nchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiHoa]    Script Date: 11/18/2019 11:48:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiHoa](
	[MaLoai] [char](3) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[YNghia] [nvarchar](4000) NULL,
 CONSTRAINT [PK_LoaiHoa] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([TaikhoanAD], [MatKhauAD], [TenAD]) VALUES (N'minhthu090', N'123456                                            ', N'Minh thư')
INSERT [dbo].[Admin] ([TaikhoanAD], [MatKhauAD], [TenAD]) VALUES (N'nhatlam313', N'123456                                            ', N'Nhật Lâm')
SET IDENTITY_INSERT [dbo].[HDBan] ON 

INSERT [dbo].[HDBan] ([MaHD], [NgayBan], [MaKH], [TongTien]) VALUES (9, CAST(0x64400B00 AS Date), 5, NULL)
SET IDENTITY_INSERT [dbo].[HDBan] OFF
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00000', N'Hoa hồng đỏ', N'HDC', N'HC0.jfif', 120000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00001', N'Hoa hồng trắng ngọc trai', N'HDC', N'HC1.jpg', 180000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00002', N'Hoa cúc đỏ', N'HDC', N'HC2.jfif', 150000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00003', N'Hoa hồng trắng ngọc trai', N'HDC', N'HC3.jpg', 100000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00004', N'Hoa hồng', N'HDC', N'HC4.jpg', 220000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00005', N'Hoa hồng trắng', N'HDC', N'HC5.jpg', 140000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00006', N'Hoa sen đá', N'HDC', N'HC6.jfif', 130000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00007', N'Hoa hồng', N'HDC', N'HC7.jpg', 120000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00008', N'Hoa cưới', N'HDC', N'HC8.jpg', 100000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00009', N'Hoa cưới', N'HDC', N'HC9.jpg', 110000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00010', N'Hoa hồng', N'HDC', N'HC10.jpg', 180000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00011', N'Hoa cẩm tú cầu', N'HDC', N'HC11.jpg', 189000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00012', N'Hoa hồng', N'HDC', N'HC12.jpg', 150000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HC00013', N'Hoa hồng ', N'HDC', N'HC13.jpg', 125000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00001', N'Hoa bi hồng', N'HLK', N'1.jfif', 120000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00002', N'Hoa bi hồng', N'HLK', N'2.jfif', 130000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00003', N'Hoa cẩm chướng', N'HLK', N'3.jfif', 100000, NULL, N'Là một thông điệp về tình yêu, lòng thủy chung, chờ đợi và niềm hy vọng mà các cô gái cài trên ngực người yêu trước khi chàng trai phải lên đường ra mặt trận.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00004', N'Hoa hồng', N'HLK', N'4.jfif', 150000, NULL, N'Hoa tượng trưng cho sự tình yêu màu hồng')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00005', N'Hoa bi xanh', N'HLK', N'5.png', 125000, NULL, N'Hoa tượng trưng cho niềm tin mãnh liệt')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00006', N'Hoa khác', N'HLK', N'6.jfif', 110000, NULL, N'Đang cập nhật...')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00007', N'Hoa bi galaxy', N'HLK', N'7.jfif', 250000, NULL, N'Hoa tượng trưng cho tình yêu tinh khiết và ngây thơ, trong trắng bởi vẻ đẹp mỏng manh, thanh tao do chính những bông hoa nhỏ xinh mang lại.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00008', N'Hoa bi xanh', N'HLK', N'8.jfif', 140000, NULL, N'Hoa tượng trưng cho tình yêu tinh khiết và ngây thơ, trong trắng bởi vẻ đẹp mỏng manh, thanh tao do chính những bông hoa nhỏ xinh mang lại.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00009', N'Hoa khác', N'HLK', N'9.jfif', 120000, NULL, N'Đang cập nhật..')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00011', N'Hoa thược dược', N'HLK', N'11.png', 95000, NULL, N'Hoa được coi là một trong số các loại hoa truyền thống của người Việt trong dịp Tết cổ truyền. Hơn thế nữa, một số người quan niệm rằng nếu không có lọ hoa thược dược cắm trên ban thờ gia tiên thì chưa được coi là Tết. ')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00012', N'Hoa khác', N'HLK', N'12.jfif', 100000, NULL, N'Đang cập nhật ... ')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00013', N'Hoa hồng vàng', N'HLK', N'13.jfif', 230000, NULL, N'Là một loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00014', N'Hoa tulip', N'HLK', N'14.jfif', 110000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00015', N'Hoa khác', N'HLK', N'15.jfif', 90000, NULL, N'Đang cập nhật ... ')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00016', N'Hoa hồng cam', N'HLK', N'16.jfif', 170000, NULL, N'Một tình yêu xuất phát từ một tình bạn thân thiết trong sáng luôn là thứ tình cảm thiêng liêng và trân trọng nhất, do đó tặng nàng một nụ hồng cánh cam sẽ thể hiện sự quan tâm và tình cảm chân thành của bạn đến nàng.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00017', N'Hoa khác', N'HLK', N'17.jfif', 180000, NULL, N'Đang cập nhật..')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00018', N'Hoa khác', N'HLK', N'18.jfif', 80000, NULL, N'Đang cập nhật')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00019', N'Hoa tulip', N'HLK', N'19.jfif', 165000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00021', N'Hoa tulip', N'HLK', N'21.jfif', 170000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00022', N'Hoa tulip cam', N'HLK', N'22.jfif', 160000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00023', N'Hoa tulip', N'HLK', N'23.jfif', 165000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00024', N'Hoa tulip trắng', N'HLK', N'24.jfif', 165000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00025', N'Hoa tulip đỏ', N'HLK', N'25.jfif', 250000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00026', N'Hoa tulip', N'HLK', N'26.jfif', 200000, NULL, N'Một loài hoa mang vẻ đẹp vô cùng rực rỡ, vẻ đẹp của nó dễ khiến người ta liên tưởng đến sự kiêu sa và xinh đẹp của một nữ hoàng đang choàng lên mình màu áo đỏ dịu dàng và thướt tha.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00029', N'Hoa khác', N'HLK', N'29.jfif', 100000, NULL, N'Đang cập nhật')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00030', N'Hoa khác', N'HLK', N'30.jpg', 115000, NULL, N'Đang cập nhật')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00031', N'Hoa cúc dại', N'HLK', N'31.jpg', 100000, NULL, N'hoa cúc dại hay còn gọi là hoa họa mi tuy mang trên mình vẻ đẹp mộc mạc, đơn sơ và giản dị nhưngi hoa cúc dại đã làm say đắm biết bao con người yêu hoa đẹp')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00032', N'Hoa ly', N'HLK', N'HL1.jpg', 200000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00033', N'Hoa ly', N'HLK', N'HL2.jpg', 220000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00034', N'Hoa ly', N'HLK', N'HL3.jpg', 220000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HK00035', N'Hoa ly', N'HLK', N'HL4.jpg', 220000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0001', N'Giỏ hoa hồng bằng gỗ', N'HKT', N'HKT1.jpg', 1500000, NULL, N'Là một loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0002', N'Lãng hoa hồng môn đỏ', N'HKT', N'HKT2.jpg', 3200000, NULL, N'Là một loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0003', N'Lãng hoa hồng mix nhiều màu', N'HKT', N'HKT3.jpg', 2100000, NULL, N'rong đó, mỗi màu sắc của hoa hông lại ẩn chứa những ý nghĩa khác nhau giúp bạn gửi đi những thông điệp đặc biệt')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0004', N'Lãng hoa hồng môn đỏ + hoa ly trắng', N'HKT', N'HKT4.jpg', 1000000, NULL, N'Là một loại hoa tượng trưng cho tình yêu được nhiều người biết đến nhất trên thế giới, là loại hoa ngọt ngào, nồng thắm mà tình yêu đã len lỏi vào từng cánh hoa, nhị hoa và cả hương thơm dịu nhẹ phảng phất...')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0005', N'Bó hoa ly trắng + cúc vàng', N'HKT', N'HKT5.jpg', 2200000, NULL, N'
Hoa cúc vàng là loại hoa có màu vàng nhiều cánh nhỏ xếp chồng lên nhau và có nhụy trắng tạo nên một tổng thể hài hòa trong một bông hoa với sự mềm mại và màu sắc tươi sáng')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0006', N'Lãng hoa cẩm chướng', N'HKT', N'HKT6.jpg', 1000000, NULL, N'Là một thông điệp về tình yêu, lòng thủy chung, chờ đợi và niềm hy vọng mà các cô gái cài trên ngực người yêu trước khi chàng trai phải lên đường ra mặt trận.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0007', N'Lãng hoa hồng xanh', N'HKT', N'HKT7.jpg', 3000000, NULL, N'sự tượng trưng cho tình yêu vĩnh cửu, chung thủy, trường tồn mãi theo thời gian, bởi màu xanh là màu của trời, của biển.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0008', N'Lãng hoa hồng tím', N'HKT', N'HKT8.jpg', 3100000, NULL, N'ột ý tưởng lý tưởng để bạn tặng quà cho những người yêu thương. Bên cạnh đó, nhiều người còn dùng hoa hồng tím trong việc trang trí phòng khách, trang trí lễ cưới, phòng tân hôn hoặc dùng làm hoa cưới cô dâu')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0009', N'Lãng hoa hồng môn đỏ', N'HKT', N'HKT9.png', 1600000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0010', N'Lãng hoa ', N'HKT', N'HKT10.png', 1000000, NULL, N'Đang cập nhật')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0011', N'Lãng hoa', N'HKT', N'HKT11.jpg', 2900000, NULL, N'ột ý tưởng lý tưởng để bạn tặng quà cho những người yêu thương. Bên cạnh đó, nhiều người còn dùng hoa hồng tím trong việc trang trí phòng khách, trang trí lễ cưới, phòng tân hôn hoặc dùng làm hoa cưới cô dâu')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0012', N'Lãng hoa hồng môn đỏ', N'HKT', N'HKT12.png', 2900000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0013', N'Lãng hoa truyền thống', N'HKT', N'HKT13.jpg', 900000, NULL, N'Đối với người Việt những cái gì thuộc về truyền thống luôn là thiêng liêng nhất. Đôi khi có thể có một vài cái không phù hợp. Nhưng chắc chắn rằng hầu hết đều sẽ là đẹp nhất, tốt nhất. Không cần đi đâu xa, những bông hoa tươi xứ Việt luôn mãi đẹp.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HKT0014', N'Lãng hoa lan', N'HKT', N'HKT14.jpg', 5000000, NULL, N'Hoa lan được người tiêu dùng ưa chuộng vì vẻ đẹp đặc sắc và các hình thức đa dạng của chúng. Cũng giống như cây lan, hoa lan hầu như có tất cả các màu trong cầu vồng và những kết hợp của các màu đó. Hoa lan nhỏ nhất chỉ bằng hạt gạo trong khi hoa lan lớn nhất có đường kính khoảng 1 m.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0001', N'Giỏ hoa sinh nhật', N'HSN', N'HSN1.jpg', 450000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0002', N'Giỏ hoa sinh nhật', N'HSN', N'HSN2.jpg', 250000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0003', N'Hoa hồng', N'HSN', N'HSN3.jpg', 300000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0004', N'Giỏ hoa sinh nhật', N'HSN', N'HSN4.jpg', 200000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0005', N'Hoa sinh nhật', N'HSN', N'HSN5.jpg', 500000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0006', N'Chậu hoa sinh nhật', N'HSN', N'HSN6.jpg', 100000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0007', N'Chậu hoa sinh nhật', N'HSN', N'HSN7.jpg', 120000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0008', N'chậu hoa sinh nhật size nhỏ', N'HSN', N'HSN8.jpg', 90000, NULL, N'Chọn loại hoa nào đẹp và ý nghĩa để tặng sinh nhật là cả một nghệ thuật. Bởi vì mỗi loài hoa đều có một ý nghĩa riêng, một thông điệp riêng muốn gửi gắm mà chỉ những người tinh ý mới có thể hiểu hết được')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0009', N'Chậu hoa hồng', N'HSN', N'HSN9.jpg', 340000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HSN0010', N'Hoa hồng đỏ', N'HSN', N'HSN10.jpg', 500000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0001', N'Hoa hướng dương', N'HTN', N'HTN1.jpg', 180000, NULL, N'Những đóa hoa hướng dương hệt như ánh mặt trời rực rỡ - chính vậy mà hướng dương được xem là loài hoa tượng trưng cho sự đam mê mãnh liệt.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0002', N'Hoa hướng dương', N'HTN', N'HTN2.jpg', 120000, NULL, N'Những đóa hoa hướng dương hệt như ánh mặt trời rực rỡ - chính vậy mà hướng dương được xem là loài hoa tượng trưng cho sự đam mê mãnh liệt.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0003', N'Hoa ly', N'HTN', N'HTN3.jpg', 140000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0004', N'Hoa hướng dương + Cẩm tú cầu', N'HTN', N'HTN4.jpg', 220000, NULL, N'Những đóa hoa hướng dương hệt như ánh mặt trời rực rỡ - chính vậy mà hướng dương được xem là loài hoa tượng trưng cho sự đam mê mãnh liệt.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0005', N'Hoa tốt nghiệp', N'HTN', N'HTN5.jpg', 110000, NULL, N'Vào những dịp lễ đặc biệt như lễ tốt nghiệp này, bố mẹ, anh chị em, bạn bè ai ai đều muốn gửi đến bạn những lời chúc tốt đẹp nhất. Một bó hoa chúc mừng tốt nghiệp đại học với những lời chúc ý nghĩa luôn là món quà tinh thần quý giá nhất.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0006', N'Hoa ly', N'HTN', N'HTN6.jpg', 135000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0007', N'Hoa ly trắng', N'HTN', N'HTN7.jpg', 200000, NULL, N'Hoa Ly từ lâu đã được mệnh danh là một loài hoa thanh cao và quý phái, nó không những tượng trưng cho sắc đẹp, đức hạnh mà còn là sự kiêu hãnh và cả tình yêu cao thượng, chung thủy.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0008', N'Hoa hồng', N'HTN', N'HTN8.jpg', 190000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0009', N'Hoa tốt nghiệp', N'HTN', N'HTN9.jpg', 155000, NULL, N'Vào những dịp lễ đặc biệt như lễ tốt nghiệp này, bố mẹ, anh chị em, bạn bè ai ai đều muốn gửi đến bạn những lời chúc tốt đẹp nhất. Một bó hoa chúc mừng tốt nghiệp đại học với những lời chúc ý nghĩa luôn là món quà tinh thần quý giá nhất.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTN0010', N'Hoa hồng trắng', N'HTN', N'HTN10.jpg', 250000, NULL, N'Hoa Hồng trắng luôn là sự lựa chọn cho mọi dịp đặc biệt, một món quà tuyệt vời để tỏ lòng yêu mến đối với một người bạn hay người ta thương yêu – đánh dấu một khởi đầu mới hoặc nói thay lời chia tay.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0001', N'Hoa hồng đỏ', N'HTY', N'HTY1.jpg', 650000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0002', N'Hoa hồng đỏ', N'HTY', N'HTY2.jpg', 430000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0003', N'Hoa hồng đỏ', N'HTY', N'HTY3.jpg', 800000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0004', N'Hoa hồng đỏ', N'HTY', N'HTY4.jpg', 280000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0005', N'Hoa hồng đỏ', N'HTY', N'HTY5.png', 160000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0006', N'Hoa hồng đỏ', N'HTY', N'HTY6.jpg', 300000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0007', N'Hoa hồng đỏ', N'HTY', N'HTY7.jpg', 520000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0008', N'Hoa hồng đỏ', N'HTY', N'HTY8.jpg', 1000000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0009', N'Hoa hồng đỏ', N'HTY', N'HTY9.jpg', 150000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0010', N'Giỏ hoa hồng trắng', N'HTY', N'HTY10.jpg', 420000, NULL, N'Hoa Hồng trắng luôn là sự lựa chọn cho mọi dịp đặc biệt, một món quà tuyệt vời để tỏ lòng yêu mến đối với một người bạn hay người ta thương yêu – đánh dấu một khởi đầu mới hoặc nói thay lời chia tay.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0011', N'Giỏ hoa hồng đỏ', N'HTY', N'HTY11.jpg', 480000, NULL, N'Hoa tượng trưng cho tình yêu nồng nàn và sự chân thành của bản thân đối với đối phương')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0012', N'Hoa hồng tím', N'HTY', N'HTY12.jpg', 990000, NULL, N'ột ý tưởng lý tưởng để bạn tặng quà cho những người yêu thương. Bên cạnh đó, nhiều người còn dùng hoa hồng tím trong việc trang trí phòng khách, trang trí lễ cưới, phòng tân hôn hoặc dùng làm hoa cưới cô dâu')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0013', N'Hoa hồng vàng', N'HTY', N'HTY13.jpg', 360000, NULL, N'thể hiện tình cảm chân thành, sự tin tưởng tuyệt đối không chút hoài nghi với người bạn đó nhưng lại không giỏi trong khoản ăn nói thì một bó hồng vàng gửi đến người bạn sẽ là lựa chọn hoàn hảo để thế hiện những suy nghĩ trực tiếp từ chính trái tim của bạn.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0014', N'Hoa hồng tím', N'HTY', N'HTY14.jpg', 1200000, NULL, N'ột ý tưởng lý tưởng để bạn tặng quà cho những người yêu thương. Bên cạnh đó, nhiều người còn dùng hoa hồng tím trong việc trang trí phòng khách, trang trí lễ cưới, phòng tân hôn hoặc dùng làm hoa cưới cô dâu')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0015', N'Hoa hồng vàng + trắng', N'HTY', N'HTY15.jpg', 520000, NULL, N'thể hiện tình cảm chân thành, sự tin tưởng tuyệt đối không chút hoài nghi với người bạn đó nhưng lại không giỏi trong khoản ăn nói thì một bó hồng vàng gửi đến người bạn sẽ là lựa chọn hoàn hảo để thế hiện những suy nghĩ trực tiếp từ chính trái tim của bạn.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0016', N'Hoa hồng xanh', N'HTY', N'HTY16.jpg', 2000000, NULL, N'sự tượng trưng cho tình yêu vĩnh cửu, chung thủy, trường tồn mãi theo thời gian, bởi màu xanh là màu của trời, của biển.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0017', N'Hoa hồng xanh', N'HTY', N'HTY17.jpg', 910000, NULL, N'sự tượng trưng cho tình yêu vĩnh cửu, chung thủy, trường tồn mãi theo thời gian, bởi màu xanh là màu của trời, của biển.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0018', N'Hoa hồng xanh', N'HTY', N'HTY18.jpg', 3500000, NULL, N'sự tượng trưng cho tình yêu vĩnh cửu, chung thủy, trường tồn mãi theo thời gian, bởi màu xanh là màu của trời, của biển.')
INSERT [dbo].[Hoa] ([MaHoa], [TenHoa], [MaLoai], [HinhAnh], [Giaban], [SoLuong], [Mota]) VALUES (N'HTY0019', N'Hoa hồng xanh', N'HTY', N'HTY19.jpg', 210000, NULL, N'sự tượng trưng cho tình yêu vĩnh cửu, chung thủy, trường tồn mãi theo thời gian, bởi màu xanh là màu của trời, của biển.')
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [TaiKhoan], [MatKhau], [Email], [NgaySinh]) VALUES (1, N'Nhat lam', NULL, N'0704567599', N'nhatlam3101                                       ', N'123                                               ', N'nhatlam12@gmail.com                               ', CAST(0x000085A000000000 AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [TaiKhoan], [MatKhau], [Email], [NgaySinh]) VALUES (2, N'nhatlam', N'long an', N'0868686956', N'lam                                               ', N'123                                               ', N'nhatlam12a3@gmail.com                             ', CAST(0x0000894E00000000 AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [TaiKhoan], [MatKhau], [Email], [NgaySinh]) VALUES (5, N'nhatlam', N'tphcm', N'0909909009', N'nhatlam1                                          ', N'nhatlam                                           ', N'nhatlam123@gmail.com                              ', CAST(0x0000746700000000 AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [TaiKhoan], [MatKhau], [Email], [NgaySinh]) VALUES (6, N'Lam', N'abcxyz', N'123456789 ', N'LamDZ                                             ', N'123                                               ', N'lamdz@gmail.com                                   ', CAST(0x00008E8F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LoaiHoa] ([MaLoai], [TenLoai], [YNghia]) VALUES (N'HDC', N'Hoa cưới', N'HOA CƯỚI là một trong những nhân vật đặc biệt không thể thiếu trong ngày đám cưới của CDCR, là yếu tố kết hợp với chiếc áo cưới tôn lên nét đẹp và sự lộng lẫy cho cô dâu. Ngoài ra, Hoa Cưới còn thể hiện tính cách, quan điểm về tình yêu nhưng không phải ai cũng hiểu hết được ý nghĩa của các loại hoa ấy. Và dưới đây sẽ là một số loại HOA CƯỚI phổ biến mà Shop chúng tôi gợi ý cho bạn nhé.
')
INSERT [dbo].[LoaiHoa] ([MaLoai], [TenLoai], [YNghia]) VALUES (N'HKT', N'Hoa khai trương', N'Vào ngày khai trương công ty, cửa hàng của người thân, bạn bè, hàng xóm… người ta thường tặng nhau hoa khai trương. Việc tặng hoa khai trương không chỉ thay cho lời chúc mừng mà nó còn là sự cầu mong may mắn cho người nhận nhân ngày họ khai trương cửa hàng kinh doanh. Sâu sắc hơn, tặng hoa khai trương còn là cách để củng cố hơn nữa tình thân, tình bạn hay tình chòm xóm giữa người tặng và người nhận')
INSERT [dbo].[LoaiHoa] ([MaLoai], [TenLoai], [YNghia]) VALUES (N'HLK', N'Hoa khác', N'Mỗi loài hoa đều có một ý nghĩa của nó, việc bạn chọn hoa góp phần thể hiện được tình cảm của mình')
INSERT [dbo].[LoaiHoa] ([MaLoai], [TenLoai], [YNghia]) VALUES (N'HSN', N'Hoa sinh nhật', N'Dịp sinh nhật bạn bè luôn là ngày đặc biệt để bạn góp vui và dành tặng những món quà ý nghĩa thể hiện sự quan tâm và tình cảm giao hảo chân thành với bạn bè mình. Tình cảm bạn bè luôn được xếp sau tình cảm gia đình. Việc tặng hoa nhân ngày sinh nhật cho bạn bè sao cho không chỉ đẹp mà còn mang ý nghĩa riêng tượng trưng cho sự chân thành và thấu hiểu của người tặng đến bạn mình.
')
INSERT [dbo].[LoaiHoa] ([MaLoai], [TenLoai], [YNghia]) VALUES (N'HTN', N'Hoa tốt nghiệp', N'Lễ tốt nghiệp là buổi lễ quan trọng, trang nghiêm, đánh dấu bước trưởng thành của một người. Lễ tốt nghiệp thường là dịp để chúc mừng một tân cử nhân đã hoàn thành 4 năm đại học, chuẩn bị bước sang trang mới của cuộc đời. Trong những ngày này, các tân cử nhân thường xuất hiện trong bộ áo tốt nghiệp vô cùng tự hào, như một bước đánh dấu kết thúc những năm tháng sinh viên.
Song đó, hoa được xem như một món quà chúc mừng, mong người nhận gặp nhiều may mắn và thành công trên con đường mình đã chọn')
INSERT [dbo].[LoaiHoa] ([MaLoai], [TenLoai], [YNghia]) VALUES (N'HTY', N'Hoa tình yêu', N'Hoa chính là món quà đơn giản thế nhưng lại chứa đựng rất nhiều tình cảm tuyệt vời, nó mang hạnh phúc đến cả cho người nhận lẫn người tặng. Tặng hoa cho người yêu chính là bí quyết giúp tạo ra và mang đến những nụ cười thật lòng nên nó hơn hẳn rất nhiều so với những món quà cùng giá trị khác.
Bonus: Bạn đang yêu xa và vào các dịp lễ đặc biệt mong muốn có thể dành cho người con gái mình yêu những đóa hoa tươi thắm và chứa đựng ý nghĩa thân thương')
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Hoa] FOREIGN KEY([MaHoa])
REFERENCES [dbo].[Hoa] ([MaHoa])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Hoa]
GO
ALTER TABLE [dbo].[ChitietHDBan]  WITH CHECK ADD  CONSTRAINT [FK_ChitietHDBan_HDBan] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HDBan] ([MaHD])
GO
ALTER TABLE [dbo].[ChitietHDBan] CHECK CONSTRAINT [FK_ChitietHDBan_HDBan]
GO
ALTER TABLE [dbo].[ChitietHDBan]  WITH CHECK ADD  CONSTRAINT [FK_ChitietHDBan_Hoa] FOREIGN KEY([MaHoa])
REFERENCES [dbo].[Hoa] ([MaHoa])
GO
ALTER TABLE [dbo].[ChitietHDBan] CHECK CONSTRAINT [FK_ChitietHDBan_Hoa]
GO
ALTER TABLE [dbo].[HDBan]  WITH CHECK ADD  CONSTRAINT [FK_HDBan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HDBan] CHECK CONSTRAINT [FK_HDBan_KhachHang]
GO
ALTER TABLE [dbo].[Hoa]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_LoaiHoa] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHoa] ([MaLoai])
GO
ALTER TABLE [dbo].[Hoa] CHECK CONSTRAINT [FK_Hoa_LoaiHoa]
GO
USE [master]
GO
ALTER DATABASE [QL_BanHoa] SET  READ_WRITE 
GO
