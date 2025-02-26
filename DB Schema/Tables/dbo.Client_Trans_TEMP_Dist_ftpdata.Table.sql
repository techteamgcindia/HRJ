USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Trans_TEMP_Dist_ftpdata]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Trans_TEMP_Dist_ftpdata](
	[TransID] [nvarchar](100) NULL,
	[SAP_validation] [nvarchar](100) NOT NULL,
	[TransType] [nvarchar](10) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[SKUName] [nvarchar](100) NULL,
	[Quantity] [decimal](10, 4) NULL,
	[year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Doc_date] [nvarchar](100) NOT NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NOT NULL,
	[adjust] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
