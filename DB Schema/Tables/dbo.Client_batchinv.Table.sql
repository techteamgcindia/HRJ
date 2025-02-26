USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_batchinv]    Script Date: 4/18/2024 3:55:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_batchinv](
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Batch] [nvarchar](100) NULL
) ON [PRIMARY]
GO
