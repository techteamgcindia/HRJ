USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_table_transanctions_csvout]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_table_transanctions_csvout](
	[Type] [varchar](10) NULL,
	[SourceStockLocation_id] [varchar](50) NULL,
	[SourceStockLocation_Name] [varchar](200) NULL,
	[DestinationStockLocation_id] [varchar](50) NULL,
	[DestinationStockLocation_Name] [varchar](200) NULL,
	[Adjust_inventory] [int] NULL,
	[SKU_id] [varchar](50) NULL,
	[SKU_Name] [varchar](200) NULL,
	[Quantity] [varchar](50) NULL,
	[CustomerOrderID] [varchar](20) NULL,
	[ReportedDateYear] [int] NULL,
	[ReportedDateMonth] [int] NULL,
	[ReportedDateDay] [int] NULL
) ON [PRIMARY]
GO
