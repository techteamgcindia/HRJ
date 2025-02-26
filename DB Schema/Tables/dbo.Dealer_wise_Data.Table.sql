USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Dealer_wise_Data]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealer_wise_Data](
	[Region] [nvarchar](100) NULL,
	[Dealer code] [nvarchar](100) NOT NULL,
	[Customer_Name] [nvarchar](1000) NULL,
	[HRJ SKU code] [nvarchar](100) NULL,
	[HRJ Parent SKU code] [nvarchar](100) NULL,
	[HRJ SKU Description] [nvarchar](1000) NULL,
	[Dealer's SKU Description] [nvarchar](100) NULL,
	[Division] [nvarchar](100) NULL,
	[bufferSize] [numeric](18, 5) NOT NULL,
	[inventoryAtSite] [numeric](18, 5) NOT NULL,
	[InventoryAtTransit] [numeric](18, 5) NOT NULL,
	[Suggested Replenishment Qty] [numeric](18, 5) NOT NULL,
	[Suggested Replenishment Qty in M2] [numeric](29, 8) NOT NULL,
	[Parent code SiteColor] [varchar](6) NULL,
	[Parent code TransitColor] [varchar](6) NULL
) ON [PRIMARY]
GO
