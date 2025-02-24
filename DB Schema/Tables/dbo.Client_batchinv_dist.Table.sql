USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_batchinv_dist]    Script Date: 4/18/2024 3:55:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_batchinv_dist](
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Batch] [nvarchar](100) NULL,
	[Distributor_Item_Name] [nvarchar](300) NULL
) ON [PRIMARY]
GO
