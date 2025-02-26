USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[BATCH_WH]    Script Date: 4/18/2024 3:55:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATCH_WH](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[SLoc] [nvarchar](100) NULL,
	[Stock_at_site] [numeric](18, 5) NULL,
	[Batch] [nvarchar](100) NULL
) ON [PRIMARY]
GO
