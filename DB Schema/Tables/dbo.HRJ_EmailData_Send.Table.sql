USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[HRJ_EmailData_Send]    Script Date: 4/18/2024 3:55:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRJ_EmailData_Send](
	[Region] [nvarchar](100) NULL,
	[Dealer code] [nvarchar](100) NOT NULL,
	[Customer_Name] [nvarchar](1000) NULL,
	[HRJ SKU code] [nvarchar](100) NULL,
	[HRJ Parent SKU code] [nvarchar](100) NULL,
	[HRJ SKU Description] [nvarchar](1000) NULL,
	[Dealer's SKU Description] [nvarchar](100) NULL,
	[Division] [nvarchar](100) NULL,
	[bufferSize] [nvarchar](100) NULL,
	[inventoryAtSite] [nvarchar](100) NULL,
	[InventoryAtTransit] [nvarchar](100) NULL,
	[Suggested Replenishment Qty] [nvarchar](100) NULL,
	[Suggested Replenishment Qty in M2] [nvarchar](100) NULL,
	[Parent code SiteColor] [nvarchar](100) NULL,
	[Parent code TransitColor] [nvarchar](100) NULL
) ON [PRIMARY]
GO
