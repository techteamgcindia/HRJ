USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_daily_TRANSACTIONS_TEMP_hrj_1]    Script Date: 4/18/2024 3:55:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_daily_TRANSACTIONS_TEMP_hrj_1](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_Ref] [nvarchar](100) NOT NULL,
	[movement] [nvarchar](100) NULL,
	[Adjust] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
