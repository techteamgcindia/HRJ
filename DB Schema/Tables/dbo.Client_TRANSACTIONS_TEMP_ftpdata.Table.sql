USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_TRANSACTIONS_TEMP_ftpdata]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_TRANSACTIONS_TEMP_ftpdata](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [numeric](18, 5) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL
) ON [PRIMARY]
GO
