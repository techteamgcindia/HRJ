USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[client_temp_batch_inv]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_temp_batch_inv](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[batch] [nvarchar](100) NULL,
	[year] [nvarchar](10) NULL,
	[month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_site_Qty] [decimal](20, 3) NULL
) ON [PRIMARY]
GO
