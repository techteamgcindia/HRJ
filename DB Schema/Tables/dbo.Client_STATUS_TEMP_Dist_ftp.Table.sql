USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_Dist_ftp]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_Dist_ftp](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Inv_Transit] [nvarchar](100) NULL,
	[Dist_SKU] [nvarchar](200) NULL
) ON [PRIMARY]
GO
