USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Replenishment]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Replenishment](
	[SL] [nvarchar](100) NOT NULL,
	[SKU] [nvarchar](100) NOT NULL,
	[Repl_Qty] [decimal](20, 0) NULL,
	[Origin_SL] [nvarchar](100) NOT NULL,
	[VPP] [decimal](20, 2) NULL,
	[BP Color] [varchar](6) NULL,
	[Buffer Size] [decimal](20, 0) NULL
) ON [PRIMARY]
GO
