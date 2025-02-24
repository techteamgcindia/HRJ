USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_DIST_SALE_DATA_1]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_DIST_SALE_DATA_1](
	[Distributor_code] [nvarchar](100) NULL,
	[Distributor_Name] [nvarchar](200) NULL,
	[Sold_Party] [nvarchar](300) NULL,
	[HRJ_SKU] [nvarchar](200) NULL,
	[Distributor_Item_name] [nvarchar](300) NULL,
	[Qty] [decimal](10, 2) NULL,
	[Year] [nvarchar](100) NULL,
	[Month] [nvarchar](100) NULL,
	[Day] [nvarchar](100) NULL,
	[gen_mm] [varchar](2) NULL,
	[gen_dd] [varchar](2) NULL,
	[gen_date] [datetime] NULL
) ON [PRIMARY]
GO
