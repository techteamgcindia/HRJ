USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_2]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_2](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_site_Qty] [varchar](1) NOT NULL,
	[Inv_at_transit_Qty] [decimal](38, 3) NULL
) ON [PRIMARY]
GO
