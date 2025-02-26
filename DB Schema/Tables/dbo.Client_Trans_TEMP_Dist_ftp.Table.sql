USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Trans_TEMP_Dist_ftp]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Trans_TEMP_Dist_ftp](
	[TransID] [nvarchar](100) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](10) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[SKUName] [nvarchar](100) NULL,
	[Quantity] [decimal](10, 4) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL,
	[Dist_SKU] [nvarchar](200) NULL
) ON [PRIMARY]
GO
