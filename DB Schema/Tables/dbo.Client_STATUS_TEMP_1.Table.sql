USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_1]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_1](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Inv_site] [varchar](1) NOT NULL,
	[Inv_Transit] [decimal](38, 4) NULL
) ON [PRIMARY]
GO
