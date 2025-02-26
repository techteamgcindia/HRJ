USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Status_Temp_combined]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Status_Temp_combined](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_Site_Qty] [nvarchar](30) NULL,
	[Inv_at_Transit_qty] [nvarchar](30) NULL
) ON [PRIMARY]
GO
