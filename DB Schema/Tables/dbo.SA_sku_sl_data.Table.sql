USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[SA_sku_sl_data]    Script Date: 4/18/2024 3:55:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SA_sku_sl_data](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[originStockLocation] [int] NULL,
	[inventoryAtTransit] [numeric](18, 5) NOT NULL,
	[inventoryAtSite] [numeric](18, 5) NOT NULL,
	[inventoryAtProduction] [numeric](18, 5) NOT NULL,
	[inventoryNeeded] [numeric](18, 5) NOT NULL,
	[replenishmentQuantity] [numeric](18, 5) NOT NULL,
	[toReplenish] [int] NOT NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[avoidReplenishment] [bit] NOT NULL,
	[bufferSize] [numeric](18, 5) NOT NULL,
	[replenishmentPriority] [int] NULL
) ON [PRIMARY]
GO
