USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_RM_1]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_RM_1](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[INV_at_Site_Qty] [nvarchar](100) NULL,
	[Inv_at_Transit_qty] [nvarchar](100) NULL
) ON [PRIMARY]
GO
