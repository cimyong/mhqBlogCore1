USE [master]
GO
/****** Object:  Database [blogcore]    Script Date: 2018/4/11 13:02:46 ******/
CREATE DATABASE [blogcore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blogcore', FILENAME = N'F:\Graduate\Graduate-My-Project\MakeBlog\Code\mhqBlog1\Database\blogcore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'blogcore_log', FILENAME = N'F:\Graduate\Graduate-My-Project\MakeBlog\Code\mhqBlog1\Database\blogcore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [blogcore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blogcore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blogcore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blogcore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blogcore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blogcore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blogcore] SET ARITHABORT OFF 
GO
ALTER DATABASE [blogcore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blogcore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blogcore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blogcore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blogcore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blogcore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blogcore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blogcore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blogcore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blogcore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [blogcore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blogcore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blogcore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blogcore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blogcore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blogcore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blogcore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blogcore] SET RECOVERY FULL 
GO
ALTER DATABASE [blogcore] SET  MULTI_USER 
GO
ALTER DATABASE [blogcore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blogcore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blogcore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blogcore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [blogcore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'blogcore', N'ON'
GO
ALTER DATABASE [blogcore] SET QUERY_STORE = OFF
GO
USE [blogcore]
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
USE [blogcore]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2018/4/11 13:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[username] [nvarchar](64) NULL,
	[password] [nvarchar](64) NULL,
	[remark] [nvarchar](2048) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 2018/4/11 13:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[title] [nvarchar](128) NULL,
	[body] [ntext] NULL,
	[body_md] [ntext] NULL,
	[visitnum] [int] NOT NULL,
	[cabh] [nvarchar](64) NULL,
	[caname] [nvarchar](64) NULL,
	[remark] [nvarchar](2048) NULL,
	[sort] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2018/4/11 13:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[caname] [nvarchar](64) NULL,
	[bh] [nvarchar](64) NULL,
	[pbh] [nvarchar](64) NULL,
	[remark] [nvarchar](2048) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[type] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[username] [nvarchar](64) NULL,
	[remark] [nvarchar](2048) NULL,
	[ip] [nvarchar](64) NULL,
	[ipaddress] [nvarchar](512) NULL,
 CONSTRAINT [PK_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mhq_bq]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mhq_bq](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[username] [nvarchar](64) NULL,
	[body] [ntext] NULL,
 CONSTRAINT [PK_niunan_bq] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mhq_shuqian]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mhq_shuqian](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[title] [nvarchar](300) NULL,
	[url] [nvarchar](500) NULL,
	[tag] [nvarchar](50) NULL,
	[isprivate] [int] NOT NULL,
 CONSTRAINT [PK_niunan_shuqian] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[shr] [nvarchar](64) NULL,
	[mobile] [nvarchar](64) NULL,
	[address] [nvarchar](1024) NULL,
	[remark] [nvarchar](2048) NULL,
	[status] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordermx]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordermx](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[orderid] [int] NOT NULL,
	[videoid] [int] NOT NULL,
	[videoname] [nvarchar](64) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[num] [int] NOT NULL,
	[remark] [nvarchar](2048) NULL,
 CONSTRAINT [PK_ordermx] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pageset]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pageset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[title] [nvarchar](64) NULL,
	[url] [nvarchar](512) NULL,
	[img] [nvarchar](512) NULL,
	[remark] [nvarchar](2048) NULL,
	[sort] [int] NOT NULL,
 CONSTRAINT [PK_pageset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[starttime] [datetime] NOT NULL,
	[endtime] [datetime] NOT NULL,
	[issolved] [int] NOT NULL,
	[title] [nvarchar](64) NULL,
	[body] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[username] [nvarchar](64) NULL,
	[password] [nvarchar](64) NULL,
	[face] [nvarchar](512) NULL,
	[usertype] [nvarchar](64) NULL,
	[phone] [nvarchar](64) NULL,
	[qq] [nvarchar](64) NULL,
	[email] [nvarchar](64) NULL,
	[remark] [nvarchar](2048) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 2018/4/11 13:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[title] [nvarchar](64) NULL,
	[body] [ntext] NULL,
	[visitnum] [int] NOT NULL,
	[img] [nvarchar](512) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[remark] [nvarchar](2048) NULL,
	[sort] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [PK_blog]    Script Date: 2018/4/11 13:05:01 ******/
ALTER TABLE [dbo].[blog] ADD  CONSTRAINT [PK_blog] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_task]    Script Date: 2018/4/11 13:05:01 ******/
ALTER TABLE [dbo].[task] ADD  CONSTRAINT [PK_task] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_video]    Script Date: 2018/4/11 13:05:01 ******/
ALTER TABLE [dbo].[video] ADD  CONSTRAINT [PK_video] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admin] ADD  CONSTRAINT [DF_admin_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[blog] ADD  CONSTRAINT [DF_blog_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[blog] ADD  CONSTRAINT [DF_blog_visitnum]  DEFAULT ((0)) FOR [visitnum]
GO
ALTER TABLE [dbo].[blog] ADD  CONSTRAINT [DF_blog_sort]  DEFAULT ((0)) FOR [sort]
GO
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [DF_category_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_type]  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_userid]  DEFAULT ((0)) FOR [userid]
GO
ALTER TABLE [dbo].[mhq_bq] ADD  CONSTRAINT [DF_niunan_bq_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[mhq_shuqian] ADD  CONSTRAINT [DF_niunan_shuqian_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[mhq_shuqian] ADD  CONSTRAINT [DF_niunan_shuqian_isprivate]  DEFAULT ((0)) FOR [isprivate]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_userid]  DEFAULT ((0)) FOR [userid]
GO
ALTER TABLE [dbo].[ordermx] ADD  CONSTRAINT [DF_ordermx_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[ordermx] ADD  CONSTRAINT [DF_ordermx_orderid]  DEFAULT ((0)) FOR [orderid]
GO
ALTER TABLE [dbo].[ordermx] ADD  CONSTRAINT [DF_ordermx_videoid]  DEFAULT ((0)) FOR [videoid]
GO
ALTER TABLE [dbo].[ordermx] ADD  CONSTRAINT [DF_ordermx_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[ordermx] ADD  CONSTRAINT [DF_ordermx_num]  DEFAULT ((0)) FOR [num]
GO
ALTER TABLE [dbo].[pageset] ADD  CONSTRAINT [DF_pageset_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[pageset] ADD  CONSTRAINT [DF_pageset_sort]  DEFAULT ((0)) FOR [sort]
GO
ALTER TABLE [dbo].[task] ADD  CONSTRAINT [DF_task_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[task] ADD  CONSTRAINT [DF_task_starttime]  DEFAULT (getdate()) FOR [starttime]
GO
ALTER TABLE [dbo].[task] ADD  CONSTRAINT [DF_task_endtime]  DEFAULT (getdate()) FOR [endtime]
GO
ALTER TABLE [dbo].[task] ADD  CONSTRAINT [DF_task_issolved]  DEFAULT ((0)) FOR [issolved]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[video] ADD  CONSTRAINT [DF_video_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[video] ADD  CONSTRAINT [DF_video_visitnum]  DEFAULT ((0)) FOR [visitnum]
GO
ALTER TABLE [dbo].[video] ADD  CONSTRAINT [DF_video_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[video] ADD  CONSTRAINT [DF_video_sort]  DEFAULT ((0)) FOR [sort]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'admin', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'admin', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'admin', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码，MD5加密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'admin', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'admin', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'博客表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储博客内容的markdown' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'body_md'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'visitnum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'cabh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'caname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号，从小到大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'blog', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'caname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'bh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'pbh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0后台，1前台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'userid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ip地址对应的IP纯真库里的地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'log', @level2type=N'COLUMN',@level2name=N'ipaddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'牛腩便签表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_bq', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_bq', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_bq', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'便签内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_bq', @level2type=N'COLUMN',@level2name=N'body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'书签表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_shuqian', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_shuqian', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_shuqian', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_shuqian', @level2type=N'COLUMN',@level2name=N'url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_shuqian', @level2type=N'COLUMN',@level2name=N'tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否私有' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mhq_shuqian', @level2type=N'COLUMN',@level2name=N'isprivate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'shr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态，0待付款，1待发货，2待收货' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'order', @level2type=N'COLUMN',@level2name=N'userid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'orderid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'videoid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'videoname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ordermx', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面设置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号，从小到大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pageset', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'starttime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'endtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已解决' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'issolved'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task', @level2type=N'COLUMN',@level2name=N'body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'face'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'usertype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'qq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'user', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'createdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'visitnum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列表图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号，从小到大排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'video', @level2type=N'COLUMN',@level2name=N'sort'
GO
USE [master]
GO
ALTER DATABASE [blogcore] SET  READ_WRITE 
GO
