USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Replenishemnt_rev]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Replenishemnt_rev](
	[Stock Location] [nvarchar](100) NULL,
	[SKU] [nvarchar](100) NULL,
	[Replenishment Quantity] [decimal](20, 0) NULL,
	[Origin Stock Location] [nvarchar](100) NULL,
	[VPP] [decimal](20, 2) NULL,
	[BP Color] [varchar](6) NULL,
	[Buffer Size] [decimal](20, 0) NULL
) ON [PRIMARY]
GO
