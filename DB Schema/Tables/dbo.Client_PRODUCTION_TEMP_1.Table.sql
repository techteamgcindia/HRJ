USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_PRODUCTION_TEMP_1]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_PRODUCTION_TEMP_1](
	[WorkID] [nvarchar](150) NULL,
	[Plant] [nvarchar](150) NULL,
	[Customer_Code] [nvarchar](150) NULL,
	[Customer_Name] [nvarchar](150) NULL,
	[SKU] [nvarchar](150) NULL,
	[SKU_Desc] [nvarchar](200) NULL,
	[Qty] [decimal](25, 4) NULL,
	[Order_type] [nvarchar](150) NULL,
	[SO_Year] [nvarchar](10) NULL,
	[SO_Month] [nvarchar](10) NULL,
	[SO_Date] [nvarchar](10) NULL,
	[Due_Year] [nvarchar](10) NULL,
	[Due_Month] [nvarchar](10) NULL,
	[Due_Date] [nvarchar](10) NULL,
	[Net_Price] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[DC] [nvarchar](20) NULL,
	[Vendor_Code] [nvarchar](150) NULL,
	[Vendor_Name] [nvarchar](150) NULL
) ON [PRIMARY]
GO
